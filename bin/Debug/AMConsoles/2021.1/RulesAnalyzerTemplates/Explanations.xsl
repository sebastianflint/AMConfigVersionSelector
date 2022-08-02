<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="explain">none</xsl:param>
  <!--Translations-->
  <xsl:param name="explanationof">Explanation of</xsl:param>
  <xsl:param name="userprivilegeselevated">Explanation of User Privileges Elevated</xsl:param>
  <xsl:param name="allowedsignature">Explanation of Allowed Signature</xsl:param>
  <xsl:param name="deniedsignature">Explanation of Denied Signature</xsl:param>
  <xsl:param name="allowedfile">Explanation of Allowed File</xsl:param>
  <xsl:param name="deniedfile">Explanation of Denied File</xsl:param>
  <xsl:param name="deniedfolder">Explanation of Denied Folder</xsl:param>
  <xsl:param name="allowedfolder">Explanation of Allowed Folder</xsl:param>
  <xsl:param name="alloweddrive">Explanation of Allowed Drive</xsl:param>
  <xsl:param name="denieddrive">Explanation of Denied Drive</xsl:param>
  <xsl:param name="userprivilegesmodified">Explanation of User Privileges Modified</xsl:param>
  <xsl:param name="userprivilegesrestricted">Explanation of User Privileges Restricted</xsl:param>
  <xsl:param name="deniedwinstoreapp">Explanation of Denied Win Store App</xsl:param>
  <xsl:param name="allowedwinstoreapp">Explanation of Allowed Win Store App</xsl:param>

  <xsl:param name="group">Group</xsl:param>
  <xsl:param name="default">Default</xsl:param>
  <xsl:param name="user">User</xsl:param>
  <xsl:param name="device">Device</xsl:param>
  <xsl:param name="exemptions">Exemptions</xsl:param>
  <xsl:param name="custom">Custom</xsl:param>
  <xsl:param name="process">Process</xsl:param>
  <xsl:param name="deny">Deny</xsl:param>
  <xsl:param name="allow">Allow</xsl:param>
  <xsl:param name="matchedterm">Matched Term</xsl:param>
  <xsl:param name="trustedownership">Trusted Ownership</xsl:param>
  <xsl:param name="denyscriptfileprogram">Deny Script File Program</xsl:param>
  <xsl:param name="systemprocess">System Process</xsl:param>
  <xsl:param name="clientmappeddrive">Client Mapped Drive</xsl:param>
  <xsl:param name="prohibitedmedia">Prohibited Media</xsl:param>
  <xsl:param name="remotefile">Remote File</xsl:param>
  <xsl:param name="localfile">Local File</xsl:param>
  <xsl:param name="none">None</xsl:param>
  <xsl:param name="limit">Limit</xsl:param>
  <xsl:param name="exempt">Exempt</xsl:param>
  <xsl:param name="accessiblesignature">Accessible Signature</xsl:param>
  <xsl:param name="prohibitedsignature">Prohibited Signature</xsl:param>
  <xsl:param name="accessiblefile">Accessible File</xsl:param>
  <xsl:param name="prohibitedfile">Prohibited File</xsl:param>
  <xsl:param name="prohibitedfolder">Prohibited  Folder</xsl:param>
  <xsl:param name="accessiblefolder">Accessible Folder</xsl:param>
  <xsl:param name="accessibledrive">Accessible Drive</xsl:param>
  <xsl:param name="prohibiteddrive">Prohibited Drive</xsl:param>
  <xsl:param name="fileextension">File Extension</xsl:param>
  <xsl:param name="selfauthorized">Self-authorized</xsl:param>
  <xsl:param name="fileexists">File Exists</xsl:param>
  <xsl:param name="filenotfound">File Not Found</xsl:param>
  <xsl:param name="internal">Internal</xsl:param>
  <xsl:param name="logon">Logon</xsl:param>
  <xsl:param name="noconfiguration">No Configuration</xsl:param>
  <xsl:param name="safespacefile">SafeSpace File</xsl:param>
  <xsl:param name="safespacesignature">SafeSpace Signature</xsl:param>
  <xsl:param name="safespacefolder">SafeSpaceFolder</xsl:param>
  <xsl:param name="safespace">SafeSpace</xsl:param>
  <xsl:param name="selfauthorizednative">Self-authorized (native)</xsl:param>
  <xsl:param name="selfauthorizedinasafespace">Self-authorized (in a SafeSpace)</xsl:param>
  <xsl:param name="scripted">Scripted</xsl:param>
  <xsl:param name="trustedapplication">Trusted Application</xsl:param>
  <xsl:param name="trustedcontent">Trusted Content</xsl:param>
  <xsl:param name="trustedvendors">Trusted Vendors</xsl:param>
  <xsl:param name="certificatevalid">Certificate Valid</xsl:param>
  <xsl:param name="defaultroute">Default Route</xsl:param>
  <xsl:param name="networkitemresource">Network Item: Resource</xsl:param>
  <xsl:param name="networkitemhost">Network Item: Host</xsl:param>
  <xsl:param name="userrightsmodified">User Rights Modified</xsl:param>
  <xsl:param name="userrightselevated">User Rights Elevated</xsl:param>
  <xsl:param name="userrightsrestricted">User Rights Restricted</xsl:param>
  <xsl:param name="activex">ActiveX</xsl:param>
  <xsl:param name="activexelevated">ActiveX Elevated</xsl:param>
  <xsl:param name="activexrestricted">ActiveX Restricted</xsl:param>
  <xsl:param name="file">File</xsl:param>
  <xsl:param name="builtinfile">BuiltIn File</xsl:param>
  <xsl:param name="signature">Signature</xsl:param>
  <xsl:param name="folder">Folder</xsl:param>
  <xsl:param name="selfelevated">Self-Elevated</xsl:param>
  <xsl:param name="userrequestedrulechange">User-Requested Rule Change</xsl:param>
  <xsl:param name="builtincomcomponent">BuiltIn COM Component</xsl:param>
  <xsl:param name="uninstallcontrol">Uninstall Control</xsl:param>
  <xsl:param name="servicecontrol">Service Control</xsl:param>
  <xsl:param name="eventlogcontrol">Event Log Control</xsl:param>
  <xsl:param name="prohibitedwinstoreapp">Prohibited Win Store App</xsl:param>
  <xsl:param name="accessiblewinstoreapp">Accessible Win Store App</xsl:param>
  <xsl:param name="windowsstorepackagedapp">Windows Store (Packaged) App</xsl:param>
  <xsl:param name="prohibitedwinstoreapppublisher">Prohibited Win Store App Publisher</xsl:param>
  <xsl:param name="accessiblewinstoreapppublisher">Accessible Win Store App Publisher</xsl:param>
  <xsl:param name="urldirect">URL Redirect</xsl:param>
  <xsl:param name="redirectedurl">Redirected URL</xsl:param>
  <xsl:param name="urlallow">URL Allow</xsl:param>
  <xsl:param name="allowedurl">Allowed URL</xsl:param>
  <xsl:param name="urlelevate">URL Elevate</xsl:param>
  <xsl:param name="elevatedwebsite">Elevated Website</xsl:param>
  <xsl:param name="exemptfromurlredirection">Exempt for URL redirection</xsl:param>
  <xsl:param name="exemptfromurlelevation">Exempt for URL elevation</xsl:param>
  <xsl:param name="userrightsdefault">User Rights Default</xsl:param>
  <xsl:param name="processterminationcontrolfile">Process Termination Control File</xsl:param>
  <xsl:param name="processterminationcontrolfolder">Termination Control Folder</xsl:param>
  <xsl:param name="uacreplacement">UAC Replacement</xsl:param>

  

