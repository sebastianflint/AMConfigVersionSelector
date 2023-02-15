#============================================================
#   Powershell sample
#============================================================

#============================================================
#
#  For powershell 2 to work with net 4 assemblies, it is 
#          necessary to create config files containing:
#
#  <?xml version="1.0"?>
#  <configuration>
#    <startup useLegacyV2RuntimeActivationPolicy="true">
#        <supportedRuntime version="v4.0.30319"/>
#        <supportedRuntime version="v2.0.50727"/>
#    </startup>
# </configuration>
#
#  On a 64-bit system this file needs to appear as:
#     C:\Windows\System32\WindowsPowershell\v1.0\powershell.exe.config
#     C:\Windows\System32\WindowsPowershell\v1.0\powershell_ise.exe.config
#
#     C:\Windows\SysWow64\WindowsPowershell\v1.0\powershell.exe.config
#     C:\Windows\SysWow64\WindowsPowershell\v1.0\powershell_ise.exe.config
#     
#  to cover all bases
#
#============================================================

if (test-path Env:\CONFIGAPILOCATION)
{
    $configapi = "$env:CONFIGAPILOCATION\EMConfigAPI.dll"
}
else 
{
   $configapi = "$env:ProgramFiles\AppSense\Environment Manager\Console\EMConfigAPI.dll"
}

[void] [Reflection.Assembly]::LoadFrom("$configapi")

$ErrorActionPreference = "Stop"

# --- Create configuration object ---
write "Create configuration object"
$config = new-object EMConfigAPI.EMConfiguration

# --- Make new config ---
write "Make new config"
$config.NewConfig()

# --- ResumeInterruptedFolderCopyItems == CancelCopyActionsEnabled ---
$config.ResumeInterruptedFolderCopyItems = $true

# --- Add Personalization Servers ---
write "Add Personalization Servers"

$config.AddPersonalizationServer("PS1")
$config.AddPersonalizationServer("PS2","Secure server",$true,443)

# --- Auditing ---
write "Auditing"
$config.AuditingGeneralControl($true,$false,$true,$true)
$config.AuditingSetLocalLog("CSV");
$config.AuditingRaiseEventsLocally(9303,9306)

# --- Create a reusable node ---
write "Create Reusable node"

$reusableRegNodeId = $config.InsertReusableNode("Reusable registry node")
$reusableRegActionObject = new-object EMConfigAPI.Actions.RegistryCreateKey("HKEY_LOCAL_MACHINE","Software\AppSense\AnotherKey")
[void] $config.AddActionOrCondition($reusableRegNodeId,$reusableRegActionObject)

# --- Custom global settings ---
write "Custom global settings"
# numeric
$config.CustomSettingAdd("NodeTimeout",$false,40000)
# multistring
$config.CustomSettingAdd("PrinterErrorCodes",$false,201,120,112)
# bool
$config.CustomSettingAdd("UseAlternativeUserGroupTest",$false,$false)
# disable
$config.CustomSettingAdd("ADUserGroupMembershipTimeout",$true)

# --- Set Global Group Policy Location ---
write "Setting Group Policy location to be C:\Windows\PolicyDefinitions"
$config.SetGlobalGroupPolicyLocation("C:\Windows\PolicyDefinitions");

# --- Set Azure AD tenant information ---
write "Setting AAD tenant information"
$config.SetAzureActiveDirectoryTenantInformation("tenant.onmicrosoft.com", "CE5894EA-81FE-4C91-B11A-B61A041B092A", "", "My", "LocalMachine", "9249F00B4CB368E60D0CC3FDD2818859651F82B0")

# --- Create Subnode for Computer Process Start Trigger ---
write ""
write "============================="
write ""
write "Adding Computer Process Start Sub Node"
write ""
write "============================="
write ""
$computerProcessStartId = $config.AddNodeToTrigger("ComputerProcessStart", "Computer Process Start")

# Computer process name
write "Computer process name"
[Void] $config.AddActionOrCondition($computerProcessStartId, (New-Object EMConfigAPI.Conditions.ComputerProcessName("Equal","daemon.exe")))

# --- Create Subnode for Computer Process Stop Trigger ---
write ""
write "============================="
write ""
write "Adding Computer Process Stop Sub Node"
write ""
write "============================="
write ""
$computerProcessStopId = $config.AddNodeToTrigger("ComputerProcessStop", "Computer Process Stop")

# Computer process name
write "Computer process name"
[Void] $config.AddActionOrCondition($computerProcessStopId, (New-Object EMConfigAPI.Conditions.ComputerProcessName("Equal","daemon.exe")))

# --- Create Subnode for Network Available Trigger ---
write ""
write "============================="
write ""
write "Adding Network Available Sub Node"
write ""
write "============================="
write ""
$networkAvailableId = $config.AddNodeToTrigger("ComputerNetworkAvailable", "Network Available")

# --- Create Actions Subnode for UserLogonPreDesktop Trigger ---
write ""
write "============================="
write ""
write "Adding Computer Startup Sub Node 'Actions'"
write ""
write "============================="
write ""
$computerStartupActions = $config.AddNodeToTrigger("ComputerStartup", "Computer Startup Actions")

# Add reusable node to session reconnect trigger
write "Add reusable node to computer startup trigger"
[void] $config.AddReusableNodeToTrigger("ComputerStartup",$reusableRegNodeId)

write "File Director Custom Settings"
$fileDirectorStartUpNode = $config.AddNodeToParent($computerStartupActions, "File Director Custom Settings")
$fileDirectorCustomSettings = new-object EMConfigAPI.Actions.DataNowCustomSettings($false)
$fileDirectorCustomSettings.AddCustomSetting("Enable Single Sign On", "HKEY_LOCAL_MACHINE", "Software\AppSense\DataNow", "EnableSSO", "REG_DWORD", "1")
$config.AddActionOrCondition($fileDirectorStartUpNode, $fileDirectorCustomSettings)

# --- ADMX actions ---
write "ADMX actions"
$machineADMXNodeId = $config.AddNodeToParent($computerStartupActions,"Group Policy ADMX");
$ADMXMachineObject = New-Object EMConfigAPI.Actions.GroupPolicySetADMX("Machine", $true)

# --- Simple policy (no elements) ---
write "Simple policy (no elements)"
$ADMXMachineObject.EnablePolicy(@("Network","Windows Connect Now"),
                          "Prohibit Access of the Windows Connect Now Wizards")

# --- Policy with elements ---
write "Policy with elements"
$ADMXMachineObject.EnablePolicy(@("Network","Background Intelligent Transfer Service (BITS)"),
                          "Limit the maximum network bandwidth for BITS background transfers",
                          25,"5 AM","5 PM",$true,20)
# Apply permanently
$ADMXMachineObject.ApplyPolicySettingsPermanently = $true

[Void] $config.AddActionOrCondition($machineADMXNodeId,$ADMXMachineObject)

# --- Adm policy - only if we have a policy directory at c:\download\Adm ---
write "Adm policy - only if we have a policy directory at c:\download\Adm"

if (Test-Path C:\Download\ADM)
{
    
    $ADMMachineObject = New-Object EMConfigAPI.Actions.GroupPolicySetADM("Machine","C:\Download\ADM", $true)
    $ADMMachineObject.EnablePolicy(@("System","Net Logon","DC Locator DNS Records"),
                             "DC Locator DNS records not registered by the DCs",
                             "LdapIpAddress")

    [Void] $config.AddActionOrCondition(($config.AddNodeToTrigger("ComputerStartup","ADM Machine")),$ADMMachineObject)
}

# --- Self heal service ---
write "Self heal service"
$selfHealServiceId = $config.AddNodeToParent($computerStartupActions,"Self Heal");
[Void] $config.AddActionOrCondition($selfHealServiceId, (New-Object EMConfigAPI.Actions.SelfHealService("ActiveX Installer (AxInstSv)","AxInstSv","EnsureAlwaysRunning","",$false)))

# --- Check cannot add user process name to computer startup trigger ---
write "Check cannot add user process name to computer startup trigger"
write "This should throw exception but script will continue"
try
{
    $stupGuid = $config.AddNodeToTrigger("ComputerStartup", "Validation Check")
    [void] $config.AddActionOrCondition($stupGuid,(new-object EMConfigAPI.Conditions.UserProcessName("Equal", "myexe.exe")))
}
catch
{
    " --> Got expected exception: {0}" -f $_.Exception.Message
}

