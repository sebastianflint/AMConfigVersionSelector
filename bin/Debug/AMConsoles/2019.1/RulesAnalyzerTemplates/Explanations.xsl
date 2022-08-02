<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="explain">none</xsl:param>


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
            <xsl:when test="@name = 'User Rights Elevated'">Explanation of User Privileges Elevated</xsl:when>
            <xsl:when test="@name = 'Accessible Signature'">Explanation of Allowed Signature</xsl:when>
            <xsl:when test="@name = 'Prohibited Signature'">Explanation of Denied Signature</xsl:when>
            <xsl:when test="@name = 'Accessible File'">Explanation of Allowed File</xsl:when>
            <xsl:when test="@name = 'Prohibited File'">Explanation of Denied File</xsl:when>
            <xsl:when test="@name = 'Prohibited Folder'">Explanation of Denied Folder</xsl:when>
            <xsl:when test="@name = 'Accessible Folder'">Explanation of Allowed Folder</xsl:when>
            <xsl:when test="@name = 'Accessible Drive'">Explanation of Allowed Drive</xsl:when>
            <xsl:when test="@name = 'Prohibited Drive'">Explanation of Denied Drive</xsl:when>
          <xsl:when test="@name = 'User Rights Modified'">Explanation of User Privileges Modified</xsl:when>
          <xsl:when test="@name = 'User Rights Restricted'">Explanation of User Privileges Restricted</xsl:when>
          <xsl:when test="@name = 'Prohibited Win Store App'">Explanation of Denied Win Store App</xsl:when>
          <xsl:when test="@name = 'Accessible Win Store App'">Explanation of Allowed Win Store App</xsl:when>
          <xsl:otherwise>Explanation of <xsl:value-of select="./@name"/></xsl:otherwise>
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
