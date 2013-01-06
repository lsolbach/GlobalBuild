<?xml version="1.0"?>
<!-- Convert JDepend output to dot input -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	
	<xsl:template match="JDepend">
digraph "Dependencies" {
	nodesep=0.125;
	outputmode=nodefirst;
	node [shape=box fontsize=9];
		<xsl:apply-templates select="Packages" mode="nodes"/>	
		<xsl:apply-templates select="Packages" mode="edges"/>	
}
	</xsl:template>
	
	<xsl:template match="Packages/Package" mode="nodes">
		"<xsl:value-of select="@name"/>"
			[label="<xsl:value-of select="@name"/>\n#: <xsl:value-of select="Stats/TotalClasses"/>, A: <xsl:value-of select="Stats/A"/>, I: <xsl:value-of select="Stats/I"/>" <xsl:apply-templates select="Stats/D" mode="nodes"/>];
	</xsl:template>
	
	<xsl:template match="Stats/D[text()&lt;0.2]" mode="nodes">
		,color="green",style="filled"
	</xsl:template>

	<xsl:template match="Stats/D[text()&gt;=0.2 and text()&lt;0.5]" mode="nodes">
		,color="yellow",style="filled"
	</xsl:template>

	<xsl:template match="Stats/D[text()&gt;=0.5]" mode="nodes">
		,color="red",style="filled"
	</xsl:template>

	<xsl:template match="DependsUpon/Package" mode="edges">
		"<xsl:value-of select="../../@name"/>" -&gt; "<xsl:value-of select="text()"/>"
	</xsl:template>

	<xsl:template match="text()"/>
	<xsl:template match="text()" mode="nodes"/>
	<xsl:template match="text()" mode="edges"/>

</xsl:stylesheet>