# --- Create Actions Subnode for Computer Shutdown Trigger ---
write ""
write "============================="
write ""
write "Adding Computer Shutdown Sub Node"
write ""
write "============================="
write ""
# --- Node groups ---
write "Node groups"
$shutdownNodeGroupId = $config.AddNodeGroupToTrigger("ComputerShutdown","Shutdown")

# add sub nodes
$subnode1 = $config.AddNodeToParent($shutdownNodeGroupId,"Subnode1")
$subnode2 = $config.AddNodeToParent($shutdownNodeGroupId,"Subnode2")

# add actions to subnodes
[Void] $config.AddActionOrCondition($subnode1,(New-Object EMConfigAPI.Actions.Execute("%ProgramFiles%\ProgramX\program1.exe", "%ProgramFiles%\ProgramX", "param1 param2")))
[Void] $config.AddActionOrCondition($subnode2,(New-Object EMConfigAPI.Actions.Execute("%ProgramFiles%\ProgramX\program2.exe", "%ProgramFiles%\ProgramX", "param8 param12")))

# add node group to node group
$subgroup = $config.AddNodeGroupToParent($shutdownNodeGroupId,"Subgroup")

# subsubnode
$subsubnode = $config.AddNodeToParent($subgroup,"subsubnode")
[Void] $config.AddActionOrCondition($subsubnode,(new-object EMConfigAPI.Actions.EnvironmentVariableAppend("EnvName", "EnvAppendedValue", ";", "System", $true)))

# reusable node
[Void] $config.AddReusableNode($subgroup,$reusableRegNodeId)

# --- Create Actions Subnode for User Logon Pre SessionTrigger ---
write ""
write "============================="
write ""
write "Adding User Logon Pre Session Sub Node 'Actions'"
write ""
write "============================="
write ""

$preSessionId = $config.AddNodeToTrigger("UserPreSession", "Pre Session Node")

# --- Create Actions Subnode for UserLogonPreDesktop Trigger ---
write ""
write "============================="
write ""
write "Adding User Logon Pre Desktop Sub Node 'Actions'"
write ""
write "============================="
write ""

$preDesktopReusableNode = $config.AddNodeToTrigger("UserPreDesktop", "Pre Desktop Reusable Node")

# --- Add same reusable node to userlogon/usergroupcondition node --
write "Add same reusable node to another trigger"
[void] $config.AddReusableNode($preDesktopReusableNode,$reusableRegNodeId)

# Create Actions Node
$preDesktopActions = $config.AddNodeToTrigger("UserPreDesktop", "Pre Desktop Actions")

# --- Custom action ---
write "Custom Action"
$customActionId = $config.AddNodeToParent($preDesktopActions, "Custom Actions")
[Void] $config.AddActionOrCondition($customActionId, (New-Object EMConfigAPI.Actions.CustomAction("Powershell","del *.*")))

#--- DataNow Actions ---
write "File Director" Action
$fileDirectorLogonNodeId = $config.AddNodeToParent($preDesktopActions, "File Director User Action")
$config.AddActionOrCondition($fileDirectorLogonNodeId, (new-object EMConfigAPI.Actions.DataNowUser($true, "Home", "Documents", "Pictures", "Videos", "Music")))


# --- Drive Actions ---
write "Drive Actions"
$driveActionsId = $config.AddNodeToParent($preDesktopActions, "Drive Actions")

# Map Drive
[void] $config.AddActionOrCondition($driveActionsId, (new-object EMConfigAPI.Actions.DriveMap("Z", "\\server\share", $true)))

# Unmap Drive
[void] $config.AddActionOrCondition($driveActionsId, (new-object EMConfigAPI.Actions.DriveUnmap("Z")))

# --- Environment Variable Actions ---
write "Environment Variable Actions"
$environmentVariableActionId = $config.AddNodeToParent($preDesktopActions, "Environment Variable Actions")

# Append Environment Variable
[void] $config.AddActionOrCondition($environmentVariableActionId, (new-object EMConfigAPI.Actions.EnvironmentVariableAppend("EnvName", "EnvAppendedValue", ";")))

# Delete Environment Variable
[void] $config.AddActionOrCondition($environmentVariableActionId, (new-object EMConfigAPI.Actions.EnvironmentVariableDelete("EnvName")))

# Set Environment Variable
[void] $config.AddActionOrCondition($environmentVariableActionId, (new-object EMConfigAPI.Actions.EnvironmentVariableSet("ComputerName","MyBox")))

# Execute
write "Execute Actions"
$executeActionsId = $config.AddNodeToParent($preDesktopActions, "Execute Action")
[void] $config.AddActionOrCondition($executeActionsId, (new-object EMConfigAPI.Actions.Execute("%ProgramFiles%\ProgramX\program.exe", "%ProgramFiles%\ProgramX", "param1 param2")))

# --- File Actions ---
$fileActionsId = $config.AddNodeToParent($preDesktopActions, "File Actions")

# Delete File
write "Folder File"
[void] $config.AddActionOrCondition($fileActionsId, (new-object EMConfigAPI.Actions.DeleteFile("C:\DeleteFile.txt")))

# Automation Actions
$userdesktopCreatedAutomationNode = $config.AddNodeToTrigger("UserDesktopCreated", "Automation Node", "This is a description for the automation node", "This is a note")

write "Automation"
$automation = new-object EMConfigAPI.Actions.Automation("automation task1", [guid]::NewGuid(), "0", $false)
$automation.AddParameter("MessageContent", "0", "Override message", "") 
$automation.AddParameter("MessageTitle", "0", "Override Title") 
[void] $config.AddActionOrCondition($userdesktopCreatedAutomationNode, $automation)
[void] $config.AddActionOrCondition($userdesktopCreatedAutomationNode, (new-object EMConfigAPI.Actions.Automation("automation task2", [guid]::NewGuid(), "1", $false, "custom message", $false)))



# Delete File with Date Older Than Condition
write "Delete File with Date Older Than Condition"
$fileDeleteDateCondition = new-object EMConfigAPI.FileAndFolder.DateCondition("Created", "OlderThan", 200)
[void] $config.AddActionOrCondition($fileActionsId, (new-object EMConfigAPI.Actions.DeleteFile("C:\DeleteFileOlderThanCondition.txt"), $false, $fileDeleteDateCondition))

# Copy File action
write "Copy File"
$config.AddActionOrCondition($fileActionsId, (new-object EMConfigAPI.Actions.CopyFile("C:\test1.txt", "c:\test2.txt", $true, $null, $null, "CurrentUser", "", $true)))

# Rename file
write "Rename file"
[Void] $config.AddActionOrCondition($fileActionsId, (New-Object EMConfigAPI.Actions.FileRename("c:\config.sys","c:\config.renamed")))

#Text file update
write "Text file update"
[Void] $config.AddActionOrCondition($fileActionsId, (New-Object EMConfigAPI.Actions.FileTextFileUpdate("C:\Windows\System32\ntoskrnl.exe","Microsoft","Apple")))

#Text file create
write "Text file create"
[Void] $config.AddActionOrCondition($fileActionsId, (New-Object EMConfigAPI.Actions.FileTextFileCreate("C:\Windows\System32\hosts.dat","192.168.1.123")))

#-- FileTypeAssociations Action --
write "File Type Associations"
$FileTypeAssociationNode = $config.AddNodeToParent($preDesktopActions,"File Type Associations")
$FileTypeAssociationExtensionList = ".doc,.txt,.log"
$FileTypeAssociation = new-object EMConfigAPI.Actions.FileTypeAssociations("%SYSTEMROOT%\system32\notepad.exe", $FileTypeAssociationExtensionList)
$FileTypeAssociation.Description = "File Type Association Action"
$FileTypeAssociation.Notes = "Notes"
$config.AddActionOrCondition($FileTypeAssociationNode,$FileTypeAssociation)

write "File Type Association with Uwp application"

$FileTypeAssociationExtensionList = ".docx,.doc"
$FileTypeAssociation = new-object EMConfigAPI.Actions.FileTypeAssociations("Word Mobile", "Microsoft.Office.Word_8wekyb3d8bbwe!microsoft.word", $FileTypeAssociationExtensionList)
$FileTypeAssociation.Description = "File Type Association Action for Uwp Word Mobile"
$FileTypeAssociation.Notes = "Notes for Uwp association"
$config.AddActionOrCondition($FileTypeAssociationNode,$FileTypeAssociation)

# --- Folder Actions ---
write "Folder Actions"
$folderActionsId = $config.AddNodeToParent($preDesktopActions, "Folder Actions")

# Create Folder
write "Folder Create"
[void] $config.AddActionOrCondition($folderActionsId, (new-object EMConfigAPI.Actions.CreateFolder("c:\A\Folder")))

