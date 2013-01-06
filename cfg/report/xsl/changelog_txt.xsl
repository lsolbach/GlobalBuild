<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    version='1.0'>
   <xsl:output method="text" encoding="UTF-8"/>

   <xsl:template match="*">      		  
	<xsl:apply-templates select="changelog"/>	
   </xsl:template>

   <xsl:template match="changelog">   
   	<xsl:apply-templates select="entry"/>	
   </xsl:template>

   <xsl:template match="entry">   
   	<xsl:apply-templates select="msg"/>	
   </xsl:template>

   <xsl:template match="msg">
   	<xsl:if test="not(string(.)='*** empty log message ***')">
- <xsl:value-of select="."/>    
	</xsl:if>
   </xsl:template>
  
</xsl:stylesheet>
