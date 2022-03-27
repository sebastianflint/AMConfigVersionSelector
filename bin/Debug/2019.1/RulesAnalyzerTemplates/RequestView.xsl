<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:key name="users" match="user" use="@sid"/>
<xsl:key name="configs" match="config" use="@name"/>
<xsl:param name="display-filter">none</xsl:param>
<xsl:param name="user-filter">none</xsl:param>
<xsl:param name="request-filter">none</xsl:param>


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
				Print Page	
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
					Return
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
					Summary	
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
			<tr><td width="100%" style="FONT:16pt Verdana,sans-serif;COLOR:#707070">Request Information</td></tr>
		</table>				
		<br/>
		<table width="100%">
			<tr>
        <xsl:choose>
          <xsl:when test="@type = 'Browser'">
            <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070" >URL information:</td>
          </xsl:when>
          <xsl:otherwise>
				    <td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070" >File information:</td>
          </xsl:otherwise>
        </xsl:choose>
			</tr>
		</table>
			<table>
        <xsl:choose>
          <xsl:when test="@type = 'Browser'">
            <tr>
              <td width="1%"></td>
              <td width="15%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Requested URL:</td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./urlRedirection/@Prohibited"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Redirection URL:</td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./urlRedirection/@RedirectedTo"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Browser:</td>
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
              <td width="15%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070">File:</td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@name"/>
                <xsl:if test="string(./file/@description)">
                  (<xsl:value-of select="./file/@description"/>)
                </xsl:if>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Arguments:</td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@cmdline"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Owner:</td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@owner"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Device:</td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./file/@device"/>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Parent:</td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="./parent/@name"/>
                <xsl:if test="string(./parent/@description)">
                  (<xsl:value-of select="./parent/@description"/>)
                </xsl:if>
              </td>
            </tr>
            <tr>
              <td></td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Type:</td>
              <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
                <xsl:value-of select="@type"/>
              </td>
            </tr>
          </xsl:otherwise>
        </xsl:choose>

				<tr>
					<td></td>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"> Overall Result:</td>
					<xsl:if test="@result = 'Deny'">
						<td style="FONT:10pt Verdana,sans-serif;COLOR:red"><xsl:value-of select="@result"/></td>
					</xsl:if>
					<xsl:if test="@result = 'Allow'">
						<td style="FONT:10pt Verdana,sans-serif;COLOR:green"><xsl:value-of select="@result"/></td>
					</xsl:if>
					<xsl:if test="@result = 'User Rights Modified'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:green">User Privileges Modified</td>
					</xsl:if>
          <xsl:if test="@result = 'URL Redirect'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:red"><xsl:value-of select="@result"/></td>
          </xsl:if>
          <xsl:if test="@result = 'URL Elevate'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:green"><xsl:value-of select="@result"/></td>
          </xsl:if>
          <xsl:if test="@result = 'URL Allow'">
            <td style="FONT:10pt Verdana,sans-serif;COLOR:green"><xsl:value-of select="@result"/></td>
          </xsl:if>
				</tr>
			</table>
			<br/>
			<table width="100%">
				<tr>
					<td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070">User information:</td>
				</tr>
			</table>
			<table>	
				<tr>
					<td width="1%"></td>
					<td width="10%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070">User:</td>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
						<xsl:value-of select="./user/@domain"/>\<xsl:value-of select="./user/@name"/>
						<xsl:choose>
							<xsl:when test="./user/@impersonating = 'None'">
								<!-- not impersonating so do nothing -->
							</xsl:when>
							<xsl:otherwise>
								(<xsl:value-of select="./user/@impersonating"/> impersonating)	
							</xsl:otherwise>
						</xsl:choose>
					</td>						
				</tr>
				<tr>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Session:</td>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="./session/@number"/></td>						
				</tr>
				<tr>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Clients:</td>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="./session/@client"/></td>						
				</tr>
        <tr>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Computer:</td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
            <xsl:value-of select="./session/@computer"/>
          </td>
        </tr>
		<tr>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Organizational Unit:</td>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
				<xsl:value-of select="./session/@ou"/>
			</td>
		</tr>
		<tr>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Computer Group(s):</td>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">
				<xsl:value-of select="./session/@computergroups"/>
			</td>
		</tr>	
			</table>		
			<br/>
			<table width="100%">
				<tr><td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070">Rule information:</td></tr>
			</table>

			<xsl:apply-templates select="policy"/>				
		
			<table width="100%">
				<tr>
					<td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070">Timing information:</td>
				</tr>
			</table>
			<table>					
				<tr>
					<td width="1%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>					
					<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Time:</td>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="@time"/></td>						
				</tr>
				<tr>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>					
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Date:</td>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"><xsl:value-of select="@date"/></td>						
				</tr>
				<tr>
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070"></td>					
					<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070">Processing Time:</td>
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
	Executed from: <xsl:value-of select="@name"/><br/>
</xsl:template>


<xsl:template match="session">
	<b> Session: </b> <xsl:value-of select="@number"/><br/>
</xsl:template>


<xsl:template match="user">
	<b>User: </b> <xsl:value-of select="@domain"/>/<xsl:value-of select="@name"/>
</xsl:template>