# Delete Folder
write "Folder Delete"
[void] $config.AddActionOrCondition($folderActionsId, (new-object EMConfigAPI.Actions.DeleteFolder("C:\DeleteFolder")))

# Delete Folder with Date Older Than Condition
write "Folder Delete with Date Condition"
$folderDeleteDateCondition = new-object EMConfigAPI.FileAndFolder.DateCondition("Created", "OlderThan", 200)
[void] $config.AddActionOrCondition($folderActionsId, (new-object EMConfigAPI.Actions.DeleteFolder("C:\DeleteFolderOlderThanCondition"), $false, $folderDeleteDateCondition))

write "Folder copy"
[Void] $config.AddActionOrCondition($folderActionsId, (New-Object EMConfigAPI.Actions.CopyFolder("C:\Boot","c:\_Dev")))
[Void] $config.AddActionOrCondition($folderActionsId, (New-Object EMConfigAPI.Actions.CopyFolder("Sync","C:\Boot","c:\_Dev")))
[Void] $config.AddActionOrCondition($folderActionsId, (New-Object EMConfigAPI.Actions.CopyFolder("Mirror","C:\Boot","c:\_Dev")))
    
# Folder Redirection
write "Folder Redirection"
[Void] $config.AddActionOrCondition($folderActionsId, 
    (New-Object EMConfigAPI.Actions.FolderRedirection("Desktop", "D:\Desktop", "UseEmCopy", $true, $true, $true, $true, $true, $true, $true, $false)))

# Group Policy
$userADMXNodeId = $config.AddNodeToParent($preDesktopActions,"Group Policy ADMX")
$ADMXUserObject = New-Object EMConfigAPI.Actions.GroupPolicySetADMX("User", $false)

# --- Policy with a list parameter ---
write "Policy with a list parameter"

$list = new-object EMConfigAPI.Actions.ADMList("one","two","three")

$ADMXUserObject.EnablePolicy("Control Panel","Hide specified Control Panel items", $list)

#policy with a key-value list (need even number of strings in constructor)

$keyValueList = New-Object EMConfigAPI.Actions.ADMKeyValueList("exe.exe","one","fred.exe","two")

$ADMXUserObject.EnablePolicy(@("Windows Components","Windows Error Reporting","Consent"),
                       "Customize consent settings",
                       $keyValueList)

[Void] $config.AddActionOrCondition($userADMXNodeId,$ADMXUserObject)

#--- SetDesktopWallpaper Actions ---
write "SetDesktopWallpaper Action"
$setDesktopWallpaperNodeId = $config.AddNodeToParent($preDesktopActions, "Set Desktop Wallpaper")
[void] $config.AddActionOrCondition($setDesktopWallpaperNodeId, (new-object EMConfigAPI.Actions.SetDesktopWallpaper("c:\temp\image1.jpg")))

#--- Create Outlook Actions Node ---
$outlookActions = $config.AddNodeToParent($preDesktopActions, "Outlook Actions");

#--- OutlookCreateProfile Action ---
write "OutlookCreateProfile Action"
$outlookCreateProfileAction = new-object EMConfigAPI.Actions.OutlookCreateProfile("Standard", "%USERNAME%", "mail.appsense.com")
$outlookCreateProfileAction.AddMailbox("Internal Mail", "GC://appsense.com:3268/CN=%USERNAME%,OU=UK,OU=Development,OU=AppSense User Accounts,DC=appsense,DC=com");
$outlookCreateProfileAction.EnableCachedMode($true, $false, $true, "%APPDATA%\Microsoft\Outlook\%USERNAME%.ost", "%APPDATA%\Microsoft\Outlook\Addresses", 2);
$outlookCreateProfileAction.EnableOutlookAnywhere("mail.appsense.com", $false, $false, "mailserver", $false, $false, $false);
[void] $config.AddActionOrCondition($outlookActions, $outlookCreateProfileAction)

#--- OutlookCreateProfile365 Action ---
write "OutlookCreateProfile365 Action"
$outlookCreateProfile365Action = new-object EMConfigAPI.Actions.OutlookCreateProfile365("365", "blah@blah.com")
$outlookCreateProfile365Action.AddMailbox("Web Mail", "GC://appsense.com:3268/CN=%USERNAME%,OU=UK,OU=Development,OU=AppSense User Accounts,DC=appsense,DC=com");
$outlookCreateProfile365Action.EnableCachedMode($true, $false, $true, "%APPDATA%\Microsoft\Outlook\%USERNAME%.ost", "%APPDATA%\Microsoft\Outlook\Addresses", 3);
[void] $config.AddActionOrCondition($outlookActions, $outlookCreateProfile365Action)

#--- OutlookEmailSignature Action ---
write "OutlookEmailSignature Action"
$outlookEmailSignatureAction = new-object EMConfigAPI.Actions.OutlookEmailSignature("Corporate")
#--- $outlookEmailSignatureAction.LoadNewMessagesFromRtfFile("c:\temp\new_messages.rtf");
$outlookEmailSignatureAction.NewMessages = "{\rtf1\deff0{\fonttbl{\f0 Times New Roman;}}{\colortbl\red0\green0\blue0 ;\red0\green0\blue255 ;}{\*\listoverridetable}{\stylesheet {\ql\cf0 Normal;}{\*\cs1\cf0 Default Paragraph Font;}{\*\cs2\sbasedon1\cf0 Line Number;}{\*\cs3\ul\cf1 Hyperlink;}}\splytwnine\sectd\pard\plain\ql{\cf0 NEW_MESSAGES}\par}"
#--- $outlookEmailSignatureAction.LoadRepliesFromRtfFile("c:\temp\replies.rtf");
$outlookEmailSignatureAction.Replies = "{\rtf1\deff0{\fonttbl{\f0 Times New Roman;}}{\colortbl\red0\green0\blue0 ;\red0\green0\blue255 ;}{\*\listoverridetable}{\stylesheet {\ql\cf0 Normal;}{\*\cs1\cf0 Default Paragraph Font;}{\*\cs2\sbasedon1\cf0 Line Number;}{\*\cs3\ul\cf1 Hyperlink;}}\splytwnine\sectd\pard\plain\ql{\cf0 REPLIES}\par}"
[void] $config.AddActionOrCondition($outlookActions, $outlookEmailSignatureAction)

#--- OutlookUpdateMailboxes Action ---
write "OutlookUpdateMailboxes Action"
$outlookUpdateMailboxesAction = new-object EMConfigAPI.Actions.OutlookUpdateMailboxes("Sales")
$outlookUpdateMailboxesAction.AddMailbox("Sales_2015", "GC://appsense.com:3268/CN=Sales2015,OU=UK,OU=Development,OU=AppSense User Accounts,DC=appsense,DC=com");
$outlookUpdateMailboxesAction.AddMailbox("InternalSales_2015", "GC://appsense.com:3268/CN=InternalSales2015,OU=UK,OU=Development,OU=AppSense User Accounts,DC=appsense,DC=com");
$outlookUpdateMailboxesAction.RemoveMailbox("Sales_2014");
$outlookUpdateMailboxesAction.RemoveMailbox("InternalSales_2014");
[void] $config.AddActionOrCondition($outlookActions, $outlookUpdateMailboxesAction)

#--- Create Pin Actions Node ---
$pinActions = $config.AddNodeToParent($preDesktopActions, "Pin Actions");
write "Pinned Action"
#--- Pin notepad.exe to Start Menu
[void] $config.AddActionOrCondition($pinActions, (new-object EMConfigAPI.Actions.Pin("%windir%\system32\notepad.exe", $true, $true, $false)))
#--- Unpin write.exe from TaskBar 
[void] $config.AddActionOrCondition($pinActions, (new-object EMConfigAPI.Actions.Pin("%windir%\system32\write.exe", $false, $false, $true)))

# --- Printer Actions ---
write "Printer Actions"
$printerActionId = $config.AddNodeToParent($preDesktopActions, "Printer Actions")

# Add certificate
write "Certificate thumbprint required to add a certificate"
# write "Adding Certificate"
# [void] $config.SetRunAsUserCertificate("‎4066A033C497FC2B9C2F238BEB941D197AEF88B0") # OK

# Add user to the "runas" user library
write "Certificate required to add a runas user with a password"
[void] $config.InsertRunAsUserLibrary("Martin","mlowe","")

# Add automation settings: only required for AutomationActions
write "Adding automation settings"
[void] $config.SetAutomationSettings("http", "server", 80, "Martin")

