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
<html>
  <head>
        <title> Log File Information </title>
        <link rel="stylesheet" type="text/css" href="RulesAnalyzer.css"/>
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
							<td>Currently viewing <b>all</b> requests 
							
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">
										for <b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>

					<xsl:when test="$display-filter = 'user-allowed'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>Currently viewing <b>allowed</b> requests 
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">
										for <b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>
					
					<xsl:when test="$display-filter = 'user-denied'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>Currently viewing <b>denied</b> requests 
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">
										for <b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>
					
					<xsl:when test="$display-filter = 'allowed-user-rights-modified'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>Currently viewing <b>user privileges modified</b> requests 
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">
										for <b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
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
              <td>Currently viewing <b>user privileges modified</b> requests.</td>
            </tr>
          </xsl:when>  

          <xsl:when test="$display-filter = 'browser'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>Currently viewing <b>Browser Control</b> requests 
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">
										for <b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>

         <xsl:when test="$display-filter = 'user-browser'">
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>Currently viewing <b>Browser Control</b> requests 
								<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">
										for <b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
									</xsl:if>
								</xsl:for-each>
							</td>
						</tr>		 
					</xsl:when>
          
					<xsl:otherwise>
						<tr>
							<td width="5%"><img src="./Images/info_32.png" width="20" height="20"/></td>
							<td>Currently viewing <b><xsl:value-of select="$display-filter"/></b> requests
            		<xsl:for-each select="/Explanations/log/request/user[generate-id(.)=generate-id(key('users', @sid))]/@sid">
									<xsl:if test="$user-filter = ../@sid">
										for <b><xsl:value-of select="../@domain"/>/<xsl:value-of select="../@name"/></b>
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
			<td><BUTTON NAME='TEST' OnClick="closePopup();"><FONT COLOR="RED"></FONT>Close Window</BUTTON></td>
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
					<tr><td width="100%" class="title">Request Information</td></tr>
					<td>Request generated using configuraton <xsl:value-of select="./config/@name"/> (version: <xsl:value-of select="./config/@version"/>)</td>
				</table>				
				<br/>
				<table width="100%">
					<tr>
						<td class="smalltitle">File information:</td>
					</tr>
				</table>
				<table>
					<tr>
						<td width="1%"></td>
						<td width="10%">File:</td>
						<td><xsl:value-of select="./file/@name"/> (<xsl:value-of select="./file/@description"/>)</td>
					</tr>
          <xsl:choose>
            <xsl:when test="./@result = 'URL Redirect'">
							<tr>
						    <td></td>
						    <td>Prohibited URL:</td>
						    <td><xsl:value-of select="./urlredirection/@Prohibited"/></td>
					    </tr>					
					    <tr>
						    <td></td>
						    <td>Redirected URL:</td>
						    <td><xsl:value-of select="./urlredirection/@RedirectedTo"/></td>
					    </tr>
						</xsl:when>
						<xsl:otherwise>
         			<tr>
						    <td></td>
						    <td>Owner:</td>
						    <td><xsl:value-of select="./file/@owner"/></td>
					    </tr>					
					    <tr>
						    <td></td>
						    <td>Parent:</td>
						    <td><xsl:value-of select="./parent/@name"/> (<xsl:value-of select="./parent/@description"/>)</td>
					    </tr>
						</xsl:otherwise>          
					</xsl:choose>
					<tr>
						<td></td>
						<td>Device:</td>
						<td><xsl:value-of select="./file/@device"/></td>
					</tr>
					<tr>
						<td></td>
						<td>Type:</td>
						<td><xsl:value-of select="@type"/></td>
					</tr>
					<tr>
						<td></td>
						<td>Result:</td>
						<td><xsl:value-of select="@result"/></td>
					</tr>
				</table>
				<br/>
				<table width="100%">
					<tr>
						<td class="smalltitle">User information:</td>
					</tr>
				</table>
				<table>	
					<tr>
						<td width="1%"></td>
						<td width="10%">User:</td>
						<td>
							<xsl:value-of select="./user/@domain"/>\<xsl:value-of select="./user/@name"/>
							<xsl:choose>
								<xsl:when test="./user/@impersonating = 'none'">
									<!-- not impersonating so do nothing -->
								</xsl:when>
								<xsl:otherwise>
									(<xsl:value-of select="./user/@impersonating"/> impersonating)	
								</xsl:otherwise>
							</xsl:choose>
						</td>						
					</tr>
					<tr>
						<td></td>
						<td>Session:</td>
						<td><xsl:value-of select="./session/@number"/></td>						
					</tr>
					<tr>
						<td></td>
						<td>Client:</td>
						<td><xsl:value-of select="./session/@client"/></td>						
					</tr>
          <tr>
            <td></td>
            <td>Computer:</td>
            <td>
              <xsl:value-of select="./session/@computer"/>
            </td>
          </tr>
        </table>		
				<br/>
				<table width="100%">
					<tr>
						<td class="smalltitle">Timing information:</td>
					</tr>
				</table>
				<table>					
					<tr>
						<td width="1%"></td>					
						<td width="20%">Time:</td>
						<td><xsl:value-of select="@time"/></td>						
					</tr>
					<tr>
						<td></td>					
						<td>Date:</td>
						<td><xsl:value-of select="@date"/></td>						
					</tr>
					<tr>
						<td></td>					
						<td>Processing Time:</td>
						<td><xsl:value-of select="@totaltime"/></td>						
					</tr>
				</table>	
				<br/>
				<table width="100%">
					<tr><td class="smalltitle">Rule information:</td></tr>
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
							<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
						</tr>
						<tr>
							<td width="2.5%"></td>
							<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
								Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
							<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
						</tr>
						<tr>
							<td width="2.5%"></td>
							<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
								Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
								<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
									Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
								<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
									Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
								<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
									Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
								<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
									Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
								  <td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
							  </tr>
							  <tr>
								  <td width="2.5%"></td>
								  <td><b>Start Time: </b><xsl:value-of select="@time"/><b>
									  Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
								<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
							</tr>
							<tr>
								<td width="2.5%"></td>
								<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
									Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
									<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
										Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
									<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
										Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
									<td><xsl:apply-templates select="user"/><xsl:apply-templates select="session"/></td>
								</tr>
								<tr>
									<td width="2.5%"></td>
									<td><b>Start Time: </b><xsl:value-of select="@time"/><b>
										Processing Time: </b><xsl:value-of select="@totaltime"/> Milliseconds</td>
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
	Executed from: <xsl:value-of select="@name"/><br/>
