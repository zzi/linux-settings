<!-- 

 This XSLT is used to translate an XML response from the weather.com
 XML API. 

 You can format this file to your liking. Two things you may feel 
 like doing:

	1) Modify the layout of the fields or static text already defined
	2) Add other fields from the XML response file that aren't referenced in this
	   XSLT. You can grab a full list by just doing a: 
           wget "http://xoap.weather.com/weather/local/$LOCID?cc=*&unit=$UNITS" 
           (change $LOCID and $UNITS to suit your needs)
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" > 
	<xsl:output method="text" disable-output-escaping="yes"/>
	<xsl:template match="weather">
		<xsl:apply-templates select="cc"/>
		<xsl:apply-templates select="dayf/day[@d='1']"/>
	</xsl:template>
 
	
	<xsl:template match="cc">
<xsl:text>Температура: </xsl:text><xsl:value-of select="tmp"/><xsl:value-of select="/weather/head/ut"/>
<xsl:if test="tmp != flik">
<xsl:text>
Комфорт: </xsl:text><xsl:value-of select="flik"/><xsl:value-of select="/weather/head/ut"/>
</xsl:if>
<xsl:text>
Условия: </xsl:text><xsl:value-of select="t"/>
<xsl:text>
Ветер: </xsl:text>
<xsl:choose>
	<xsl:when test="wind/s = 'calm'"><xsl:text>0</xsl:text></xsl:when>
	<xsl:otherwise><xsl:text> </xsl:text><xsl:value-of select="round(wind/s * 0.277777778)"/><xsl:text>м/с</xsl:text></xsl:otherwise>
</xsl:choose>
<xsl:text> (</xsl:text><xsl:value-of select="wind/t"/>
<xsl:text>)</xsl:text>
	</xsl:template>

	<xsl:template match="dayf/day[@d='1']">

<xsl:text>
Завтра: </xsl:text><xsl:value-of select="low"/><xsl:value-of select="/weather/head/ut"/>
<xsl:text> to </xsl:text><xsl:value-of select="hi"/><xsl:value-of select="/weather/head/ut"/>
<xsl:text>, </xsl:text><xsl:value-of select="part[@p='d']/t"/>
<xsl:text>
  </xsl:text><xsl:value-of select="/weather/swa/a/t"/>
<xsl:text>
</xsl:text>
	</xsl:template>
</xsl:stylesheet>
