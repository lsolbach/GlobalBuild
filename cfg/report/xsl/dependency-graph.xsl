<?xml version="1.0"?>
<!-- Convert JDepend output to dot input -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"/>
	
	<xsl:template match="dependencies">
digraph "Dependencies" {
	nodesep=0.125;
	outputmode=nodefirst;
	node [shape=box fontsize=9];
	
	"Project";
		<xsl:apply-templates select="dependency/package" mode="nodes"/>	
		<xsl:apply-templates select="dependency/package" mode="edges"/>	
}
	</xsl:template>
	
	<xsl:template match="dependency/package" mode="nodes">
		"<xsl:value-of select="@name"/>-<xsl:value-of select="@version"/>";
	</xsl:template>
	
	<xsl:template match="dependency/package" mode="edges">
		"Project" -&gt; "<xsl:value-of select="@name"/>-<xsl:value-of select="@version"/>"
	</xsl:template>
	
	<xsl:template match="text()"/>
	<xsl:template match="text()" mode="nodes"/>
	<xsl:template match="text()" mode="edges"/>	
</xsl:stylesheet>
