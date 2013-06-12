<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs">

<xsl:output method="xml" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>

<xsl:template match="/">
	<xsl:apply-templates select="Data/Series"/>
</xsl:template>

<xsl:template match="Series">
  <xsl:element name="series">
    <xsl:apply-templates select="SeriesName, Overview"/>
    <xsl:for-each-group select="../Episode" group-by="SeasonNumber">
      <xsl:sort select="current-grouping-key()" data-type="number"/>
      <xsl:element name="season">
        <xsl:attribute name="number">
          <xsl:value-of select="current-grouping-key()"/>
        </xsl:attribute>
        <xsl:apply-templates select="current-group()">
          <xsl:sort select="EpisodeNumber" data-type="number"/>
        </xsl:apply-templates>
      </xsl:element>
    </xsl:for-each-group>	
  </xsl:element>
</xsl:template>

<xsl:template match="Episode">
  <xsl:element name="episode">
    <xsl:attribute name="number" select="EpisodeNumber"/>
    <xsl:apply-templates select="EpisodeName, Overview"/>
  </xsl:element>
</xsl:template>

<xsl:template match="SeriesName|EpisodeName">
  <xsl:element name="name">
    <xsl:value-of select="."/>
  </xsl:element>
</xsl:template>

<xsl:template match="Overview">
  <xsl:element name="overview">
    <xsl:value-of select="normalize-space(.)"/>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
