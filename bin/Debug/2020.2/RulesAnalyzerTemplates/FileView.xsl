<?xml version='1.0'?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:key name="users" match="user" use="@sid"/>
<xsl:key name="configs" match="config" use="@name"/>
<xsl:param name="display-filter">none</xsl:param>
<xsl:param name="user-filter">none</xsl:param>
<xsl:param name="request-filter">none</xsl:param>
<xsl:param name="applicationcontrolagent">Application Control Agent</xsl:param>
<xsl:param name="user">User</xsl:param>
<xsl:param name="starttime">StartTime</xsl:param>
<xsl:param name="currentlyviewing">Currently viewing</xsl:param>
<xsl:param name="userprivilegesmodified">user privileges modified</xsl:param>
<xsl:param name="requests">requests</xsl:param>
<xsl:param name="for">for</xsl:param>
<xsl:param name="browsercontrol">Browser Control</xsl:param>
<xsl:param name="closewindow">Close Window</xsl:param>
<xsl:param name="requestinformation">Request Information</xsl:param>
<xsl:param name="requestgeneratedusingconfiguration">Request generated using configuraton</xsl:param>
<xsl:param name="version">version</xsl:param>
<xsl:param name="fileinformation">fileinformation</xsl:param>
<xsl:param name="file">File</xsl:param>
<xsl:param name="prohibitedurl">Prohibited URL</xsl:param>
<xsl:param name="redirectedurl">Redirected URL</xsl:param>
<xsl:param name="owner">Owner</xsl:param>
<xsl:param name="parent">Parent</xsl:param>
<xsl:param name="device">Device</xsl:param>
<xsl:param name="type">Type</xsl:param>
<xsl:param name="result">Result</xsl:param>
<xsl:param name="userinformation">User information</xsl:param>
<xsl:param name="impersonating">impersonating</xsl:param>
<xsl:param name="session">Session</xsl:param>
<xsl:param name="client">Client</xsl:param>
<xsl:param name="computer">Computer</xsl:param>
<xsl:param name="timinginformation">Timing information</xsl:param>
<xsl:param name="time">Time</xsl:param>
<xsl:param name="date">Date</xsl:param>
<xsl:param name="processingtime">Processing Time</xsl:param>
<xsl:param name="ruleinformation">Rule information</xsl:param>
<xsl:param name="milliseconds">Milliseconds</xsl:param>
<xsl:param name="executedfrom">Executed from</xsl:param>
<xsl:param name="rulename">Rule Name</xsl:param>
<xsl:param name="explanation">Explanation</xsl:param>
<xsl:param name="printpage">Print Page</xsl:param>
<xsl:param name="return">Return</xsl:param>
<xsl:param name="therequestscontainedinthisfileweregeneratedinthfollowingperiod">The requests contained in this file were generated in the following period</xsl:param>
<xsl:param name="firstrequest">First Request</xsl:param>
<xsl:param name="lastrequest">Last Request</xsl:param>
<xsl:param name="on">on</xsl:param>
<xsl:param name="thefollowingtableprovidesasummaryoftherequeststhatarecontainedwiththefile">The following table provides a summary of the requests that are contained with the file</xsl:param>
<xsl:param name="total">Total</xsl:param>
<xsl:param name="allowed">Allowed</xsl:param>
<xsl:param name="denied">Denied</xsl:param>
<xsl:param name="viewtherequestsbyprocessingtime">View the requests by processing time</xsl:param>
<xsl:param name="all">All</xsl:param>


<!-- ============================================================================== -->
<!-- Template that matches the root node, it only sets the stylesheet and script    -->
<!-- files that are gonig to be used to display this file   			    -->
<!-- ============================================================================== -->

<xsl:template match="/">
<html>
  <head>
        <title> Log File Information </title>
        <link rel="stylesheet" type="text/css" href="RulesAnalyzer.css"/>
        <script type="text/javascript" src="Resources/resources.de.js"></script>
        <script type="text/javascript" src="Resources/resources.es.js"></script>
        <script type="text/javascript" src="Resources/resources.fr.js"></script>
        <script type="text/javascript" src="Resources/resources.it.js"></script>
        <script type="text/javascript" src="Resources/resources.ja.js"></script>
        <script type="text/javascript" src="Resources/resources.nl.js"></script>
        <script type="text/javascript" src="Resources/resources.pt-br.js"></script>
        <script type="text/javascript" src="Resources/resources.ru.js"></script>
        <script type="text/javascript" src="Resources/resources.zh-hans.js"></script>
        <script type="text/javascript" src="Resources/resources.zh-hant.js"></script>
        <script type="text/javascript" src="Resources/resources.en.js"></script>
        <script type="text/javascript" src="RulesAnalyzer.js"></script>
        
  </head>