<xsl:template match="file_metadata">
	<!--If we have some attributes-->
	<xsl:if test="count(@*)>0"> 
	<tr>
		<td style="BACKGROUND:#E0E0E0"></td>
		<td style="vertical-align:text-top;FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Matched File Metadata: </td>
		<td>
			<table cellpadding="0" cellspacing="0" width="100%" bgcolor="#E0E0E0" style="COLOR:#C0C0C0;BORDER:0">
				<xsl:if test="string-length(@ProductVersionMinimum)">
					<tr>
						<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Product Version Minimum:</td>
						<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
							<xsl:value-of select="@ProductVersionMinimum"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="string-length(@ProductVersionMaximum)">
					<tr>
						<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Product Version Maximum:</td>
						<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
							<xsl:value-of select="@ProductVersionMaximum"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="string-length(@FileVersionMinimum)">
					<tr>
						<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">File Version Minimum:</td>
						<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
							<xsl:value-of select="@FileVersionMinimum"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="string-length(@FileVersionMaximum)">
					<tr>
						<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">File Version Maximum:</td>
						<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
							<xsl:value-of select="@FileVersionMaximum"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="string-length(@VendorName)">
					<tr>
						<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Vendor Name:</td>
						<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
							<xsl:value-of select="@VendorName"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="string-length(@CompanyName)">
					<tr>
						<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Company Name:</td>
						<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
							<xsl:value-of select="@CompanyName"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="string-length(@ProductName)">
					<tr>
						<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Product Name:</td>
						<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">
							<xsl:value-of select="@ProductName"/>
						</td>
					</tr>
				</xsl:if>
				<xsl:if test="string-length(@FileDescription)">
					<tr>
						<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">File Description:</td>
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
			<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Type:</td>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#0000C4;CURSOR:hand;BACKGROUND:#E0E0E0;TEXT-DECORATION:underline">
				<xsl:attribute name="onClick">
					showExplanation('<xsl:value-of select="@type"/>');
				</xsl:attribute>
				<xsl:value-of select="@type"/>
			</td>
		</tr>
		<tr>
			<td width="5%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0"></td>	
			<td width="20%" style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Target:</td>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0"><xsl:value-of select="@name"/></td>
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
      <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Rule Result:</td>
			<td style="FONT:10pt Verdana,sans-serif;COLOR:#0000C4;CURSOR:hand;BACKGROUND:#E0E0E0;TEXT-DECORATION:underline">
				<xsl:attribute name="onClick">
					showExplanation('<xsl:value-of select="@result"/>');
				</xsl:attribute>
        <xsl:choose>
          <xsl:when test="@result = 'User Rights Elevated'">User Privileges Elevated</xsl:when>
          <xsl:when test="@result = 'Accessible Signature'">Allowed Signature</xsl:when>
          <xsl:when test="@result = 'Prohibited Signature'">Denied Signature</xsl:when>
          <xsl:when test="@result = 'Accessible File'">Allowed File</xsl:when>
          <xsl:when test="@result = 'Prohibited File'">Denied File</xsl:when>
          <xsl:when test="@result = 'Prohibited Folder'">Denied Folder</xsl:when>
          <xsl:when test="@result = 'Accessible Folder'">Allowed Folder</xsl:when>
          <xsl:when test="@result = 'Accessible Drive'">Allowed Drive</xsl:when>
          <xsl:when test="@result = 'Prohibited Drive'">Denied Drive</xsl:when>
          <xsl:when test="@result = 'User Rights Modified'">User Privileges Modified</xsl:when>
          <xsl:when test="@result = 'User Rights Restricted'">User Privileges Restricted</xsl:when>
          <xsl:when test="@result = 'Prohibited Win Store App'">Denied Win Store App</xsl:when>
          <xsl:when test="@result = 'Accessible Win Store App'">Allowed Win Store App</xsl:when>          
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
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#707070;BACKGROUND:#E0E0E0">Reason: </td>
          <td style="FONT:10pt Verdana,sans-serif;COLOR:#0000C4;CURSOR:hand;BACKGROUND:#E0E0E0;TEXT-DECORATION:underline">
            <xsl:attribute name="onClick">
              showExplanation('<xsl:value-of select="@rule"/>');
            </xsl:attribute>
            <xsl:choose>
              <xsl:when test="@rule = 'User Rights Elevated'">User Privileges Elevated</xsl:when>
              <xsl:when test="@rule = 'Accessible Signature'">Allowed Signature</xsl:when>
              <xsl:when test="@rule = 'Prohibited Signature'">Denied Signature</xsl:when>
              <xsl:when test="@rule = 'Accessible File'">Allowed File</xsl:when>
              <xsl:when test="@rule = 'Prohibited File'">Denied File</xsl:when>
              <xsl:when test="@rule = 'Prohibited Folder'">Denied Folder</xsl:when>
              <xsl:when test="@rule = 'Accessible Folder'">Allowed Folder</xsl:when>
              <xsl:when test="@rule = 'Accessible Drive'">Allowed Drive</xsl:when>
              <xsl:when test="@rule = 'Prohibited Drive'">Denied Drive</xsl:when>
              <xsl:when test="@rule = 'User Rights Modified'">User Privileges Modified</xsl:when>
              <xsl:when test="@rule = 'User Rights Restricted'">User Privileges Restricted</xsl:when>
              <xsl:when test="@rule = 'Prohibited Win Store App'">Denied Win Store App</xsl:when>
              <xsl:when test="@rule = 'Accessible Win Store App'">Allowed Win Store App</xsl:when>
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