</xsl:template>


<xsl:template match="session">
	<b> Session: </b> <xsl:value-of select="@number"/><br/>
</xsl:template>


<xsl:template match="user">
	<b>User: </b> <xsl:value-of select="@domain"/>/<xsl:value-of select="@name"/>
</xsl:template>


<xsl:template match="policy">
	<table>
		<tr>
			<td>Rule Name: <b><xsl:value-of select="@name"/></b></td>
		</tr>
	</table>
	<table>
		<tr>
			<td width="5%"></td>	
			<td>Type:<b><xsl:value-of select="@type"/></b></td>
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
				<td>Explanation: <xsl:value-of select="@rule"/></td>
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
					Print Page			
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
					Print Page			
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
					Return			
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
			<td width="100%" style="FONT:16pt Verdana,sans-serif;COLOR:#707070">Application Control Agent (version <xsl:value-of select="/Explanations/log/@AgentVersion"/>).</td>
		</tr>
	</table>
	<br/>
	<table width="100%">
		<tr>
		<td width="100%">The requests contained in this file were generated in the following period:</td>
		</tr>
	</table>
	<br/>
	
	<table class="border-top-left" width="100%">
		<tr>
			<td class="small-border" width="50%">First Request</td>
			<td class="small-border" width="50%">Last Request</td>
		</tr>
    </table>

	<table bgcolor="#E0E0E0" width="100%">
		<tr>
			<td class="small-border"><xsl:value-of select="/Explanations/log/request[@id='1']/@time"/> on 
				<xsl:value-of select="/Explanations/log/request[@id='1']/@date"/></td>
			<td class="small-border"><xsl:value-of select="/Explanations/log/request[@id=$request_count]/@time"/> on 
				<xsl:value-of select="/Explanations/log/request[@id=$request_count]/@date"/></td>
		</tr>
    </table>

	<br/>
  
 	<table width="100%">
		<tr>
		<td width="100%">The following table provides a summary of the requests that are contained with the file:</td>
		</tr>
	</table>
	<br/>
	
	<table class="border-top-left" width="100%">
		<tr>
			<td class="small-border-bold" width="40%">User</td>
			<td class="small-border-bold" width="12%">Total</td>
			<td class="small-border-bold" width="12%">Allowed</td>
			<td class="small-border-bold" width="12%">Denied</td>
			<td class="small-border-bold" width="12%">User Privileges Modified</td>
      <td class="small-border-bold" width="12%">Browser Control</td>
		</tr>
	
		<tr>
      <td class="small-border" bgcolor="#E0E0E0">All</td>
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
			View the requests by processing time.</td>
		</tr>
	</table>

</xsl:template>


<!-- ============================================================================== -->
<!-- Avoid output of text node with default template for each of the node types     -->
<!-- ============================================================================== -->

<xsl:template match="config"/>

</xsl:stylesheet>