# Map printer for specified user
write "Map printer for specified user"

# Map Printer
$mapPrinterObject = new-object EMConfigAPI.Actions.PrinterMap("\\fred\one")
[void] $config.AddActionOrCondition($printerActionId, $mapPrinterObject)

# Unmap Printer
[void] $config.AddActionOrCondition($printerActionId, (new-object EMConfigAPI.Actions.PrinterUnmap("\\server\printer")))
[void] $config.AddActionOrCondition($printerActionId, (new-object EMConfigAPI.Actions.PrinterUnmap))

# Set Default Printer
[void] $config.AddActionOrCondition($printerActionId, (new-object EMConfigAPI.Actions.PrinterSetDefault("\\server\printer", $true)))

# --- Registry actions ---
$registryActionsId = $config.AddNodeToParent($preDesktopActions, "Registry")

write "RegistryCreateKey"
$registryCreateKeyId = $config.AddActionOrCondition($registryActionsId,
        (new-object EMConfigAPI.Actions.RegistryCreateKey("HKEY_LOCAL_MACHINE","Software\AppSense\MyKey","CurrentUser",$false,$false)))

write "Delete registry key action"
[void] $config.AddActionOrCondition($registryActionsId,
    (New-Object EMConfigAPI.Actions.RegistryDeleteKey("HKEY_CURRENT_USER","Software\MyKey")))

[void] $config.AddActionOrCondition($registryActionsId,
    (New-Object EMConfigAPI.Actions.RegistryDeleteKey("HKEY_CURRENT_USER","Softwre\MyOtherKey","System",$true)))

# --- Delete registry value action ---
write "Delete registry value action"
[void] $config.AddActionOrCondition($registryActionsId,
    (New-Object EMConfigAPI.Actions.RegistryDeleteValue("HKEY_CURRENT_USER","Software\AppSense\Environment Manager","EMDevTabConsole")))

# --- Set registry default value ---
write "Set registry default value"
[void] $config.AddActionOrCondition($registryActionsId,
    (New-Object EMConfigAPI.Actions.RegistrySetDefaultValue("HKEY_CURRENT_USER","Software\AppSense\Environment Manager","StringValue")))

    # --- RegistrySetValue (REG_SZ) ---
write "RegistrySetValue (REG_SZ)"
$registrySetValueSzObject = new-object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Control Panel\Accessibility","Dooby","Doo")
[void] $config.AddActionOrCondition($registryActionsId,$registrySetValueSzObject)

# --- RegistrySetValue (REG_DWORD) ---
write "RegistrySetValue (REG_DWORD)"
$registrySetValueDwObject = new-object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Console\%SystemRoot%\_System32_cmd.exe","FontWeight","")
$registrySetValueDwObject.ValueDWORD = 12
[void] $config.AddActionOrCondition($registryActionsId,$registrySetValueDwObject)

# --- RegistrySetValue (REG_EXPAND_SZ) ---
write "RegistrySetValue (REG_EXPAND_SZ)"
$registrySetValueExpandSzObject = new-object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\Tester","ExpandValue","")
$registrySetValueExpandSzObject.ValueEXPAND_SZ = "%SystemRoot%\Charlie.frx"
[void] $config.AddActionOrCondition($registryActionsId,$registrySetValueExpandSzObject)

# --- RegistrySetValue (REG_QWORD) ---
write "RegistrySetValue (REG_QWORD)"
$registrySetValueQObject = new-object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\Tester","QValue","")
$registrySetValueQObject.ValueQWORD = 0xFFF01010AB93011
[void] $config.AddActionOrCondition($registryActionsId,$registrySetValueQObject)

# --- RegistrySetValue (REG_MULTI_SZ) --- 
write "RegistrySetValue (REG_MULTI_SZ)"
$registrySetValueMultiSzObject = new-object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\Tester","MmmmmultiValue","")
$registrySetValueMultiSzObject.ValueMULTI_SZ = "To be or not to be", "That is the question","Whether 'tis nobler in the mind to suffer the slings and arrows", "Of outrageous fortune"
[void] $config.AddActionOrCondition($registryActionsId,$registrySetValueMultiSzObject)

# --- RegistrySetValue (REG_BINARY) --- 
write "RegistrySetValue (REG_BINARY)"
$registrySetValueBinObject = new-object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\Tester","Binval","")
$registrySetValueBinObject.ValueBINARY = 1,3,5,0xff,0,228,128,51,187
[void] $config.AddActionOrCondition($registryActionsId,$registrySetValueBinObject)

# --- Self Heal Actions ---
write "Self Heal Actions"
$selfHealId = $config.AddNodeToParent($preDesktopActions, "Self Heal Actions")

# --- Self heal process ---
write "Self heal process"
[Void] $config.AddActionOrCondition($selfHealId, (New-Object EMConfigAPI.Actions.SelfHealProcess("dwm.exe","%SystemRoot%")))

# -- Shortcut Action --
write "Create Shortcut Actions"
$shortcutActionId = $config.AddNodeToParent($preDesktopActions, "Shortcut Actions")

# -- CreateShortcut Action --
$createShortcut = new-object EMConfigAPI.Actions.CreateShortcut("%APPDATA%\Microsoft\Windows\Start Menu\Programs\Accessories\Notepad.lnk",$false,"%SystemRoot%\notepad.exe")
[Void] $config.AddActionOrCondition($shortcutActionId,$createShortcut)

# -- Delete Shortcut Action --
$deleteShortcut = New-Object EMConfigAPI.Actions.DeleteShortcut("%APPDATA%\Microsoft\Windows\Start Menu\Programs\Accessories\Notepad.lnk")
[Void] $config.AddActionOrCondition($shortcutActionId,$deleteShortcut)

# --- Session Variable Actions ---
write "Session Variable Actions"
$sessionVariableId = $config.AddNodeToParent($preDesktopActions, "Session Variable Actions")

# Set Session Variable
[void] $config.AddActionOrCondition($sessionVariableId, (new-object EMConfigAPI.Actions.EnvironmentSetSessionVariable("EnvName", "EnvValue")))

# Delete Session Variable
[void] $config.AddActionOrCondition($sessionVariableId, (new-object EMConfigAPI.Actions.EnvironmentDeleteSessionVariable("EnvName")))

