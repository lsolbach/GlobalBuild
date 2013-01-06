<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version ="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="pmd-cpd">
<html>
<head>
	<title>PMD/CPD Code Duplication Report</title>
	<style type="text/css">
        .code { background:#DDDDDD; }
    </style>
	
</head>
<body>
	<h1>Code duplications</h1>
	<xsl:apply-templates/>
</body>
</html>
</xsl:template>

<xsl:template match="duplication">
	<h2>Duplication</h2>
	<xsl:apply-templates/>
</xsl:template>

<xsl:template match="file">
	Line <xsl:value-of select="@line"/><br/>
	File: <xsl:value-of select="@path"/><br/>
</xsl:template>

<xsl:template match="codefragment">
	<pre class="code"><xsl:value-of select="text()"/></pre>
</xsl:template>

</xsl:stylesheet>
