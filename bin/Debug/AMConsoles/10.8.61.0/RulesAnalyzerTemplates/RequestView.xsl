<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:key name="users" match="user" use="@sid"/>
<xsl:key name="configs" match="config" use="@name"/>
<xsl:param name="display-filter">none</xsl:param>
<xsl:param name="user-filter">none</xsl:param>
<xsl:param name="request-filter">none</xsl:param>
<!--Translation parameters-->
<xsl:param name="requestinformation">Request information</xsl:param>
<xsl:param name="fileinformation">File information</xsl:param>
<xsl:param name="userinformation">User information</xsl:param>
<xsl:param name="overallresult">Overall Result</xsl:param>
<xsl:param name="ruleresult">Rule Result</xsl:param>
<xsl:param name="timinginformation">Timing information</xsl:param>
<xsl:param name="time">Time</xsl:param>
<xsl:param name="user">User</xsl:param>
<xsl:param name="allow">Allow</xsl:param>
<xsl:param name="default">Default</xsl:param>
<xsl:param name="defaultrules">Default Rules</xsl:param>
<xsl:param name="exemptions">Exemptions</xsl:param>
<xsl:param name="systemprocess">System Process</xsl:param>
<xsl:param name="none">None</xsl:param>
<xsl:param name="group">Group</xsl:param>
<xsl:param name="exempt">Exempt</xsl:param>
<xsl:param name="execute">Execute</xsl:param>
<xsl:param name="overwrite">Overwrite</xsl:param>
<xsl:param name="rename">Rename</xsl:param>
<xsl:param name="printpage">Print Page</xsl:param>
<xsl:param name="return">Return</xsl:param>
<xsl:param name="summary">Summary</xsl:param>
<xsl:param name="urlinformation">Url information</xsl:param>
<xsl:param name="requestedurl">Requested Url</xsl:param>
<xsl:param name="redirectionurl">Redirection Url</xsl:param>
<xsl:param name="browser">Browser</xsl:param>
<xsl:param name="file">File</xsl:param>
<xsl:param name="arguments">Arguments</xsl:param>
<xsl:param name="owner">Owner</xsl:param>
<xsl:param name="device">Device</xsl:param>
<xsl:param name="parent">Parent</xsl:param>
<xsl:param name="type">Type</xsl:param>
<xsl:param name="deny">Deny</xsl:param>
<xsl:param name="userprivilegesmodified">User Privilages Modified</xsl:param>
<xsl:param name="urldirect">Url Direct</xsl:param>
<xsl:param name="urlelevate">URL Elevate</xsl:param>
<xsl:param name="urlallow">URL Allow</xsl:param>
<xsl:param name="impersonating">impersonating</xsl:param>
<xsl:param name="session">Session</xsl:param>
<xsl:param name="clients">Clients</xsl:param>
<xsl:param name="computer">Computer</xsl:param>
<xsl:param name="organisationalunit">Organisational Unit</xsl:param>
<xsl:param name="computergroups">Computer Group(s)</xsl:param>
<xsl:param name="ruleinformation">Rule information</xsl:param>
<xsl:param name="executedfrom">Executed from</xsl:param>
<xsl:param name="matchedfilemetadata">Matched File Metadata</xsl:param>
<xsl:param name="productversionminimum">Product version Minimum</xsl:param>
<xsl:param name="productversionmaximum">Product Version Maximum</xsl:param>
<xsl:param name="fileversionminimum">File Version Minimum</xsl:param>
<xsl:param name="fileversionmaximum">File Version Maximum</xsl:param>
<xsl:param name="vendorname">Vender Name</xsl:param>
<xsl:param name="companyname">Company Name</xsl:param>
<xsl:param name="productname">Product Name</xsl:param>
<xsl:param name="filedescription">File Description</xsl:param>
<xsl:param name="target">Target</xsl:param>
<xsl:param name="trustedownership">Trusted Ownership</xsl:param>
<xsl:param name="userprivilegeselevated">User Privileges Elevated</xsl:param>
<xsl:param name="allowedsignature">Allowed Signature</xsl:param>
<xsl:param name="deniedsignature">Denied Signature</xsl:param>
<xsl:param name="allowedfile">Allowed File</xsl:param>
<xsl:param name="deniedfile">Denied File</xsl:param>
<xsl:param name="deniedfolder">Denied Folder</xsl:param>
<xsl:param name="allowedfolder">Allowed Folder</xsl:param>
<xsl:param name="alloweddrive">Allowed Drive</xsl:param>
<xsl:param name="denieddrive">Denied Drive</xsl:param>
<xsl:param name="userprivilegesrestricted">User Privileges Restricted</xsl:param>
<xsl:param name="deniedwinstoreapp">Denied Win Store App</xsl:param>
<xsl:param name="allowedwinstoreapp">Allowed Win Store App</xsl:param>
<xsl:param name="uacreplacement">UAC Replacement</xsl:param>
<xsl:param name="processingtime">Processing Time</xsl:param>
<xsl:param name="date">Date</xsl:param>
<xsl:param name="reason">Reason</xsl:param>
<!--Translation parameters End-->
  
  
<!-- ============================================================================== -->
<!-- Template that matches the root node, it only sets the stylesheet and script    -->
<!-- files that are gonig to be used to display this file   			    -->
<!-- ============================================================================== -->