<!-- ============================================================================== -->
<!-- Template that matches the root node, it only sets the stylesheet and script    -->
<!-- files that are gonig to be used to display this file   			    -->
<!-- ============================================================================== -->


<xsl:template match="/">
  <xsl:apply-templates/>	
</xsl:template>
      

<xsl:template match="Explanations">
  <xsl:apply-templates />
</xsl:template>


<xsl:template match="Item">
  <xsl:if test="@name = $explain">
    <table>
      <tr>
        <td style="FONT:16pt Verdana,sans-serif;COLOR:#707070">
        <xsl:choose>
            <xsl:when test="@name = 'User Rights Elevated'"><xsl:value-of select="$userprivilegeselevated"/>
            </xsl:when>
            <xsl:when test="@name = 'Accessible Signature'"><xsl:value-of select="$allowedsignature"/>
          </xsl:when>
            <xsl:when test="@name = 'Prohibited Signature'"><xsl:value-of select="$deniedsignature"/>
          </xsl:when>
            <xsl:when test="@name = 'Accessible File'"><xsl:value-of select="$allowedfile"/>
          </xsl:when>
            <xsl:when test="@name = 'Prohibited File'"><xsl:value-of select="$deniedfile"/>
          </xsl:when>
            <xsl:when test="@name = 'Prohibited Folder'"><xsl:value-of select="$deniedfolder"/>
          </xsl:when>
            <xsl:when test="@name = 'Accessible Folder'"><xsl:value-of select="$allowedfolder"/>
          </xsl:when>
            <xsl:when test="@name = 'Accessible Drive'"><xsl:value-of select="$alloweddrive"/>
          </xsl:when>
            <xsl:when test="@name = 'Prohibited Drive'"><xsl:value-of select="$denieddrive"/>
          </xsl:when>
          <xsl:when test="@name = 'User Rights Modified'"><xsl:value-of select="$userprivilegesmodified"/>
          </xsl:when>
          <xsl:when test="@name = 'User Rights Restricted'"><xsl:value-of select="$userprivilegesrestricted"/>
          </xsl:when>
            <xsl:when test="@name = 'Prohibited Win Store App'"><xsl:value-of select="$deniedwinstoreapp"/>
          </xsl:when>
            <xsl:when test="@name = 'Accessible Win Store App'"><xsl:value-of select="$allowedwinstoreapp"/>
          </xsl:when>
          <xsl:when test="@name = 'Group'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$group"/>
          </xsl:when>
          <xsl:when test="@name = 'Default'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$default"/>
          </xsl:when>
          <xsl:when test="@name = 'User'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$user"/>
          </xsl:when>
          <xsl:when test="@name = 'Device'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$device"/>
          </xsl:when>
          <xsl:when test="@name = 'Exemptions'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$exemptions"/>
          </xsl:when>
          <xsl:when test="@name = 'Custom'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$custom"/>
          </xsl:when>
          <xsl:when test="@name = 'Process'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$process"/>
          </xsl:when>
          <xsl:when test="@name = 'Deny'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$deny"/>
          </xsl:when>
          <xsl:when test="@name = 'Allow'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$allow"/>
          </xsl:when>
          <xsl:when test="@name = 'Matched Term'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$matchedterm"/>
          </xsl:when>
          <xsl:when test="@name = 'Trusted Ownership'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$trustedownership"/>
          </xsl:when>
          <xsl:when test="@name = 'Deny Script File Program'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$denyscriptfileprogram"/>
          </xsl:when>
          <xsl:when test="@name = 'System Process'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$systemprocess"/>
          </xsl:when>
          <xsl:when test="@name = 'Client Mapped Drive'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$clientmappeddrive"/>
          </xsl:when>
          <xsl:when test="@name = 'Prohibited Media'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$prohibitedmedia"/>
          </xsl:when>
          <xsl:when test="@name = 'Remote File'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$remotefile"/>
          </xsl:when>
          <xsl:when test="@name = 'Local File'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$localfile"/>
          </xsl:when>
          <xsl:when test="@name = 'None'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$none"/>
          </xsl:when>
          <xsl:when test="@name = 'Limit'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$limit"/>
          </xsl:when>
          <xsl:when test="@name = 'Exempt'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$exempt"/>
          </xsl:when>
          <xsl:when test="@name = 'Accessible Signature'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$accessiblesignature"/>
          </xsl:when>
          <xsl:when test="@name = 'Prohibited Signature'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$prohibitedsignature"/>
          </xsl:when>
          <xsl:when test="@name = 'Accessible File'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$accessiblefile"/>
          </xsl:when>
          <xsl:when test="@name = 'Prohibited File'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$prohibitedfile"/>
          </xsl:when>
          <xsl:when test="@name = 'Prohibited  Folder'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$prohibitedfolder"/>
          </xsl:when>
          <xsl:when test="@name = 'Accessible Folder'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$accessiblefolder"/>
          </xsl:when>
          <xsl:when test="@name = 'Accessible Drive'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$accessibledrive"/>
          </xsl:when>
          <xsl:when test="@name = 'Prohibited Drive'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$prohibiteddrive"/>
          </xsl:when>
          <xsl:when test="@name = 'File Extension'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$fileextension"/>
          </xsl:when>
          <xsl:when test="@name = 'Self-authorized'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$selfauthorized"/>
          </xsl:when>
          <xsl:when test="@name = 'File Exists'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$fileexists"/>
          </xsl:when>
          <xsl:when test="@name = 'File Not Found'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$filenotfound"/>
          </xsl:when>
          <xsl:when test="@name = 'Internal'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$internal"/>
          </xsl:when>
          <xsl:when test="@name = 'Logon'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$logon"/>
          </xsl:when>
          <xsl:when test="@name = 'No Configuration'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$noconfiguration"/>
          </xsl:when>
          <xsl:when test="@name = 'SafeSpace File'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$safespacefile"/>
          </xsl:when>
          <xsl:when test="@name = 'SafeSpace Signature'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$safespacesignature"/>
          </xsl:when>
          <xsl:when test="@name = 'SafeSpaceFolder'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$safespacefolder"/>
          </xsl:when>
          <xsl:when test="@name = 'SafeSpace'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$safespace"/>
          </xsl:when>
          <xsl:when test="@name = 'Self-authorized (native)'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$selfauthorizednative"/>
          </xsl:when>
          <xsl:when test="@name = 'Self-authorized (in a SafeSpace)'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$selfauthorizedinasafespace"/>
          </xsl:when>
          <xsl:when test="@name = 'Scripted'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$scripted"/>
          </xsl:when>
          <xsl:when test="@name = 'Trusted Application'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$trustedapplication"/>
          </xsl:when>
          <xsl:when test="@name = 'Trusted Content'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$trustedcontent"/>
          </xsl:when>
          <xsl:when test="@name = 'Trusted Vendors'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$trustedvendors"/>
          </xsl:when>
          <xsl:when test="@name = 'Certificate Valid'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$certificatevalid"/>
          </xsl:when>
          <xsl:when test="@name = 'Default Route'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$defaultroute"/>
          </xsl:when>
          <xsl:when test="@name = 'Network Item: Resource'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$networkitemresource"/>
          </xsl:when>
          <xsl:when test="@name = 'Network Item: Host'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$networkitemhost"/>
          </xsl:when>
          <xsl:when test="@name = 'User Rights Modified'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$userrightsmodified"/>
          </xsl:when>
          <xsl:when test="@name = 'User Rights Elevated'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$userrightselevated"/>
          </xsl:when>
          <xsl:when test="@name = 'User Rights Restricted'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$userrightsrestricted"/>
          </xsl:when>
          <xsl:when test="@name = 'ActiveX'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$activex"/>
          </xsl:when>
          <xsl:when test="@name = 'ActiveX Elevated'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$activexelevated"/>
          </xsl:when>
          <xsl:when test="@name = 'ActiveX Restricted'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$activexrestricted"/>
          </xsl:when>
          <xsl:when test="@name = 'File'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$file"/>
          </xsl:when>
          <xsl:when test="@name = 'BuiltIn File'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$builtinfile"/>
          </xsl:when>
          <xsl:when test="@name = 'Signature'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$signature"/>
          </xsl:when>
          <xsl:when test="@name = 'Folder'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$folder"/>
          </xsl:when>
          <xsl:when test="@name = 'Self-Elevated'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$selfelevated"/>
          </xsl:when>
          <xsl:when test="@name = 'User-Requested Rule Change'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$userrequestedrulechange"/>
          </xsl:when>
          <xsl:when test="@name = 'BuiltIn COM Component'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$builtincomcomponent"/>
          </xsl:when>
          <xsl:when test="@name = 'Uninstall Control'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$uninstallcontrol"/>
          </xsl:when>
          <xsl:when test="@name = 'Service Control'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$servicecontrol"/>
          </xsl:when>
          <xsl:when test="@name = 'Event Log Control'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$eventlogcontrol"/>
          </xsl:when>
          <xsl:when test="@name = 'Prohibited Win Store App'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$prohibitedwinstoreapp"/>
          </xsl:when>
          <xsl:when test="@name = 'Accessible Win Store App'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$accessiblewinstoreapp"/>
          </xsl:when>
          <xsl:when test="@name = 'Windows Store (Packaged) App'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$windowsstorepackagedapp"/>
          </xsl:when>
          <xsl:when test="@name = 'Prohibited Win Store App Publisher'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$prohibitedwinstoreapppublisher"/>
          </xsl:when>
          <xsl:when test="@name = 'Accessible Win Store App Publisher'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$accessiblewinstoreapppublisher"/>
          </xsl:when>
          <xsl:when test="@name = 'URL Redirect'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$urldirect"/>
          </xsl:when>
          <xsl:when test="@name = 'Redirected URL'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$redirectedurl"/>
          </xsl:when>
          <xsl:when test="@name = 'URL Allow'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$urlallow"/>
          </xsl:when>
          <xsl:when test="@name = 'Allowed URL'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$allowedurl"/>
          </xsl:when>
          <xsl:when test="@name = 'URL Elevate'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$urlelevate"/>
          </xsl:when>
          <xsl:when test="@name = 'Elevated Website'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$elevatedwebsite"/>
          </xsl:when>
          <xsl:when test="@name = 'Exempt for URL redirection'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$exemptfromurlredirection"/>
          </xsl:when>
          <xsl:when test="@name = 'Exempt for URL elevation'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$exemptfromurlelevation"/>
          </xsl:when>
          <xsl:when test="@name = 'User Rights Default'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$userrightsdefault"/>
          </xsl:when>
          <xsl:when test="@name = 'Process Termination Control File'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$processterminationcontrolfile"/>
          </xsl:when>
          <xsl:when test="@name = 'Process Termination Control Folder'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$processterminationcontrolfolder"/>
          </xsl:when>
          <xsl:when test="@name = 'UAC Replacement'">
            <xsl:value-of select="$explanationof" />&#160;<xsl:value-of select="$uacreplacement"/>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="$explanationof" /> <xsl:value-of select="./@name"/></xsl:otherwise>
        </xsl:choose>
      </td>
      </tr>	
    </table>
    <br/>
    <table>
      <tr style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
      <td><xsl:value-of select="."/></td>
      </tr>
    </table>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>
