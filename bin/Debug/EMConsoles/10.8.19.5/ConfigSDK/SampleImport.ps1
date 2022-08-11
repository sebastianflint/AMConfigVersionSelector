#============================================================
#   Powershell sample - import template
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

# Create configuration object
$config = new-object EMConfigAPI.EMConfiguration

[Void] $config.ImportPolicyTemplateToTrigger("ComputerStartup","$pwd\ComputerStartupTemplate.xml")

[Void] $config.ImportPolicyTemplateToTrigger("UserProcessStarted","$pwd\IeStartTemplate.xml")

$config.SaveConfig("$pwd\TestImport1.aemp")

$config.NewConfig()

[Void] $config.ImportPolicyTemplateToTrigger("UserLogon","$pwd\BackupDesktopShortcutTemplate.xml")

$config.SaveConfig("$pwd\TestImport2.aemp")

$config.NewConfig()

$inode = $config.AddNodeToTrigger("UserLogon","MainNode")

[Void] $config.ImportPolicyTemplateToNode($inode,"$pwd\BackupDesktopShortcutTemplate.xml")

$config.SaveConfig("$pwd\TestImport3.aemp")

$config.NewConfig()

try
{
    $config.ImportPolicyTemplateToTrigger("ComputerStartup","$pwd\IeStartTemplate.xml")
}
catch
{
    " --> Got expected exception: {0}" -f $_
}

try
{
    $config.ImportPolicyTemplateToTrigger("UserProcessStarted","$pwd\ComputerStartupTemplate.xml")
}
catch
{
    " --> Got expected exception: {0}"  -f $_
}