<body>

	<xsl:choose>
		<xsl:when test="$display-filter = 'none'">  

			<!-- ==================================================================================== -->
			<!-- The display-filter parameter is set to none, hence we are displaying the navigation  -->
			<!-- bar onthe left hand side of the screen											      -->
			<!-- ==================================================================================== -->

			<div id="main" style="Z-INDEX: 6; LEFT: 10px; POSITION: absolute; TOP: 25px; HEIGHT: 400px">
				<table width="100%">
					<xsl:if test="$display-filter = 'none'">  
						<xsl:call-template name="SummaryOptions"/> 
						<xsl:call-template name="Default"/>
					</xsl:if>
				</table>
			</div>
			
			<div id="request_view" style="Z-INDEX: 7; LEFT: 10px; POSITION: absolute; TOP: 25px; HEIGHT: 400px; VISIBILITY: hidden">
			</div>
		</xsl:when>
	
		<xsl:otherwise>
		
	
			<xsl:if test="$display-filter = 'user-all'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'user-allowed'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'user-denied'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'allowed-user-rights-modified'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'all'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'allowed'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'denied'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'user rights modified'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'time'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'browser'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>
			<xsl:if test="$display-filter = 'user-browser'">  
				<xsl:call-template name="GeneralOptions"/> 
			</xsl:if>

		
			<!-- ================================================================================ -->
			<!-- The filter-type variable is set to something other than none, hence display a    -->
			<!-- description of what we are displaying											  -->
			<!-- ================================================================================ -->

			<table width="100%">
				<xsl:choose>

					<!-- ================================================================================ -->
					<!-- Filter type is set to none so do not bother displaying anything to the user      -->
					<!-- ================================================================================ -->
					<xsl:when test="$display-filter = 'none'">
						<!-- don't both displaying the request -->
					</xsl:when>
					
					<xsl:when test="$display-filter = 'summary'">
						<xsl:call-template name="SummaryOptions"/>
						<xsl:call-template name="Default"/>
					</xsl:when>

					<!-- ================================================================================ -->
					<!-- Filter type is set to user so display a message informing the user which user	  -->
					<!-- requests are currently being viewed											  -->
					<!-- ================================================================================ -->
					<xsl:when test="$display-filter = 'user-all'">					
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>
                <xsl:value-of select="$currentlyviewing" />  
                <b>&#160;<xsl:value-of select="$all" />&#160;</b>
                <xsl:value-of select="$requests" /> 
							
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>

					<xsl:when test="$display-filter = 'user-allowed'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>
                <xsl:value-of select="$currentlyviewing" />
                <b>&#160;<xsl:value-of select="$allowed" />&#160;</b> 
                <xsl:value-of select="$requests" /> 
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>
					
					<xsl:when test="$display-filter = 'user-denied'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>
                <xsl:value-of select="$currentlyviewing" /> 
                <b>&#160;<xsl:value-of select="$denied" />&#160;</b>
                <xsl:value-of select="$requests" /> 
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>
					
					<xsl:when test="$display-filter = 'allowed-user-rights-modified'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>
                <xsl:value-of select="$currentlyviewing" /> 
                <b>&#160;<xsl:value-of select="$userprivilegesmodified" />&#160;</b> 
                <xsl:value-of select="$requests" />
                <xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>

					<!-- ================================================================================ -->
					<!-- Filter type is set to user so display a message informing the user which user	  -->
					<!-- requests are currently being viewed											  -->
					<!-- ================================================================================ -->
					<xsl:when test="$display-filter = 'single'">
						<!-- don't both displaying the request -->
					</xsl:when>

          <xsl:when test="$display-filter = 'user rights modified'">
            <tr>
              <td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
              <td>
                <xsl:value-of select="$currentlyviewing" /> 
                <b>&#160;<xsl:value-of select="$userprivilegesmodified" />&#160;</b> 
                <xsl:value-of select="$requests" />.</td>
            </tr>
          </xsl:when>  

          <xsl:when test="$display-filter = 'browser'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>
                <xsl:value-of select="$currentlyviewing" /> 
                <b>&#160;<xsl:value-of select="$browsercontrol" />&#160;</b>
                <xsl:value-of select="$requests" /> 
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>

         <xsl:when test="$display-filter = 'user-browser'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>
                <xsl:value-of select="$currentlyviewing" />
                <b>&#160;<xsl:value-of select="$browsercontrol" />&#160;</b>
                <xsl:value-of select="$requests" />
                <xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>
          <xsl:when test="$display-filter = 'all'">
            <tr>
              <td width="5%">
                <img src="./Images/info_32.png" width="20" height="20"/>
              </td>
              <td>
                <xsl:value-of select="$currentlyviewing" />
                <b>&#160;<xsl:value-of select="$all"/>&#160;</b>
                <xsl:value-of select="$requests" />
                <xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
                  <xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
                  </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:when>
          <xsl:when test="$display-filter = 'allowed'">
            <tr>
              <td width="5%">
                <img src="./Images/info_32.png" width="20" height="20"/>
              </td>
              <td>
                <xsl:value-of select="$currentlyviewing" />
                <b>&#160;<xsl:value-of select="$allowed"/>&#160;</b>
                <xsl:value-of select="$requests" />
                <xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
                  <xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
                  </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:when>
          <xsl:when test="$display-filter = 'denied'">
            <tr>
              <td width="5%">
                <img src="./Images/info_32.png" width="20" height="20"/>
              </td>
              <td>
                <xsl:value-of select="$currentlyviewing" />
                <b>&#160;<xsl:value-of select="$denied"/>&#160;</b>
                <xsl:value-of select="$requests" />
                <xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
                  <xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
                  </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:when>
          <xsl:when test="$display-filter = 'time'">
            <tr>
              <td width="5%">
                <img src="./Images/info_32.png" width="20" height="20"/>
              </td>
              <td>
                <xsl:value-of select="$currentlyviewing" />
                <b>&#160;<xsl:value-of select="$time"/>&#160;</b>
                <xsl:value-of select="$requests" />
                <xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
                  <xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
                  </xsl:if>
                </xsl:for-each>
              </td>
            </tr>
          </xsl:when>
					<xsl:otherwise>
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>
               <xsl:value-of select="$currentlyviewing" />
                  <b>&#160;<xsl:value-of select="$display-filter"/>&#160;</b>
                <xsl:value-of select="$requests" />
            		<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">&#160;<xsl:value-of select="$for" />&#160;<b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
              </td> 
						</tr>		 
					</xsl:otherwise>
				</xsl:choose>
			</table>		
		</xsl:otherwise>
	</xsl:choose>

	<xsl:apply-templates/>