<xsl:template match="/">
  <xsl:apply-templates/>	
</xsl:template>
      

<xsl:template match="Explanations">
  <table width="100%">
    <tr>
      <td width="80%"></td>
      <td style="CURSOR:hand">
        <xsl:attribute name="onClick">
          printPage();
        </xsl:attribute>
        <img border="0" src="./Images/print_16.png" width="16" height="16"></img>				
      </td>
      <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070;CURSOR:hand">
        <xsl:attribute name="onClick">
          printPage();
        </xsl:attribute>
        <xsl:value-of select="$printpage" />
      </td>
    </tr>
    <tr>			
      <td width="80%"></td>
      <td style="CURSOR:hand">
        <xsl:attribute name="onClick">
          closeSingleRequest();
        </xsl:attribute>
        <img border="0" src="./Images/arrow_left_16.png" width="16" height="16"></img>
      </td>
      <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070;CURSOR:hand">
          <xsl:attribute name="onClick">
            closeSingleRequest();
          </xsl:attribute>
        <xsl:value-of select="$return" />
      </td>			
    </tr>
    <tr>			
      <td width="80%"></td>
      <td style="CURSOR:hand">
        <xsl:attribute name="onClick">
          showRequests("summary", "none");
        </xsl:attribute>
        <img border="0" src="./Images/RA_IndividualLogFile_16.png" width="16" height="16"></img>
      </td>
      <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070;CURSOR:hand">
          <xsl:attribute name="onClick">
            showRequests("summary", "none");
          </xsl:attribute>
        <xsl:value-of select="$summary" />
      </td>			
    </tr>
  </table>		

  <xsl:apply-templates />
  
</xsl:template>


