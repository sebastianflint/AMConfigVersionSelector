<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html"></xsl:output>


<xsl:template match="/">
<html>
<head>
<title> Computer Information </title>
<link rel="stylesheet" type="text/css" href="RulesAnalyzer.css"/>
</head>
</html>
	<xsl:apply-templates/>
</xsl:template>


<xsl:template match="ComputerRecord">
<body>

	<table width="100%">
		<tr>
			<td width="5%"><img border="0" src="./Images/device_16.ico" width="32" height="32"></img></td>
			<td width="100%" style="FONT:16pt Verdana,sans-serif;COLOR:#707070">Computer Information</td>
		</tr>
		<tr>
			<td></td>
			<td style="FONT:10pt Verdana,sans-serif; COLOR:#707070">This section provides information about the current status of the Application Manager Agent on <xsl:value-of select="@Name"/></td>
		</tr>
	</table>				
	<br/>
	<table class="border-top-left" width="100%" >
		<tr>
			<td width="30%" class="small-border">Service Status</td>
			<td width="30%" class="small-border">Logging Status</td>
			<td width="30%" class="small-border">Current Log File Size</td>
		</tr>
    </table>
	<xsl:apply-templates select="Agent"/><br/>


	<table width="100%">
		<tr>
		<td width="5%"><img border="0" src="./Images/folder_16.ico" width="32" height="32"></img></td>
		<td width="100%" style="FONT:16pt Verdana,sans-serif;COLOR:#707070">Retrieved Files</td>
		</tr>
		<td></td>
		<td style="FONT:10pt Verdana,sans-serif; COLOR:#707070">This section provides details of all the Rules Analyzer files that have previously been retrieved from the selected computer.</td>
	</table>				
	<br/>	
	<table class="border-top-left" width="100%">
      	  <tr>
       	 	<td class="small-border" width="40%">Filename</td>
         	<td class="small-border" width="10%">Size</td>
         	<td class="small-border" width="50%">Retrieved</td>
      	  </tr>
	</table>
	<xsl:apply-templates select="Log"/>

</body>
</xsl:template>



<!-- Template for any Request - searches for the request that matches the supplied selected-id parameter-->
<xsl:template match="Log">
    <table bgcolor="#E0E0E0" width="100%">
      <tr>
       	 <td class="small-border" width="40%"><xsl:value-of select="@Name"/></td>
         <td class="small-border" width="10%"><xsl:value-of select="@Size"/></td>
         <td class="small-border" width="50%"><xsl:value-of select="@Time"/></td>
      </tr>
    </table>
</xsl:template>


<!-- avoid output of text node with default template -->
<xsl:template match="Agent">
	<table bgcolor="#E0E0E0" width="100%">
       	<td width="30%" class="small-border"><xsl:value-of select="@ServiceStatus"/></td>
		<td width="30%" class="small-border"><xsl:value-of select="@LogStatus"/></td>
		<td width="30%" class="small-border"><xsl:value-of select="@LogSize"/></td>
    </table>
<br/>      	
</xsl:template>


</xsl:stylesheet>