</body>  
</html>

</xsl:template>
      

<xsl:template match="Explanations">
	<xsl:apply-templates />
	
	<xsl:if test="$display-filter = 'single'">
		<br/>
		<table width="100%">
			<tr>
			<td width="90%"></td>
			<td><BUTTON NAME='TEST' OnClick="closePopup();"><FONT COLOR="RED"></FONT>
        <xsl:value-of select="$closewindow" />
      </BUTTON></td>
			</tr>
		</table>
	</xsl:if>
</xsl:template>


<!-- ============================================================================== -->
<!-- Template that matches the log node (there is only one per document		    -->
<!-- ============================================================================== -->

<xsl:template match="log">
<br/>
	<xsl:choose>
		<xsl:when test="$display-filter = 'time'">
			<xsl:apply-templates select="request">
				<xsl:sort select="@totaltime" data-type="number" order="descending"/>
			</xsl:apply-templates>		
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates/>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>



<!-- ============================================================================== -->
<!-- Template that matches the request nodes										-->
<!-- ============================================================================== -->

<xsl:template match="request">

	<xsl:choose>
		<xsl:when test="$display-filter = 'single'">
			
			<!-- ============================================================================== -->
			<!-- Viewing this request only														-->
			<!-- ============================================================================== -->
			<xsl:if test="@id = $request-filter">
				<table width="100%">
					<tr><td width="100%" class="title">
            <xsl:value-of select="$requestinformation"/>
          </td></tr>
					<td>
            <xsl:value-of select="$requestgeneratedusingconfiguration"/> <xsl:value-of select="./config/@name"/> (<xsl:value-of select="$version"/>: <xsl:value-of select="./config/@version"/>)</td>
				</table>				
				<br/>
				<table width="100%">
					<tr>
						<td class="smalltitle">
              <xsl:value-of select="$fileinformation"/>:</td>
					</tr>
				</table>
				<table>
					<tr>
						<td width="1%"></td>
						<td width="10%">
              <xsl:value-of select="$file"/>:</td>
						<td><xsl:value-of select="./file/@name"/> (<xsl:value-of select="./file/@description"/>)</td>
					</tr>
          <xsl:choose>
            <xsl:when test="./@result = 'URL Redirect'">
							<tr>
						    <td></td>
						    <td>
                  <xsl:value-of select="$prohibitedurl"/>:</td>
						    <td><xsl:value-of select="./urlredirection/@Prohibited"/></td>
					    </tr>					
					    <tr>
						    <td></td>
						    <td>
                  <xsl:value-of select="$redirectedurl"/>:</td>
						    <td><xsl:value-of select="./urlredirection/@RedirectedTo"/></td>
					    </tr>
						</xsl:when>
						<xsl:otherwise>
         			<tr>
						    <td></td>
						    <td>
                  <xsl:value-of select="$owner"/>:</td>
						    <td><xsl:value-of select="./file/@owner"/></td>
					    </tr>					
					    <tr>
						    <td></td>
						    <td>
                  <xsl:value-of select="$parent"/>:</td>
						    <td><xsl:value-of select="./parent/@name"/> (<xsl:value-of select="./parent/@description"/>)</td>
					    </tr>
						</xsl:otherwise>          
					</xsl:choose>
					<tr>
						<td></td>
						<td>
              <xsl:value-of select="$device"/>:</td>
						<td><xsl:value-of select="./file/@device"/></td>
					</tr>
					<tr>
						<td></td>
						<td>
              <xsl:value-of select="$type"/>:</td>
						<td><xsl:value-of select="@type"/></td>
					</tr>
					<tr>
						<td></td>
						<td>
              <xsl:value-of select="$result"/>:</td>
						<td><xsl:value-of select="@result"/></td>
					</tr>
				</table>
				<br/>
				<table width="100%">
					<tr>
						<td class="smalltitle">
              <xsl:value-of select="$userinformation"/>:</td>
					</tr>
				</table>
				<table>	
					<tr>
						<td width="1%"></td>
						<td width="10%">
              <xsl:value-of select="$user"/>:
            </td>
						<td>
							<xsl:value-of select="./user/@domain"/>\<xsl:value-of select="./user/@name"/>
							<xsl:choose>
								<xsl:when test="./user/@impersonating = 'none'">
									<!-- not impersonating so do nothing -->
								</xsl:when>
								<xsl:otherwise>
									(<xsl:value-of select="./user/@impersonating"/> <xsl:value-of select="$impersonating"/>)	
								</xsl:otherwise>
							</xsl:choose>
						</td>						
					</tr>
					<tr>
						<td></td>
						<td>
              <xsl:value-of select="$session"/>:</td>
						<td><xsl:value-of select="./session/@number"/></td>						
					</tr>
					<tr>
						<td></td>
						<td>
              <xsl:value-of select="$client"/>:</td>
						<td><xsl:value-of select="./session/@client"/></td>						
					</tr>
          <tr>
            <td></td>
            <td>
              <xsl:value-of select="$computer"/>:</td>
            <td>
              <xsl:value-of select="./session/@computer"/>
            </td>
          </tr>
        </table>		
				<br/>
				<table width="100%">
					<tr>
						<td class="smalltitle">
              <xsl:value-of select="$timinginformation"/>:</td>
					</tr>
				</table>
				<table>					
					<tr>
						<td width="1%"></td>					
						<td width="20%">
              <xsl:value-of select="$time"/>:</td>
						<td><xsl:value-of select="@time"/></td>						
					</tr>
					<tr>
						<td></td>					
						<td>
              <xsl:value-of select="$date"/>:</td>
						<td><xsl:value-of select="@date"/></td>						
					</tr>
					<tr>
						<td></td>					
						<td>
              <xsl:value-of select="$processingtime"/>:</td>
						<td><xsl:value-of select="@totaltime"/></td>						
					</tr>
				</table>	
				<br/>
				<table width="100%">
					<tr><td class="smalltitle">
            <xsl:value-of select="$ruleinformation"/>:</td></tr>
				</table>
				<br/>
				<xsl:apply-templates select="policy"/>
			</xsl:if>
		</xsl:when>
		
		<xsl:otherwise>

			<!-- ============================================================================== -->
			<!-- Normal display mode, not viewing the single request							-->
			<!-- ============================================================================== -->
			<table width="100%">
				<xsl:choose>
					<xsl:when test="$display-filter = 'none'">
						<!-- don't output any request information -->
					</xsl:when>
			
					<!-- Display the requests by time -->
					<xsl:when test="$display-filter = 'time'">
						<tr>
							<xsl:if test="@result = 'Allow'">
								<td width="2.5%" ><img src="Images\Allowed_items_16.png"/></td>
							</xsl:if>
							
							<xsl:if test="@result = 'Deny'">
								<td width="2.5%"><img src="Images\denied_items_16.png"/></td>
							</xsl:if>
							
							<xsl:if test="@result = 'User Rights Modified'">
								<td width="2.5%" ><img src="Images\Allowed_items_16.png"/></td>
							</xsl:if>

              
              <xsl:if test="@result = 'URL Redirect'">
                <td width="2.5%"><img src="Images\denied_items_16.png"/></td>
              </xsl:if>
              
              <xsl:if test="@result = 'URL Elevate'">
                <td width="2.5%"><img src="Images\user_privilege_items_16.png"/></td>
              </xsl:if>

              <xsl:if test="@result = 'URL Allow'">
                <td width="2.5%"><img src="Images\Allowed_items_16.png"/></td>
              </xsl:if>

              <xsl:choose>
                <xsl:when test="@type = 'Browser'">
                  <xsl:apply-templates select="urlRedirection"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates select="file"/>
                </xsl:otherwise>
              </xsl:choose>
							
						</tr>
						<tr>
							<td width="2.5%"></td>
							<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
						</tr>
						<tr>
							<td width="2.5%"></td>
							<td><b><xsl:value-of select="$starttime"/>:  </b><xsl:value-of select="@time"/><b>
                &#160;<xsl:value-of select="$processingtime"/>: </b><xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
              </td>
						</tr>
					</xsl:when>		

				
					<!-- Display all the requests -->
					<xsl:when test="$display-filter = 'all'">
						<tr>
							<xsl:if test="@result = 'Allow'">
								<td width="2.5%" ><img src="Images\Allowed_items_16.png"/></td>
							</xsl:if>
							
							<xsl:if test="@result = 'Deny'">
								<td width="2.5%"><img src="Images\denied_items_16.png"/></td>
							</xsl:if>
							
							<xsl:if test="@result = 'User Rights Modified'">
								<td width="2.5%" ><img src="Images\Allowed_items_16.png"/></td>
							</xsl:if>

              <xsl:if test="@result = 'URL Redirect'">
                <td width="2.5%"><img src="Images\denied_items_16.png"/></td>
              </xsl:if>
              
              <xsl:if test="@result = 'URL Elevate'">
                <td width="2.5%"><img src="Images\user_privilege_items_16.png"/></td>
              </xsl:if>

              <xsl:if test="@result = 'URL Allow'">
                <td width="2.5%"><img src="Images\Allowed_items_16.png"/></td>
              </xsl:if>

              <xsl:choose>
                <xsl:when test="@type = 'Browser'">
                  <xsl:apply-templates select="urlRedirection"/>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:apply-templates select="file"/>
                </xsl:otherwise>
              </xsl:choose>
              
						</tr>
            
						<tr>
							<td width="2.5%"></td>
							<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
						</tr>
						<tr>
							<td width="2.5%"></td>
							<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
              <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
            </td>
						</tr>
					</xsl:when>		


					<!-- Display only the allowed requests -->
					<xsl:when test="$display-filter = 'allowed'">
						<xsl:if test="(@result = 'Allow') or (@result = 'User Rights Modified')">
							<tr>
								<td width="2.5%"><img src="Images\Allowed_items_16.png"/></td>
								<xsl:apply-templates select="file"/>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                  <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
              </td>
							</tr>
						</xsl:if>
					</xsl:when>

				
					<!-- Display only the denied requests -->
					<xsl:when test="$display-filter = 'denied'">
						<xsl:if test="@result = 'Deny'">
							<tr>
								<td width="2.5%"><img src="Images\denied_items_16.png"/></td>
								<xsl:apply-templates select="file"/>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
              </td>
							</tr>
						</xsl:if>
					</xsl:when>
				
					<!-- Display only the allowed user rights requests -->
					<xsl:when test="$display-filter = 'user rights modified'">
						<xsl:if test="@result = 'User Rights Modified'">
							<tr>
								<td width="2.5%"><img src="Images\blank.ico"/></td>
								<xsl:apply-templates select="file"/>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
              </td>
							</tr>
						</xsl:if>
					</xsl:when>

					<!-- Display only the Browser Control requests -->
					<xsl:when test="$display-filter = 'browser'">
						<xsl:if test="@type = 'Browser'">
							<tr>
								<td width="2.5%">
                  <xsl:if test="@result = 'URL Redirect'">
										<img src="Images\denied_items_16.png"/>
									</xsl:if>
                  
									<xsl:if test="@result = 'URL Elevate'">
										<img src="Images\user_privilege_items_16.png"/>
									</xsl:if>
                  
                  <xsl:if test="@result = 'URL Allow'">
                    <img src="Images\Allowed_items_16.png"/>
                  </xsl:if>
                </td>
								<xsl:apply-templates select="urlRedirection"/>
							</tr>
              
							<tr>
								<td width="2.5%"></td>
								<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
              </td>
							</tr>
						</xsl:if>
					</xsl:when>

          <!-- Display only the Browser Control requests for a particular user -->
					<xsl:when test="$display-filter = 'user-browser'">
            <xsl:if test="$user-filter = ./user/@sid">
						  <xsl:if test="@type = 'Browser'">
                <tr>
                  <td width="2.5%">
                    <xsl:if test="@result = 'URL Redirect'">
                      <img src="Images\denied_items_16.png"/>
                    </xsl:if>

                    <xsl:if test="@result = 'URL Elevate'">
                      <img src="Images\user_privilege_items_16.png"/>
                    </xsl:if>

                    <xsl:if test="@result = 'URL Allow'">
                      <img src="Images\Allowed_items_16.png"/>
                    </xsl:if>
                  </td>
                  <xsl:apply-templates select="urlRedirection"/>
                </tr>
                
							  <tr>
								  <td width="2.5%"></td>
								  <td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
							  </tr>
							  <tr>
								  <td width="2.5%"></td>
								  <td><b><xsl:value-of select="$starttime"/>:</b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                  <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
                </td>
							  </tr>
						  </xsl:if>
            </xsl:if>
					</xsl:when>

					<!-- Display only the requests for a particular user -->
					<xsl:when test="$display-filter = 'user-all'">
						<xsl:if test="$user-filter = ./user/@sid">
							<tr>
								<td width="2.5%">
									<xsl:if test="@result = 'Allow'">
										<img src="Images\Allowed_items_16.png"/>
									</xsl:if>
									
									<xsl:if test="@result = 'User Rights Modified'">
										<img src="Images\blank.ico"/>
									</xsl:if>

									<xsl:if test="@result = 'Deny'">
										<img src="Images\denied_items_16.png"/>
									</xsl:if>
                  
                  <xsl:if test="@result = 'URL Redirect'">
                    <img src="Images\denied_items_16.png"/>
                  </xsl:if>

                  <xsl:if test="@result = 'URL Elevate'">
                    <img src="Images\user_privilege_items_16.png"/>
                  </xsl:if>

                  <xsl:if test="@result = 'URL Allow'">
                    <img src="Images\Allowed_items_16.png"/>
                  </xsl:if>
								</td>
                
                <xsl:choose>
                  <xsl:when test="@type = 'Browser'">
                    <xsl:apply-templates select="urlRedirection"/>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="file"/>
                  </xsl:otherwise>
                </xsl:choose>
								
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
              </td>
							</tr>
						</xsl:if>
					</xsl:when>
					
					<xsl:when test="$display-filter = 'user-allowed'">
						<xsl:if test="$user-filter = ./user/@sid">
							<xsl:if test="(@result='Allow') or (@result = 'User Rights Modified')">
								<tr>
									<td width="2.5%">
										<xsl:if test="@result = 'Allow'">
											<img src="Images\Allowed_items_16.png"/>
										</xsl:if>
								
										<xsl:if test="@result = 'User Rights Modified'">
											<img src="Images\blank.ico"/>
										</xsl:if>

										<xsl:if test="@result = 'Deny'">
											<img src="Images\denied_items_16.png"/>
										</xsl:if>
									</td>
								
									<xsl:apply-templates select="file"/>	
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                  <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
                </td>
								</tr>
							</xsl:if>
						</xsl:if>
					</xsl:when>					
					
					<xsl:when test="$display-filter = 'user-denied'">
						<xsl:if test="$user-filter = ./user/@sid">
							<xsl:if test="@result='Deny'">
								<tr>
									<td width="2.5%">
										<xsl:if test="@result = 'Allow'">
											<img src="Images\Allowed_items_16.png"/>
										</xsl:if>
								
										<xsl:if test="@result = 'User Rights Modified'">
											<img src="Images\blank.ico"/>
										</xsl:if>

										<xsl:if test="@result = 'Deny'">
											<img src="Images\denied_items_16.png"/>
										</xsl:if>
									</td>
								
									<xsl:apply-templates select="file"/>	
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                  <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
                </td>
								</tr>
							</xsl:if>
						</xsl:if>
					</xsl:when>										
					<xsl:when test="$display-filter = 'allowed-user-rights-modified'">
						<xsl:if test="$user-filter = ./user/@sid">
							<xsl:if test="@result='User Rights Modified'">
								<tr>
									<td width="2.5%">
										<xsl:if test="@result = 'Allow'">
											<img src="Images\Allowed_items_16.png"/>
										</xsl:if>
								
										<xsl:if test="@result = 'User Rights Modified'">
											<img src="Images\blank.ico"/>
										</xsl:if>

										<xsl:if test="@result = 'Deny'">
											<img src="Images\denied_items_16.png"/>
										</xsl:if>
									</td>
								
									<xsl:apply-templates select="file"/>	
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><xsl:apply-templates select="user"/>&#160;<xsl:apply-templates select="session"/></td>
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><b><xsl:value-of select="$starttime"/>: </b><xsl:value-of select="@time"/><b>&#160;<xsl:value-of select="$processingtime"/>: </b>
                  <xsl:value-of select="@totaltime"/>&#160;<xsl:value-of select="$milliseconds"/>
                </td>
								</tr>
							</xsl:if>
						</xsl:if>
					</xsl:when>					

				</xsl:choose>
				
			</table>	
		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>



<xsl:template match="file">
	<td class="small-border-trigger">
		<xsl:attribute name="onClick">
			showSingleRequest('<xsl:value-of select="../@id"/>');
		</xsl:attribute>
		<xsl:value-of select="@name"/><br/>
	</td>
</xsl:template>

<xsl:template match="urlRedirection">
	<td class="small-border-trigger">
		<xsl:attribute name="onClick">
			showSingleRequest('<xsl:value-of select="../@id"/>');
		</xsl:attribute>
		<xsl:value-of select="@Prohibited"/><br/>
	</td>  
</xsl:template>

<xsl:template match="parent">
  <xsl:value-of select="$executedfrom"/>: <xsl:value-of select="@name"/><br/>
</xsl:template>


<xsl:template match="session">
	<b>
    <xsl:value-of select="$session"/>: </b> <xsl:value-of select="@number"/><br/>
</xsl:template>


<xsl:template match="user">
	<b><xsl:value-of select="$user"/>: </b> <xsl:value-of select="@domain"/>/<xsl:value-of select="@name"/>
</xsl:template>


<xsl:template match="policy">
	<table>
		<tr>
			<td>
        <xsl:value-of select="$rulename"/>: <b><xsl:value-of select="@name"/></b></td>
		</tr>
	</table>
	<table>
		<tr>
			<td width="5%"></td>	
			<td>
        <xsl:value-of select="$type"/>:<b><xsl:value-of select="@type"/></b></td>
		</tr>
		<tr>
			<td></td>	
			<td>Result:<b><xsl:value-of select="@result"/></b></td>		
		</tr>
		<xsl:choose>
			<xsl:when test="@rule = 'none'">
				<!-- do nothing -->
			</xsl:when>
			<xsl:otherwise>
				<tr>
				<td></td>
				<td>
          <xsl:value-of select="$explanation"/>: <xsl:value-of select="@rule"/></td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</table>
</xsl:template>


<xsl:template name="SummaryOptions">
	<!-- ================================================================================ -->
	<!-- Display the print / return options											  -->
	<!-- ================================================================================ -->
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
        <xsl:value-of select="$printpage"/>			
			</td>
		</tr>
	</table>	
</xsl:template>

<xsl:template name="GeneralOptions">
	<!-- ================================================================================ -->
	<!-- Display the print / return options											  -->
	<!-- ================================================================================ -->
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
        <xsl:value-of select="$printpage"/>			
			</td>
		</tr>
		<tr>			
			<td width="80%"></td>
			<td style="CURSOR:hand">
				<xsl:attribute name="onClick">
					showRequests("summary", "none");
				</xsl:attribute>				
				<img border="0" src="./Images/arrow_left_16.png" width="16" height="16"></img>
			</td>
			<td style="FONT:10pt Verdana,sans-serif;FONT-WEIGHT:bold;COLOR:#707070;CURSOR:hand">
					<xsl:attribute name="onClick">
						showRequests("summary", "none");
					</xsl:attribute>
        <xsl:value-of select="$return"/>			
			</td>			
		</tr>
	</table>	
</xsl:template>


<!-- ============================================================================== -->
<!-- Default template that is called when the display-type parameter is set to none -->
<!-- ============================================================================== -->

<xsl:template name="Default">
	<xsl:variable name="request_count" select="count(/Explanations/log/request)"/>

	<table width="100%">
		<tr>
			<td width="100%" style="FONT:16pt Verdana,sans-serif;COLOR:#707070">
        <xsl:value-of select="$applicationcontrolagent" /> (<xsl:value-of select="$version"/> <xsl:value-of select="/Explanations/log/@AgentVersion"/>).</td>
		</tr>
	</table>
	<br/>
	<table width="100%">
		<tr>
		<td width="100%">
      <xsl:value-of select="$therequestscontainedinthisfileweregeneratedinthfollowingperiod" />:</td>
		</tr>
	</table>
	<br/>
	
	<table class="border-top-left" width="100%">
		<tr>
			<td class="small-border" width="50%">
        <xsl:value-of select="$firstrequest" />
      </td>
			<td class="small-border" width="50%">
        <xsl:value-of select="$lastrequest" />
      </td>
		</tr>
    </table>

	<table bgcolor="#E0E0E0" width="100%">
		<tr>
			<td class="small-border"><xsl:value-of select="/Explanations/log/request[@id='1']/@time"/>
        &#160;<xsl:value-of select="$on" />&#160; 
				<xsl:value-of select="/Explanations/log/request[@id='1']/@date"/></td>
			<td class="small-border"><xsl:value-of select="/Explanations/log/request[@id=$request_count]/@time"/>
        &#160;<xsl:value-of select="$on" />&#160;
				<xsl:value-of select="/Explanations/log/request[@id=$request_count]/@date"/></td>
		</tr>
    </table>

	<br/>
  
 	<table width="100%">
		<tr>
		<td width="100%">
      <xsl:value-of select="$thefollowingtableprovidesasummaryoftherequeststhatarecontainedwiththefile" />:</td>
		</tr>
	</table>
	<br/>
	
	<table class="border-top-left" width="100%">
		<tr>
			<td class="small-border-bold" width="40%">
        <xsl:value-of select="$user" />
      </td>
			<td class="small-border-bold" width="12%">
        <xsl:value-of select="$total" />
      </td>
			<td class="small-border-bold" width="12%">
        <xsl:value-of select="$allowed" />
      </td>
			<td class="small-border-bold" width="12%">
        <xsl:value-of select="$denied" />
      </td>
			<td class="small-border-bold" width="12%">
        <xsl:value-of select="$userprivilegesmodified" />
      </td>
      <td class="small-border-bold" width="12%">
        <xsl:value-of select="$browsercontrol" />
      </td>
		</tr>
	
		<tr>
      <td class="small-border" bgcolor="#E0E0E0">
        <xsl:value-of select="$all"/>
      </td>
			<td class="small-border-trigger-one">
				<xsl:attribute name="onClick">
					showRequests("all", "none");
				</xsl:attribute>
				<xsl:value-of select="$request_count"/>
			</td>

			<td class="small-border-trigger-one">
				<xsl:attribute name="onClick">
					showRequests("allowed", "none");
				</xsl:attribute>
				<xsl:value-of select="count(/Explanations/log/request[@result='Allow']) + count(/Explanations/log/request[@result='User Rights Modified'])"/>
			</td>
			
			<td class="small-border-trigger-one">
				<xsl:attribute name="onClick">
					showRequests("denied", "none");
				</xsl:attribute>
				<xsl:value-of select="count(/Explanations/log/request[@result='Deny'])"/>
			</td>			

			<td class="small-border-trigger-one">
				<xsl:attribute name="onClick">
					showRequests("user rights modified", "none");
				</xsl:attribute>
				<xsl:value-of select="count(/Explanations/log/request[@result='User Rights Modified'])"/>
			</td>
      <td class="small-border-trigger-one">
        <xsl:attribute name="onClick">
          showRequests("browser", "none");
        </xsl:attribute>
        <xsl:value-of select="count(/Explanations/log/request[@type='Browser'])"/>
      </td>

    </tr>
		
		
		<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
		<tr>
			<td class="small-border" bgcolor="#E0E0E0"><xsl:value-of select="../@domain"/>\<xsl:value-of select="../@name"/></td>
			<td class="small-border-trigger-one">
				<xsl:attribute name="onClick">
					showRequests("user-all", '<xsl:value-of select="../@sid"/>');
				</xsl:attribute>
				<xsl:value-of select="count(key('users', .))"/>
			</td>
			
			<xsl:variable name="user_sid" select="../@sid"/>
					
			<td class="small-border-trigger-one">
				<xsl:attribute name="onClick">
					showRequests("user-allowed", '<xsl:value-of select="../@sid"/>');
				</xsl:attribute>
				<xsl:value-of select="count(/Explanations/log/request[@result='Allow']/user[@sid=$user_sid]) + count(/Explanations/log/request[@result='User Rights Modified']/user[@sid=$user_sid])"/>
			</td>
			
			<td class="small-border-trigger-one">
				<xsl:attribute name="onClick">
					showRequests("user-denied", '<xsl:value-of select="../@sid"/>');
				</xsl:attribute>
				<xsl:value-of select="count(/Explanations/log/request[@result='Deny']/user[@sid=$user_sid])"/>
			</td>

			<td class="small-border-trigger-one">
				<xsl:attribute name="onClick">
					showRequests("allowed-user-rights-modified", '<xsl:value-of select="../@sid"/>');
				</xsl:attribute>
				<xsl:value-of select="count(/Explanations/log/request[@result='User Rights Modified']/user[@sid=$user_sid])"/>
			</td>

      <td class="small-border-trigger-one">
        <xsl:attribute name="onClick">
          showRequests("user-browser", '<xsl:value-of select="../@sid"/>');
        </xsl:attribute>
        <xsl:value-of select="count(/Explanations/log/request[@type='Browser']/user[@sid=$user_sid])"/>
      </td>

    </tr>
		</xsl:for-each>
		
	</table>
	<br/>
	<br/>
 	<table width="100%">
		<tr>
		<td class="small-border-trigger">
			<xsl:attribute name="onClick">
				showRequests("time", "none");
			</xsl:attribute>
      <xsl:value-of select="$viewtherequestsbyprocessingtime"/>.</td>
		</tr>
	</table>

</xsl:template>


<!-- ============================================================================== -->
<!-- Avoid output of text node with default template for each of the node types     -->
<!-- ============================================================================== -->

<xsl:template match="config"/>
  
  

</xsl:stylesheet>