<!-- ============================================================================== -->
<!-- Template that matches the log node (there is only one per document		    -->
<!-- ============================================================================== -->

<xsl:template match="log">
  <xsl:apply-templates/>
</xsl:template>



<!-- ============================================================================== -->
<!-- Template that matches the request nodes										-->
<!-- ============================================================================== -->

<xsl:template match="request">

  <xsl:if test="@id = $request-filter">
    <table width="100%">
      <tr><td width="100%" style="FONT:16pt Verdana,sans-serif;COLOR:#707070">
        <xsl:value-of select="$requestinformation" />:
      </td></tr>
    </table>				
    <br/>
    <table width="100%">
      <tr>
        <xsl:choose>
          <xsl:when test="@type = 'Browser'">
            <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070" >
              <xsl:value-of select="$urlinformation" />:
            </td>
          </xsl:when>
          <xsl:otherwise>
            <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070" >
              <xsl:value-of select="$fileinformation" />:
            </td>
          </xsl:otherwise>
        </xsl:choose>
      </tr>
    </table>
      <table>
        <xsl:choose>
          <xsl:when test="@type = 'Browser'">
            <tr>
              <td width="1%"></td>
              <td width="15%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$requestedurl" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./urlRedirection/@Prohibited"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$redirectionurl" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./urlRedirection/@RedirectedTo"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$browser" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@name"/>
                <xsl:if test="string(./file/@description)">
                  (<xsl:value-of select="./file/@description"/>)
                </xsl:if>
              </td>
            </tr>
          </xsl:when>
          <xsl:otherwise>
            <tr>
              <td width="1%"></td>
              <td width="15%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$file" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@name"/>
                <xsl:if test="string(./file/@description)">
                  (<xsl:value-of select="./file/@description"/>)
                </xsl:if>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$arguments" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@cmdline"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$owner" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@owner"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$device" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@device"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$parent" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./parent/@name"/>
                <xsl:if test="string(./parent/@description)">
                  (<xsl:value-of select="./parent/@description"/>)
                </xsl:if>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="$type" />:
              </td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:choose>
                  <xsl:when test="@type = 'Execute'">
                    <xsl:value-of select="$execute"/>
                  </xsl:when>
                  <xsl:when test="@type = 'Overwrite'">
                    <xsl:value-of select="$overwrite"/>
                  </xsl:when>
                  <xsl:when test="@type = 'Rename'">
                    <xsl:value-of select="$rename"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="@type"/>
                  </xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>

        <tr>
          <td></td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="$overallresult" />:
          </td>
          <xsl:if test="@result = 'Deny'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:red"><xsl:value-of select="$deny"/></td>
          </xsl:if>
          <xsl:if test="@result = 'Allow'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:green"><xsl:value-of select='$allow'/></td>
          </xsl:if>
          <xsl:if test="@result = 'User Rights Modified'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:green"><xsl:value-of select='$userprivilegesmodified'/></td>
          </xsl:if>
          <xsl:if test="@result = 'URL Redirect'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:red"><xsl:value-of select="$urldirect"/></td>
          </xsl:if>
          <xsl:if test="@result = 'URL Elevate'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:green"><xsl:value-of select="$urlelevate"/></td>
          </xsl:if>
          <xsl:if test="@result = 'URL Allow'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:green"><xsl:value-of select="$urlallow"/></td>
          </xsl:if>
        </tr>
      </table>
      <br/>
      <table width="100%">
        <tr>
          <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070">
            <xsl:value-of select="$userinformation" />:
          </td>
        </tr>
      </table>
      <table>	
        <tr>
          <td width="1%"></td>
          <td width="10%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="$user" />:
          </td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="./user/@domain"/>\<xsl:value-of select="./user/@name"/>
            <xsl:choose>
              <xsl:when test="./user/@impersonating = 'None'">
                <!-- not impersonating so do nothing -->
              </xsl:when>
              <xsl:otherwise>
                (<xsl:value-of select="./user/@impersonating"/> <xsl:value-of select="$impersonating" />)
              </xsl:otherwise>
            </xsl:choose>
          </td>						
        </tr>
        <tr>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="$session" />:
          </td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="./session/@number"/></td>						
        </tr>
        <tr>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="$clients" />:
          </td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="./session/@client"/></td>						
        </tr>
        <tr>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="$computer" />:
          </td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="./session/@computer"/>
          </td>
        </tr>
    <tr>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
        <xsl:value-of select="$organisationalunit" />:
      </td>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
        <xsl:value-of select="./session/@ou"/>
      </td>
    </tr>
    <tr>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
        <xsl:value-of select="$computergroups" />:
      </td>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
        <xsl:value-of select="./session/@computergroups"/>
      </td>
    </tr>	
      </table>		
      <br/>
      <table width="100%">
        <tr><td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070">
          <xsl:value-of select="$ruleinformation" />:
        </td></tr>
      </table>

      <xsl:apply-templates select="policy"/>				
    
      <table width="100%">
        <tr>
          <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070">
            <xsl:value-of select="$timinginformation" />:
          </td>
        </tr>
      </table>
      <table>					
        <tr>
          <td width="1%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>					
          <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="$time" />:
          </td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="@time"/></td>						
        </tr>
        <tr>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>					
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="$date"/>:</td>
          <td id="date" style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="@date"/></td>						
        </tr>
        <tr>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>					
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="$processingtime"/>:</td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="@totaltime"/></td>						
        </tr>
      </table>	
  </xsl:if>				
</xsl:template>



<xsl:template match="file">
  <td class="small-border-trigger">
    <xsl:attribute name="onClick">
      showSingleRequest('<xsl:value-of select="../@id"/>');
    </xsl:attribute>
    <xsl:value-of select="@name"/> [<xsl:value-of select="@device"/>]<br/>
  </td>
</xsl:template>


  <xsl:template match="parent">
    <xsl:value-of select="$executedfrom" />: <xsl:value-of select="@name"/><br/>
</xsl:template>


<xsl:template match="session">
  <b> <xsl:value-of select="$session" />: </b> <xsl:value-of select="@number"/><br/>
</xsl:template>


<xsl:template match="user">
  <b><xsl:value-of select="$user" />: </b> <xsl:value-of select="@domain"/>/<xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="file_metadata">
  <!--If we have some attributes-->
  <xsl:if test="count(@*)>0"> 
  <tr>
    <td style="BACKGROUND:#E0E0E0"></td>
    <td style="vertical-align:text-top;FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
      <xsl:value-of select="$matchedfilemetadata" />: </td>
    <td>
      <table cellpadding="0" cellspacing="0" width="100%" bgcolor="#E0E0E0" style="COLOR:#C0C0C0;BORDER:0">
        <xsl:if test="string-length(@ProductVersionMinimum)">
          <tr>
            <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="$productversionminimum" />:</td>
            <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="@ProductVersionMinimum"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="string-length(@ProductVersionMaximum)">
          <tr>
            <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="$productversionmaximum" />:</td>
            <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="@ProductVersionMaximum"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="string-length(@FileVersionMinimum)">
          <tr>
            <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="$fileversionminimum" />:</td>
            <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="@FileVersionMinimum"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="string-length(@FileVersionMaximum)">
          <tr>
            <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="$fileversionmaximum" />:</td>
            <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="@FileVersionMaximum"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="string-length(@VendorName)">
          <tr>
            <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="$vendorname" />:</td>
            <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="@VendorName"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="string-length(@CompanyName)">
          <tr>
            <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="$companyname" />:</td>
            <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="@CompanyName"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="string-length(@ProductName)">
          <tr>
            <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="$productname" />:</td>
            <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="@ProductName"/>
            </td>
          </tr>
        </xsl:if>
        <xsl:if test="string-length(@FileDescription)">
          <tr>
            <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="$filedescription" />:</td>
            <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
              <xsl:value-of select="@FileDescription"/>
            </td>
          </tr>
        </xsl:if>
      </table>
    </td>
  </tr>
  </xsl:if>
</xsl:template>

<xsl:template match="policy">
  <table width="100%" bgcolor="#E0E0E0" style="COLOR:#C0C0C0;BORDER:0">
    <tr>
      <td width="5%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
        <xsl:choose>
        <xsl:when test="@type = 'Default'">
          <img border="0" src="./Images/AdvancedSettings_16.png" width="16" height="16"></img>
        </xsl:when>
        <xsl:when test="@type = 'Group'">
          <img border="0" src="./Images/groupRule_16.png" width="16" height="16"></img>
        </xsl:when>
        <xsl:when test="@type = 'User'">
          <img border="0" src="./Images/User_16.png" width="16" height="16"></img>
        </xsl:when>	
        <xsl:when test="@type = 'Device'">
          <img border="0" src="./Images/device_rules_16.png" width="16" height="16"></img>
        </xsl:when>	
        <xsl:when test="@type = 'Custom'">
          <img border="0" src="./Images/custom_rules_16.png" width="16" height="16"></img>
        </xsl:when>	
              <xsl:when test="@type = 'Scripted'">
                <img border="0" src="./Images/scripted_rule_16.png" width="16" height="16"></img>
              </xsl:when>
              <xsl:when test="@type = 'Process'">
                <img border="0" src="./Images/process_rule_16.png" width="16" height="16"></img>
              </xsl:when>
        <xsl:when test="@type = 'Exemptions'">
          <img border="0" src="./Images/AppSenseExemptions_16.png" width="16" height="16"></img>
        </xsl:when>	
        </xsl:choose>
      </td>	
      <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
        <xsl:value-of select="$type" />:</td>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#0000C4;CURSOR:hand;BACKGROUND:#E0E0E0;TEXT-DECORATION:underline">
        <xsl:attribute name="onClick">
          showExplanation('<xsl:value-of select="@type"/>');
        </xsl:attribute>
        <xsl:choose>
          <xsl:when test="@type = 'Default'">
          <xsl:value-of select="$default"/>
          </xsl:when>
          <xsl:when test="@type = 'Exemptions'">
            <xsl:value-of select="$exemptions"/>
          </xsl:when>
          <xsl:when test="@type = 'Group'">
            <xsl:value-of select="$group"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@type"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
    </tr>
    <tr>
      <td width="5%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0"></td>	
      <td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
        <xsl:value-of select="$target" />:</td>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
        <!--<xsl:value-of select="@name"/>-->
        <xsl:choose>
          <xsl:when test="@name = 'Default Rules'">
            <xsl:value-of select="$defaultrules"/>
          </xsl:when>
          <xsl:when test="@type = 'Exemptions'">
            <xsl:value-of select="$exemptions"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@name"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>
    </tr>
    <tr>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#0000C4;BACKGROUND:#E0E0E0">
        <xsl:choose>
          <xsl:when test="@result = 'Deny'">
            <img border="0" src="./Images/denied_items_16.png" width="16" height="16"></img>
          </xsl:when>
          <xsl:when test="@result = 'Allow'">
            <img border="0" src="./Images/Allowed_items_16.png" width="16" height="16"></img>
          </xsl:when>
          <xsl:when test="@result = 'User Rights Elevated'">
            <img border="0" src="./Images/user_privilege_items_16.png" width="16" height="16"></img>
          </xsl:when>
          <xsl:when test="@result = 'User Rights Modified'">
            <img border="0" src="./Images/user_privilege_items_16.png" width="16" height="16"></img>
          </xsl:when>
          <xsl:when test="@result = 'User Rights Restricted'">
            <img border="0" src="./Images/user_privilege_items_16.png" width="16" height="16"></img>
          </xsl:when>
          <xsl:when test="@result = 'URL Redirect'">
            <img border="0" src="./Images/denied_items_16.png" width="16" height="16"></img>
          </xsl:when>
          <xsl:when test="@result = 'URL Elevate'">
            <img border="0" src="./Images/user_privilege_items_16.png" width="16" height="16"></img>
          </xsl:when>
          <xsl:when test="@result = 'URL Allow'">
            <img border="0" src="./Images/Allowed_items_16.png" width="16" height="16"></img>
          </xsl:when>
        </xsl:choose>
      </td>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
        <xsl:value-of select="$ruleresult" />:
      </td>
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#0000C4;CURSOR:hand;BACKGROUND:#E0E0E0;TEXT-DECORATION:underline">
        <xsl:attribute name="onClick">
          showExplanation('<xsl:value-of select="@result"/>');
        </xsl:attribute>
        <xsl:choose>
          <xsl:when test="@result = 'User Rights Elevated'">
            <xsl:value-of select="$userprivilegeselevated" />
          </xsl:when>
          <xsl:when test="@result = 'Accessible Signature'">
            <xsl:value-of select="$allowedsignature" />
          </xsl:when>
          <xsl:when test="@result = 'Prohibited Signature'">
            <xsl:value-of select="$deniedsignature" />
          </xsl:when>
          <xsl:when test="@result = 'Accessible File'">
            <xsl:value-of select="$allowedfile" />
          </xsl:when>
          <xsl:when test="@result = 'Prohibited File'">
            <xsl:value-of select="$deniedfile" />
          </xsl:when>
          <xsl:when test="@result = 'Prohibited Folder'">
            <xsl:value-of select="$deniedfolder" />
          </xsl:when>
          <xsl:when test="@result = 'Accessible Folder'">
            <xsl:value-of select="$allowedfolder" />
          </xsl:when>
          <xsl:when test="@result = 'Accessible Drive'">
            <xsl:value-of select="$alloweddrive" />
          </xsl:when>
          <xsl:when test="@result = 'Prohibited Drive'">
            <xsl:value-of select="$denieddrive" />
          </xsl:when>
          <xsl:when test="@result = 'User Rights Modified'">
            <xsl:value-of select="$userprivilegesmodified" />
          </xsl:when>
          <xsl:when test="@result = 'User Rights Restricted'">
            <xsl:value-of select="$userprivilegesrestricted" />
          </xsl:when>
          <xsl:when test="@result = 'Prohibited Win Store App'">
            <xsl:value-of select="$deniedwinstoreapp" />
          </xsl:when>
          <xsl:when test="@result = 'Accessible Win Store App'">
            <xsl:value-of select="$allowedwinstoreapp" />
          </xsl:when>
          <xsl:when test="@result = 'Allow'">
            <xsl:value-of select="$allow"/>
          </xsl:when>
          <xsl:when test="@result = 'Deny'">
            <xsl:value-of select="$deny"/>
          </xsl:when>
          <xsl:when test="@result = 'Default'">
          <xsl:value-of select="$default"/>
          </xsl:when>
          <xsl:when test="@result = 'Default Rules'">
            <xsl:value-of select="$defaultrules"/>
          </xsl:when>
          <xsl:when test="@result = 'None'">
            <xsl:value-of select="$none"/>
          </xsl:when>
          <xsl:when test="@result = 'Group'">
            <xsl:value-of select="$group"/>
          </xsl:when>
          <xsl:when test="@result = 'Exempt'">
            <xsl:value-of select="$exempt"/>
          </xsl:when>
          <xsl:when test="@result = 'Execute'">
            <xsl:value-of select="$execute"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="@result"/>
          </xsl:otherwise>
        </xsl:choose>
      </td>		
    </tr>
    <xsl:choose>
      <xsl:when test="@rule = 'none'">
        <!-- do nothing -->
      </xsl:when>
      <xsl:otherwise>
        <tr>
          <td style="BACKGROUND:#E0E0E0"></td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
            <xsl:value-of select="$reason"/>: </td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#0000C4;CURSOR:hand;BACKGROUND:#E0E0E0;TEXT-DECORATION:underline">
            <xsl:attribute name="onClick">
              showExplanation('<xsl:value-of select="@rule"/>');
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="@rule = 'Trusted Ownership'">
                <xsl:value-of select="$trustedownership" />
              </xsl:when>
              <xsl:when test="@rule = 'User Rights Elevated'">
                <xsl:value-of select="$userprivilegeselevated" />
              </xsl:when>
              <xsl:when test="@rule = 'Accessible Signature'">
                <xsl:value-of select="$allowedsignature" />
              </xsl:when>
              <xsl:when test="@rule = 'Prohibited Signature'">
                <xsl:value-of select="$deniedsignature" />
              </xsl:when>
              <xsl:when test="@rule = 'Accessible File'">
                <xsl:value-of select="$allowedfile" />
              </xsl:when>
              <xsl:when test="@rule = 'Prohibited File'">
                <xsl:value-of select="$deniedfile" />
              </xsl:when>
              <xsl:when test="@rule = 'Prohibited Folder'">
                <xsl:value-of select="$deniedfolder" />
              </xsl:when>
              <xsl:when test="@rule = 'Accessible Folder'">
                <xsl:value-of select="$allowedfolder" />
              </xsl:when>
              <xsl:when test="@rule = 'Accessible Drive'">
                <xsl:value-of select="$alloweddrive" />
              </xsl:when>
              <xsl:when test="@rule = 'Prohibited Drive'">
                <xsl:value-of select="$denieddrive" />
              </xsl:when>
              <xsl:when test="@rule = 'User Rights Modified'">
                <xsl:value-of select="$userprivilegesmodified" />
              </xsl:when>
              <xsl:when test="@rule = 'User Rights Restricted'">
                <xsl:value-of select="$userprivilegesrestricted" />
              </xsl:when>
              <xsl:when test="@rule = 'Prohibited Win Store App'">
                <xsl:value-of select="$deniedwinstoreapp" />
              </xsl:when>
              <xsl:when test="@rule = 'Accessible Win Store App'">
                <xsl:value-of select="$allowedwinstoreapp" />
              </xsl:when>
              <xsl:when test="@rule = 'Allow'">
                <xsl:value-of select="$allow"/>
              </xsl:when>
              <xsl:when test="@rule = 'Default'">
                <xsl:value-of select="$default"/>
              </xsl:when>
              <xsl:when test="@rule = 'Default Rules'">
                <xsl:value-of select="$defaultrules"/>
              </xsl:when>
              <xsl:when test="@rule = 'System Process'">
                <xsl:value-of select="$systemprocess"/>
              </xsl:when>
              <xsl:when test="@rule = 'None'">
                <xsl:value-of select="$none"/>
              </xsl:when>
              <xsl:when test="@rule = 'Group'">
                <xsl:value-of select="$group"/>
              </xsl:when>
              <xsl:when test="@rule = 'Exempt'">
                <xsl:value-of select="$exempt"/>
              </xsl:when>
              <xsl:when test="@rule = 'Execute'">
                <xsl:value-of select="$execute"/>
              </xsl:when>
              <xsl:when test="@rule = 'UAC Replacement'">
                <xsl:value-of select="$uacreplacement"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="@rule"/>
              </xsl:otherwise>
            </xsl:choose>
          </td>
        </tr>
        <tr>
          <xsl:if test="string-length(@data)">
          <td style="BACKGROUND:#E0E0E0"></td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Match: </td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0"><xsl:value-of select="@data"/></td>

          </xsl:if>
        </tr>
        <xsl:apply-templates select="file_metadata"/>
      </xsl:otherwise>
    </xsl:choose>
  </table>
  <br/>
</xsl:template>

<!-- ============================================================================== -->
<!-- Avoid output of text node with default template for each of the node types     -->
<!-- ============================================================================== -->

<xsl:template match="config"/>

</xsl:stylesheet>