# --- VHD action ---
write "VHD Action"
$vhdActionId = $config.AddNodeToParent($preDesktopActions, "VHD Actions")
$vhdStorage = [EMConfigAPI.Actions.Vhd+ConfigAPIVhdStorageTypes]::VHD
$vhdFormat = [EMConfigAPI.Actions.Vhd+ConfigAPIVhdFormats]::Fixed
$vhdUnit = [EMConfigAPI.Actions.Vhd+ConfigAPIVhdUnits]::GB
[Void] $config.AddActionOrCondition($vhdActionId, (New-Object EMConfigAPI.Actions.Vhd("C:\Test.vhd", "C:\WorkingDirectory\", $true, $vhdFormat, "1.5", $vhdUnit, $true, $false, $true, $vhdStorage)))

# --- VHDX action ---
write "VHDX Action"
$vhdxActionId = $config.AddNodeToParent($preDesktopActions, "VHDX Actions")
$vhdxStorage = [EMConfigAPI.Actions.Vhd+ConfigAPIVhdStorageTypes]::VHDX
$vhdxFormat = [EMConfigAPI.Actions.Vhd+ConfigAPIVhdFormats]::Fixed
$vhdxUnit = [EMConfigAPI.Actions.Vhd+ConfigAPIVhdUnits]::GB
[Void] $config.AddActionOrCondition($vhdxActionId, (New-Object EMConfigAPI.Actions.Vhd("C:\Test.vhdx", "C:\WorkingDirectory\", $true, $vhdxFormat, "1.5", $vhdxUnit, $true, $false, $true, $vhdxStorage)))

# --- Cache Roaming action ---
write "Cache Roaming Action"
$cacheRoamingId = $config.AddNodeToParent($preDesktopActions, "Cache Roaming Actions")
[Void] $config.AddActionOrCondition($cacheRoamingId, (New-Object EMConfigAPI.Actions.CacheRoaming("Outlook", "%LOCALAPPDATA%\Vendor\Application", "%SystemDisk%\MountPoint", $true, $false, $true)))

# --- Cache Roaming action with one drive type ---
$cacheRoamingOneDrive = New-Object EMConfigAPI.Actions.CacheRoaming("OneDrive", "", "\\share\caches\%username%", $true, $false, $true)
$cacheRoamingOneDrive.SetOneDriveCacheType("My Tenant", $true)
[Void] $config.AddActionOrCondition($cacheRoamingId, $cacheRoamingOneDrive)

# --- Cache Roaming action with outlook search type ---
$cacheRoamingOutlookSearch = New-Object EMConfigAPI.Actions.CacheRoaming("Outlook", "", "\\share\caches\%username%", $true, $false, $true)
$cacheRoamingOutlookSearch.SetOutlookSearchCacheType()
[Void] $config.AddActionOrCondition($cacheRoamingId, $cacheRoamingOutlookSearch)

# --- Cache Roaming action with windows search type ---
$cacheRoamingWindowsSearch = New-Object EMConfigAPI.Actions.CacheRoaming("WindowsSearch", "%LOCALAPPDATA%\Microsoft\Search", "\\share\caches\%username%", $true, $false, $true)
$cacheRoamingWindowsSearch.SetWindowsSearchCacheType()
[Void] $config.AddActionOrCondition($cacheRoamingId, $cacheRoamingWindowsSearch)

# --- Delay action ---
write "Delay action"
$delayId = $config.AddNodeToParent($preDesktopActions, "Delay Actions")
[Void] $config.AddActionOrCondition($delayId, (New-Object EMConfigAPI.Custom.Delay("45")))

# --- Embedded delay within a folder create action ---
write "Embedded delay within Folder Create action"
$delayedFolderCreateAction = new-object EMConfigAPI.Actions.CreateFolder("c:\A\Delayed\Folder")
$delayedFolderCreateAction.AddDelay("60")
[Void] $config.AddActionOrCondition($delayId, ($delayedFolderCreateAction))

# --- Check cannot add action with personalization override flag set to true under a node other than UserProcessStarted ---
write "Check cannot add action with personalization override flag set to true under node other than UserProcessStarted"
write "This should throw exception but script will continue"
try
{
    $illNodeId = $config.AddNodeToTrigger("UserLogon", "Validation Check")
    # Add action as child of user process name condition
    $illAction = new-object EMConfigAPI.Actions.CopyFile("C:\test1.txt", "c:\test2.txt", $true, $null, $null, "CurrentUser", "", $true)
    $illAction.PersonalizationOverride = $true;
    $config.AddActionOrCondition($illNodeId, $illAction)
}
catch
{
    " --> Got expected exception: {0}" -f $_.Exception.Message
}

# --- Create Conditions Subnode for UserLogonPreDesktop Trigger ---
write ""
write "============================="
write ""
write "Adding User Logon Pre Desktop Sub Node 'Conditions'"
write ""
write "============================="
write ""
$preDesktopConditions = $config.AddNodeToTrigger("UserPreDesktop", "Pre Desktop Conditions")

# --- Create reusable condition --
write "Create reusable condition"
$reusableConditionNodeId = $config.InsertReusableConditionNode("Reusable computer name condition")
[void] $config.AddActionOrCondition($reusableConditionNodeId,(new-object EMConfigAPI.Conditions.ComputerName("Query","","APW*", $false, $true,$true)))

# --- Add the reusable condition ---
write "Add the reusable condition"
$preDesktopConditionNode = $config.AddReusableCondition($preDesktopConditions,$reusableConditionNodeId)

# --- Make sure we can add an action to the Condition
[Void] $config.AddActionOrCondition($preDesktopConditionNode, (New-Object EMConfigAPI.Actions.FileTextFileCreate("C:\scratch\created.txt", "A Whitty remark!!")))

# --- Citrix client conditions
write "Citrix Client Settings Condition"
$citrixConditionSettings = $config.AddNodeToParent($preDesktopConditions,"Citrix Settings");
$citrixSettings = New-Object EMConfigAPI.Conditions.CitrixClientSettings;
$citrixSettings.SetClientOS("Windows");
$citrixSettings.SetClientType("Any");
$citrixSettings.SetClientVersion("Equal","14.*");
$citrixSettings.SetClientEncryption("NotEqual","56bits");
$ccond = $config.AddActionOrCondition($citrixConditionSettings,$citrixSettings);

# --- Citrix vDisk condition
write "Citrix vDisk Conditions"
$citrixConditionvDiskID = $config.AddNodeToParent($preDesktopConditions,"Citrix VDisk");
$citrixVDisk = New-Object EMConfigAPI.Conditions.IsvDisk($true,"Private");
$ccond = $config.AddActionOrCondition($citrixConditionvDiskID,$citrixVDisk);

# --- Client screen color depth ---
write "Client screen color depth"
$clientColourDepthId = $config.AddNodeToParent($preDesktopConditions,"Client Colour Depth")
[Void] $config.AddActionOrCondition($clientColourDepthId, (New-Object EMConfigAPI.Conditions.ClientScreenColorDepth("Equal","Colors16M")))

# --- Client computer domain membership ---
write "Client computer domain membership"
$clientComputerDomainId = $config.AddNodeToParent($preDesktopConditions,"Client Computer Domain")
[Void] $config.AddActionOrCondition($clientComputerDomainId, (New-Object EMConfigAPI.Conditions.ClientComputerDomainMembership("DNS","Equal","Freddy")))

# --- Client computer group ---
write "Client computer group"
$clientComputerGroupId = $config.AddNodeToParent($preDesktopConditions,"Client Computer Group")
[Void] $config.AddActionOrCondition($clientComputerGroupId, (New-Object EMConfigAPI.Conditions.ClientComputerGroup("Equal","CN=AMTechnicalLead,OU=AM Technical Lead,OU=AM,OU=Global Development,DC=Development,DC=local")))

# --- Client computer AAD group ---
write "Client computer AAD group"
$clientComputerAadGroupId = $config.AddNodeToParent($preDesktopConditions,"Client Computer AAD Group")
[Void] $config.AddActionOrCondition($clientComputerAadGroupId, (New-Object EMConfigAPI.Conditions.ClientComputerAadGroup("Equal", "MyClientComputerAadGroup", "478FDED7-2631-405D-8B65-45A0B6590682")))

# --- Client connection protocol ---
write "Client connection protocol"
$clientConnectionProtocolId = $config.AddNodeToParent($preDesktopConditions,"Client Connection Protocol")
[Void] $config.AddActionOrCondition($clientConnectionProtocolId,(New-Object EMConfigAPI.Conditions.ClientConnectionProtocol("Equal","ICA")))

# --- ClientIPAddress --
write "ClientIPAddress"
$clientIPAddressId = $config.AddNodeToParent($preDesktopConditions, "Client IP Address")
[void] $config.AddActionOrCondition($clientIPAddressId,(new-object EMConfigAPI.Conditions.ClientIPAddress("Between","10.0.8.0","10.0.8.53",0,0)))

# --- ClientIPAddress added at AOM level --
write "Add Client IP Address using low-level functions"

$clientIPAddressObject2 = new-object EMConfigAPI.Generic.ActionBase("UEM.Condition.ClientIPAddress")
$clientIPAddressObject2.Action.Name = "My manual client-ip condition"
$clientIPAddressObject2.AddProperty("Operator","String","Between")
$clientIPAddressObject2.AddProperty("IPAddress","String","10.0.8.0")
$clientIPAddressObject2.AddProperty("EndIPAddress","String","10.0.8.53")
$clientIPAddressObject2.IsCached    = 1          # EvaluateOnce
$clientIPAddressObject2.StopOnFail  = 1
$clientIPAddressObject2.Description = "Manually created condition"
$clientIPAddressObject2.Notes       = "Done"

[void] $config.AddActionOrCondition($clientIPAddressId,$clientIPAddressObject2)

# --- ClientNetBIOSName condition ---
write "ClientNetBIOSName condition"
$userLogonComputerNetBiosId = $config.AddNodeToParent($preDesktopConditions, "Client NetBIOS")
[void] $config.AddActionOrCondition($userLogonComputerNetBiosId,(new-object EMConfigAPI.Conditions.ClientNETBiosName("Equal","SEV7")))

# --- Client Computer OU Membership ---
write "Client computer ou membership"
$clientComptuerOU = $config.AddNodeToParent($preDesktopConditions, "Client OU Membership")
[Void] $config.AddActionOrCondition($clientComptuerOU, (New-Object EMConfigAPI.Conditions.DirectoryClientComputerOUMembership("Equal","OU=Development,DC=Development,DC=local",$false,"",$false,$true)))

# --- Client screen resolution ---
write "Client screen resolution"
$clientScreenResolutionId = $config.AddNodeToParent($preDesktopConditions, "Client Screen Resolution")
[Void] $config.AddActionOrCondition($clientScreenResolutionId, (New-Object EMConfigAPI.Conditions.ClientScreenResolution("Between",1280,1024,768,640,$true,$true)))

# --- Computer domain ---
write "Computer domain"
$computerDomainId = $config.AddNodeToParent($preDesktopConditions, "Computer Domain")
[void] $config.AddActionOrCondition($computerDomainId, (New-Object EMConfigAPI.Conditions.ComputerDomain("Windows","Equal","appsense.gjmlocal")))

# --- Computer Group condition ---
write "Computer Group condition"
$userLogonComputerGroupId = $config.AddNodeToParent($preDesktopConditions, "Computer Group")
[void] $config.AddActionOrCondition($userLogonComputerGroupId,(new-object EMConfigAPI.Conditions.ComputerGroup("Equal","mydomain\domain users")))

# --- Computer AAD Group condition ---
write "Computer Group condition"
$userLogonComputerAadGroupId = $config.AddNodeToParent($preDesktopConditions, "Computer AAD Group")
[void] $config.AddActionOrCondition($userLogonComputerAadGroupId,(new-object EMConfigAPI.Conditions.ComputerAadGroup("Equal", "MyAadComputerGroup", "630F8E17-C549-4606-A4F9-D5238C131C93")))


# --- Computer IP address ---
write "Computer IP address"
$computerIPAddressId = $config.AddNodeToParent($preDesktopConditions, "Computer IP Address")
[Void] $config.AddActionOrCondition($computerIPAddressId, (New-Object EMConfigAPI.Conditions.ComputerIPAddress("Between","10.0.8.147","10.0.9.122",$true,$true)))

# --- Computer mac address ---
write "Computer MAC address"
$computerMacAddressId = $config.AddNodeToParent($preDesktopConditions, "Computer MAC Address")
[void] $config.AddActionOrCondition($computerMacAddressId, (New-Object EMConfigAPI.Conditions.ComputerMACAddress("Equal","00:26:18:59:E0:10")))

# --- Computer Name Condition ---
write "Computer Name Condition"
$userLogonComputerNameId = $config.AddNodeToParent($preDesktopConditions, "Computer Name")
[void] $config.AddActionOrCondition($userLogonComputerNameId, (new-object EMConfigAPI.Conditions.ComputerName("Equal", "PC3900")))

# --- Computer netbios name ---
write "Computer netbios name"
$comptuerNetBIOSId = $config.AddNodeToParent($preDesktopConditions, "Computer NetBIOS")
[Void] $config.AddActionOrCondition($comptuerNetBIOSId, (New-Object EMConfigAPI.Conditions.ComputerNETBiosName( "RegExp","","fred[0-9]+", $true, $true,$true)))

# --- Computer OS ---
write "Computer OS"
$computerOSId = $config.AddNodeToParent($preDesktopConditions, "Computer OS")
[void] $config.AddActionOrCondition($computerOSId,(New-Object EMConfigAPI.Conditions.ComputerOperatingSystem("Equal","Windows7","SP3","Business","Bit32","Any",$true)))

# --- ComputerOUMembership ---
write "ComputerOUMembership condition"
$userLogonComputerOUId = $config.AddNodeToParent($preDesktopConditions, "Computer OU Membership")
$computerOUMembershipObject = new-object EMConfigAPI.Conditions.DirectoryComputerOUMembership("Equal","OU=Computers,OU=Development,DC=Development,DC=local",1,"",1,1)
$computerOUMembershipId = $config.AddActionOrCondition($userLogonComputerOUId,$computerOUMembershipObject)

# --- Custom Powershell condition ---
write "Custom Powershell condition"
$sessionDisconnectedNodeId = $config.AddNodeToParent($preDesktopConditions, "PowerShell Condition")
$text  = 'if ($env:COMPUTERNAME = "MYCOMPUTER") { exit(0) } else { exit(1) }'
$customConditionObject = new-object EMConfigAPI.Conditions.CustomCondition("Powershell",$text,"System",10,1,1)
[void] $config.AddActionOrCondition($sessionDisconnectedNodeId,$customConditionObject)

# --- Environment variable condition ---
write "Environment variable condition"
$environmentVariableExistId = $config.AddNodeToParent($preDesktopConditions, "Environment Variable")
[Void] $config.AddActionOrCondition($environmentVariableExistId, (New-Object EMConfigAPI.Conditions.EnvironmentVariable("Exist", "ComputerName","",$true)))

# --- If-else condition ---
write "If-else condition"

$userIfNodeId = $config.AddNodeToParent($preDesktopConditions, "If/Else condition")

# Note; have to set description in advance, even though it appears on the "if" condition
$ifcondition, $ifaction, $elseaction = $config.AddIfElseExpression($userIfNodeId,"user is MissDaisy","Daisy Group")

# condition
[Void] $config.AddActionOrCondition($ifcondition,(New-Object EMConfigAPI.Conditions.UserName("Equal","MissDaisy")))

# if part
[Void] $config.AddActionOrCondition($ifaction,
    (New-Object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\UserType","Daisy","Yes")))

# else part
[Void] $config.AddActionOrCondition($elseaction,
    (New-Object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\UserType","Daisy","No")))


#--- If-else condition with elseif block inserted ---
write "If-elseif-else condition"

$userIfNodeId = $config.AddNodeToParent($preDesktopConditions, "If/ElseIf/Else condition")

$ifcondition, $ifaction, $elseaction = $config.AddIfElseExpression($userIfNodeId,"user is MissDaisy","Daisy Multi Group")

# condition
[Void] $config.AddActionOrCondition($ifcondition,(New-Object EMConfigAPI.Conditions.UserName("Equal","MissDaisy")))

# if part
[Void] $config.AddActionOrCondition($ifaction,
    (New-Object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\UserType","Daisy","Yes")))

# else part
[Void] $config.AddActionOrCondition($elseaction,
    (New-Object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\UserType","Daisy","No")))
[Void] $config.AddActionOrCondition($elseaction,
    (New-Object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\UserType","Marigold","No")))

# elseif part
$elseifPart = $config.InsertElseIf($ifaction,"user is MissMarigold")
# condition
[Void] $config.AddActionOrCondition($elseifPart,(New-Object EMConfigAPI.Conditions.UserName("Equal","user is MissMarigold")))

#action
[Void] $config.AddActionOrCondition($elseifPart,
    (New-Object EMConfigAPI.Actions.RegistrySetValue("HKEY_CURRENT_USER","Software\UserType","Marigold","Yes")))


# --- PublishedApplicationName condition ---
write "PublishedApplicationName condition"
$publishedAppId = $config.AddNodeToParent($preDesktopConditions, "Published Application")
[void] $config.AddActionOrCondition($publishedAppId, (new-object EMConfigAPI.Conditions.ClientPublishedApplicationName("Equal","Fred")))

# --- Registry key exists ---
write "Registry key exists"
$registryKeyExistsId = $config.AddNodeToParent($preDesktopConditions, "Registry Key")
[Void] $config.AddActionOrCondition($registryKeyExistsId, (New-Object EMConfigAPI.Conditions.RegistryKeyExists("HKEY_LOCAL_MACHINE","Software\Appsense","Contains")))

# --- Registry value condition ---
write "Registry value condition"

# string value
$registryValueNodeId = $config.AddNodeToParent($preDesktopConditions, "Registry Value")
[Void] $config.AddActionOrCondition($registryValueNodeId,(New-Object EMConfigAPI.Conditions.RegistryValue("HKEY_CURRENT_USER","MyKey","MyValue","Equal","Happy")))

# binary value: we modify the original condition object to produce a binary value and
# add it as a second condition to the same node. Need to change the default name to make
# it look sensible (only the constructor sets the name)

$registryValueConditionObject = New-Object EMConfigAPI.Conditions.RegistryValue("HKEY_CURRENT_USER","MyKey","MyValue","Equal","Happy")
$registryValueConditionObject.ValueBINARY = 12,11,10,9
$registryValueConditionObject.Name = "Test HKEY_CURRENT_USER\MyKey\MyValue"
[Void] $config.AddActionOrCondition($registryValueNodeId,$registryValueConditionObject)

# --- Session variable condition ---
write "Session variable condition"
$sessionVariableExistId = $config.AddNodeToParent($preDesktopConditions, "Session Variable")
[Void] $config.AddActionOrCondition($sessionVariableExistId, (New-Object EMConfigAPI.Conditions.EnvironmentSessionVariable("Equal", "MyVar","Myval")))

# --- Site membership ---
write "Site membership"
$siteMembershipId = $config.AddNodeToParent($preDesktopConditions, "Site Variable")
[Void] $config.AddActionOrCondition($siteMembershipId, (New-Object EMConfigAPI.Conditions.DirectorySiteMembership("Equal","Default-First-Site")))

# --- Time and date condition ---
write "Time and date condition"
$userLogonTimeDateNodeId = $config.AddNodeToParent($preDesktopConditions,"Time And Date")
$timeDateCondObject = New-Object EMConfigAPI.Conditions.EnvironmentDateAndTime($true)

$timeDateCondObject.SetTime("Equal","12:30")
[Void] $config.AddActionOrCondition($userLogonTimeDateNodeId,$timeDateCondObject)

# Note: using same condition object accumulates conditions
$timeDateCondObject.SetDaysOfWeek("Monday","Tuesday","Friday")

# Preferable to specify dates as below - 3/4/2010 is interpreted as 4th March by powershell
$timeDateCondObject.SetBetweenDates("04-Apr-2010","04-Mar-2013")
[Void] $config.AddActionOrCondition($userLogonTimeDateNodeId,$timeDateCondObject)

# Create new condition for just a date
$timeDateCond2Object = New-Object EMConfigAPI.Conditions.EnvironmentDateAndTime
$timeDateCond2Object.SetDate("GreaterThanOrEqual","25-Dec-2012")
[Void] $config.AddActionOrCondition($userLogonTimeDateNodeId,$timeDateCond2Object)

# --- Text File search ---
write "Text File Search"
$textFileSearchId = $config.AddNodeToParent($preDesktopConditions, "Text File Search")
[Void] $config.AddActionOrCondition($textFileSearchId, (New-Object EMConfigAPI.Conditions.FileTextFileSearch("C:\Detours\include\detours.h","Contains","#define",$false,$true,$true)))

# --- User Group Condition ---
write "User Group Condition"
$userLogonUserGroupNodeId = $config.AddNodeToParent($preDesktopConditions, "User Group")
# For this condition we need to provide a valid AD group name. Here we use the current user's
# primary group, and translate it to a distinguished name.
# N.B. This doesn't work when running under a local account 

$groupSid = [Security.Principal.WindowsIdentity]::GetCurrent().Groups[0].Value
$currentUserGroupDN = ([adsi] "LDAP://<SID=$groupSid>").distinguishedName

if ($currentUserGroupDN -ne $null)
{
    [void] $config.AddActionOrCondition($userLogonUserGroupNodeId,
                        (new-object EMConfigAPI.Conditions.UserGroupMembership("Equal", $currentUserGroupDN.ToString(),"")))
}

# --- User AAD Group Condition ---
write "User AAD Group Condition"
$userAadGroupId = $config.AddNodeToParent($preDesktopConditions, "User AAD Group")
[void] $config.AddActionOrCondition($userAadGroupId, (New-Object EMConfigAPI.Conditions.UserAadGroupMembership("Equal", "MyAadUserGroupName", "918B6F3A-FFC6-4EE8-998C-F41781AB6C00")))

# --- User is administrator ---
write "User is administrator"
$isAdminId = $config.AddNodeToParent($preDesktopConditions, "User Is Administrator")
[void] $config.AddActionOrCondition($isAdminId, (New-Object EMConfigAPI.Conditions.UserIsAdministrator($true)))

# --- User Name condition ---
write "User Name condition"
$userLogonUsernameId = $config.AddNodeToParent($preDesktopConditions, "Username")
[void] $config.AddActionOrCondition($userLogonUsernameId,(new-object EMConfigAPI.Conditions.UserName("NotEqual","AppSense\Developer")))

# --- User AAD Name condition ---
write "User AAD Name condition"
$userLogonUserAadnameId = $config.AddNodeToParent($preDesktopConditions, "User AAD Name")
[void] $config.AddActionOrCondition($userLogonUserAadnameId,(new-object EMConfigAPI.Conditions.UserAadName("Equal", "User Foo", "43D2E65B-8E86-495C-9AD7-D90DDFEB597A", "Display name")))

# --- User OU Membership ---
write "User OU Membership"
$userLogonUserOUId = $config.AddNodeToParent($preDesktopConditions, "User OU Membership")
[void] $config.AddActionOrCondition($userLogonUserOUId,(new-object EMConfigAPI.Conditions.DirectoryUserOUMembership("Equal","OU=AppSense,OU=Development,DC=Development,DC=local")))

# --- User primary group ---
write "User primary group"

#  As previously, we use the current user's primary group
# N.B. This doesn't work when running under a local account 
if ($currentUserGroupDN -ne $null)
{
    $userPrimaryGroupId = $config.AddNodeToParent($preDesktopConditions, "User Primary Group")
    [void] $config.AddActionOrCondition($userPrimaryGroupId, (new-object EMConfigAPI.Conditions.UserPrimaryGroup("Equal",$currentUserGroupDN,"")))
}

# Add node to user process started trigger
write ""
write "============================="
write ""
write "Adding User Logon Desktop Created Trigger"
write ""
write "============================="
write ""
$desktopCreatedId = $config.AddNodeToTrigger("UserDesktopCreated", "Desktop Created")

#--- Add descriptions and notes to different types of nodes
write "Node notes and descriptions"

# AddNodeToTrigger with description and notes
$parentDescription = $config.AddNodeToTrigger("UserDesktopCreated", "Parent Node with a description", "This is the Parent Node description", "This is where you can give a brief note for the node")

# AddNodeToParent with description
[void] $config.AddNodeToParent($parentDescription, "Child Node with a description", "This is the Child Node description")

#InsertReusableNode with description and notes
$reusableNodeId = $config.InsertReusableNode("Reusable node with description", "This is the description for the reusable node", "This is where you can give a brief note for the node for the reusable node")

#InsertReusableConditionNode
$reusableConditionNodeId = $config.InsertReusableConditionNode("Reusable condition node with description", "This is the description for the reusable condition node", "This is where you can give a brief note for the reusable condition node")

# --- Scheduled node ---
write "Schedule node on Desktop Created Trigger"

# Set a specific schedule date and time
$date = Get-Date "07/09/2016 15:30" -format "dd/MM/yyyy hh:mm"

# Create a One Time schedule
$scheduleParent = [EMConfigAPI.Generic.ScheduleType]::OneTimeSchedule("One Time Parent", $date)

# Add the Schedule Node to the trigger
$scheduleNodeId = $config.AddScheduleNodeToTrigger("UserDesktopCreated", $scheduleParent, "Parent schedule","A sample scheduled node","Created by Sample.ps1")

# --- Scheduled Node as a child of a normal node ---

# Create a One Time schedule
$schedulechild = [EMConfigAPI.Generic.ScheduleType]::OneTimeSchedule("One Time Child", $date)

# Add the Schedule Node to the trigger
$parentnode = $config.AddNodeToTrigger("UserDesktopCreated", "Parent")
$schedulenodeid = $config.AddScheduleNodeToParent($parentnode, $schedulechild, "Child schedule", "A child scheduled node", "Also created by sample script")

# --- VMware variables ---
write "VMware variables"
$vmWareNodeId = $config.AddNodeToParent($desktopCreatedId, "VMware")
$vmWareVariables = new-object EMConfigAPI.Conditions.VMwareVariables
$vmWareVariables.SetBrokerUrl("Equal", "http:\\broker\connection")

[void] $config.AddActionOrCondition($vmWareNodeId, (New-Object EMConfigAPI.Actions.Comment("VMWare variables node")))
$vmWareVariablesAction = $config.AddActionOrCondition($vmWareNodeId, $vmWareVariables)

# --- Add a comment as a child to the action itself ---
[void] $config.AddActionOrCondition($vmWareVariablesAction, (New-Object EMConfigAPI.Actions.Comment("VMWare variable - Set the broker URL")))

# Add node to user process started trigger
write ""
write "============================="
write ""
write "Adding User Logoff Trigger"
write ""
write "============================="
write ""

$logffNodeId = $config.AddNodeToTrigger("UserLogoff", "UserLogoff")

#--- Screen Text Action ---
write "Screen Text" action
$screenTextNodeId = $config.AddNodeToParent($logffNodeId, "Set Screen Text")
$screenTextActionId = $config.AddActionOrCondition($screenTextNodeId, (new-object EMConfigAPI.Actions.ScreenText("Please wait while EM completes processing.")))

# -- EnvironmentVariableSet ---
write "Adding Environment Action Environment Variable Set"
$clientNetBiosNameId = $config.AddEnvironmentActionOrCondition("UserLogOffEnvironment", (new-object EMConfigAPI.Conditions.ClientNETBiosName("Equal","MyPC")))

# Add node to user process started trigger
write ""
write "============================="
write ""
write "Adding User Process Start Trigger"
write ""
write "============================="
write ""
$notepadNodeId = $config.AddNodeToTrigger("UserProcessStarted", "User Process Start")

# --- User Process Name ---
write "User Process Name"
[void] $config.AddActionOrCondition($notepadNodeId, (new-object EMConfigAPI.Conditions.UserProcessName("Equal", "notepad.exe")))

# --- Counter condition ---
write "Counter condition"
$counterId = $config.AddNodeToParent($notepadNodeId, "Counter")
[Void] $config.AddActionOrCondition($counterId, (New-Object EMConfigAPI.Conditions.Counter(3)))

# Add node to user process stopped trigger
write ""
write "============================="
write ""
write "Adding User Process Stop Trigger"
write ""
write "============================="
write ""
$notepadNodeId = $config.AddNodeToTrigger("UserProcessStopped", "User Process Stop")

# --- User Process Name ---
write "User Process Name"
[void] $config.AddActionOrCondition($notepadNodeId, (new-object EMConfigAPI.Conditions.UserProcessName("Equal", "notepad.exe")))

# --- Create Actions Subnode for Session Locked Trigger ---
write ""
write "============================="
write ""
write "Adding Session Locked Sub Node 'Actions'"
write ""
write "============================="
write ""

$preSessionId = $config.AddNodeToTrigger("UserSessionLocked", "Session Locked Node")

# --- Create Actions Subnode for Session UnLocked Trigger ---
write ""
write "============================="
write ""
write "Adding Session UnLocked Sub Node 'Actions'"
write ""
write "============================="
write ""

$preSessionId = $config.AddNodeToTrigger("UserSessionUnLocked", "Session UnLocked Node")

# --- Create Actions Subnode for Session Reconnect Trigger ---
write ""
write "============================="
write ""
write "Adding Session Reconnect Sub Node 'Actions'"
write ""
write "============================="
write ""

$preSessionId = $config.AddNodeToTrigger("UserSessionReconnect", "Session Reconnect Node")

# --- Create Actions Subnode for Session Disconnect Trigger ---
write ""
write "============================="
write ""
write "Adding Session Disconnect Sub Node 'Actions'"
write ""
write "============================="
write ""

$preSessionId = $config.AddNodeToTrigger("UserSessionDisconnect", "Session Disconnect Node")

# --- Create Actions Subnode for Network Disconnected Trigger ---
write ""
write "============================="
write ""
write "Adding Network Disconnected Sub Node 'Actions'"
write ""
write "============================="
write ""

$preSessionId = $config.AddNodeToTrigger("UserNetworkDisconnected", "Network Disconnected Node")

# --- Create Actions Subnode for Network Connected Trigger ---
write ""
write "============================="
write ""
write "Adding Network Connected Sub Node 'Actions'"
write ""
write "============================="
write ""

$userNetworkConnectedId = $config.AddNodeToTrigger("UserNetworkConnected", "Network Connected Node")

# --- Windows 10 start menu action (user logon trigger)  ---
write ""
write "===================================="
write ""
write "Adding Windows 10 Start Menu action"
write ""
write "===================================="
write ""

$startMenuAction = New-Object EMConfigAPI.Custom.Windows10StartMenu("Sample W10 Start Menu")

# uwp apps
$startMenuAction.AddUwpApplication("Microsoft.Microsoft3DViewer_8wekyb3d8bbwe!Microsoft.Microsoft3DViewer", "3D Viewer")

$startMenuAction.AddUwpApplication("Microsoft.WindowsCalculator_8wekyb3d8bbwe!App", "Calculator")

# w32 apps
$startMenuAction.AddWin32Application(
      "%ProgramFiles(X86)%\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe",
      "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Acrobat Reader DC.lnk",
      "", # Arguments
      "", # Working directory
      "", # Description
      "Maximized",  # ShowCommand
      0,  # icon index
      "%SystemRoot%\Installer\{AC76BA86-7AD7-1033-7B44-AC0F074E4100}\SC_Reader.ico"  # icon location
      )

# command prompt
$startMenuAction.AddWin32Application(
    "%SystemRoot%\system32\cmd.exe",
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk",
    "",  # Arguments
    "%HOMEDRIVE%%HOMEPATH%",
    "Performs text-based (command-line) functions.",
    "Normal",
    0,  # Icon index
    "%windir%\system32\cmd.exe",  # Icon location
    "Windows System"  # parent display name
    );

# azure command prompt
$startMenuAction.AddWin32Application(
    "%SystemRoot%\System32\cmd.exe",
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Microsoft Azure\Microsoft Azure SDK for .NET\v2.9\Microsoft Azure Command Prompt - v2.9.lnk",
    "/E:ON /V:ON /K ""C:\Program Files\Microsoft SDKs\Azure\.NET SDK\v2.9\\bin\setenv.cmd""",
    "%ProgramFiles%\Microsoft SDKs\Azure\.NET SDK\v2.9\"
    )

#   uninstall link
$startMenuAction.AddWin32Application(
    "%SystemRoot%\System32\msiexec.exe",
    "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Debugging Tools for Windows (x64)\Uninstall Debugging Tools for Windows (x64).lnk",
    "/x {7F2E5C3B-DBDF-469D-AD8D-F686D3B71176}",
    "Uninstalls Debugging Tools for Windows (x64)"
    )

                    
$tileLayoutXml =
@"
<LayoutModificationTemplate xmlns:defaultlayout='http://schemas.microsoft.com/Start/2014/FullDefaultLayout' xmlns:start='http://schemas.microsoft.com/Start/2014/StartLayout' Version='1' xmlns='http://schemas.microsoft.com/Start/2014/LayoutModification'>
  <LayoutOptions StartTileGroupCellWidth='6' />
  <DefaultLayoutOverride>
    <StartLayoutCollection>
      <defaultlayout:StartLayout GroupCellWidth='6'>
        <start:Group Name=''>
          <start:DesktopApplicationTile Size='2x2' Column='0' Row='0' DesktopApplicationLinkPath='%APPDATA%\Microsoft\Windows\Start Menu\Programs\Debugging Tools for Windows (x64)\Uninstall Debugging Tools for Windows (x64).lnk' />
          <start:Tile Size='2x2' Column='2' Row='0' AppUserModelID='Microsoft.Microsoft3DViewer_8wekyb3d8bbwe!Microsoft.Microsoft3DViewer' />
          <start:DesktopApplicationTile Size='2x2' Column='0' Row='2' DesktopApplicationLinkPath='%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk' />
        </start:Group>
        <start:Group>
          <start:Tile Size='4x2' Column='0' Row='0' AppUserModelID='Microsoft.WindowsCalculator_8wekyb3d8bbwe!App' />
        </start:Group>
      </defaultlayout:StartLayout>
    </StartLayoutCollection>
  </DefaultLayoutOverride>
</LayoutModificationTemplate>
"@

$startMenuAction.TileLayoutXml = $tileLayoutXml

$startMenuNodeId = $config.AddNodeToTrigger("UserLogon", "Windows 10 Start Menu")

$startMenuActionId = $config.AddActionOrCondition($startMenuNodeId, $startMenuAction)

#==============================================
#   Set undo action sequencing on
#==============================================

$config.EnableUndoActionSequencing()

#==============================================
#   Save
#==============================================


$config.SaveConfig("$pwd\Sample.aemp")
write ""
write "============================="
write ""
write "Saved config Sample.aemp"
write ""
write "============================="

if (!(test-path Env:\CONFIGAPILOCATION))
{
    # Run console on created aemp file

    write ""
    write "Running console on new config"
    write ""
    write "============================="
    write ""

    invoke-item "$pwd\Sample.aemp"
}
#========================================================
#   Create configuration with logon sub triggers disabled
#========================================================

write "Create configuration with logon sub triggers disabled"
# --- Make new config ---
write "Make new config"
$config.NewConfig()


# --- Disable logon subtriggers ---
$config.DisableLogonSubTriggers()

# --- condition to user logon trigger's environment ---
write "condition to user logon trigger's environment"
$computerNameObject = new-object EMConfigAPI.Conditions.ComputerName("Equal", "MyComputer")
[void] $config.AddEnvironmentActionOrCondition("UserLogonEnvironment", $computerNameObject)


$config.SaveConfig("$pwd\Sample-LegacyMode.aemp")

write ""
write "============================="
write ""
write "Saved config Sample-LegacyMode.aemp"
write ""
write "============================="