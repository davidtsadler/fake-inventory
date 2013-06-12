<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
  version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  exclude-result-prefixes="xs"
  xmlns:dts="http://davidtsadler.com/">

<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="/">
  <xsl:text>profile_name,title,description,site,primary_ebay_category,primary_store_category&#xa;</xsl:text>
	<xsl:apply-templates select="data/series" mode="series"/>
	<xsl:apply-templates select="data/series/season" mode="season"/>
	<xsl:apply-templates select="data/series/season/episode" mode="episode"/>
</xsl:template>

<xsl:template match="series" mode="series">
  <xsl:variable name="name" as="xs:string">
    <xsl:value-of select="concat(name, ' - The Complete Collection ')"/>
  </xsl:variable>
  <xsl:variable name="description">
    <xsl:text>&lt;p></xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text>&lt;/p></xsl:text>
    <xsl:text>&lt;p></xsl:text>
    <xsl:apply-templates select="overview" mode="series"/>
    <xsl:text>&lt;/p></xsl:text>
  </xsl:variable>
  <xsl:value-of select="dts:escape_field($name)"/>
  <xsl:text>,</xsl:text>
  <xsl:value-of select="dts:escape_field($name)"/>
  <xsl:text>,</xsl:text>
  <xsl:value-of select="dts:escape_field($description)"/>
  <xsl:text>,</xsl:text>
  <xsl:text>US</xsl:text>
  <xsl:text>,</xsl:text>
  <xsl:text>617</xsl:text>
  <xsl:text>,</xsl:text>
  <xsl:text>1</xsl:text>
  <xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="season" mode="season">
  <xsl:variable name="name" as="xs:string">
    <xsl:value-of select="concat(../name, ' - The Complete Season ', @number)"/>
  </xsl:variable>
  <xsl:variable name="description">
    <xsl:text>&lt;p></xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text>&lt;/p></xsl:text>
    <xsl:text>&lt;ul></xsl:text>
    <xsl:apply-templates select="episode" mode="season"/>
    <xsl:text>&lt;/ul></xsl:text>
  </xsl:variable>
  <xsl:value-of select="dts:escape_field($name)"/>
  <xsl:text>,</xsl:text>
  <xsl:value-of select="dts:escape_field($name)"/>
  <xsl:text>,</xsl:text>
  <xsl:value-of select="dts:escape_field($description)"/>
  <xsl:text>,</xsl:text>
  <xsl:text>US</xsl:text>
  <xsl:text>,</xsl:text>
  <xsl:text>617</xsl:text>
  <xsl:text>,</xsl:text>
  <xsl:text>1</xsl:text>
  <xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="episode" mode="episode">
  <xsl:variable name="name" as="xs:string">
    <xsl:value-of select="name"/>
  </xsl:variable>
  <xsl:variable name="description">
    <xsl:text>&lt;p></xsl:text>
    <xsl:value-of select="$name"/>
    <xsl:text>&lt;/p></xsl:text>
    <xsl:text>&lt;p></xsl:text>
    <xsl:value-of select="overview"/>
    <xsl:text>&lt;/p></xsl:text>
  </xsl:variable>
  <xsl:value-of select="dts:escape_field($name)"/>
  <xsl:text>,</xsl:text>
  <xsl:value-of select="dts:escape_field($name)"/>
  <xsl:text>,</xsl:text>
  <xsl:value-of select="dts:escape_field($description)"/>
  <xsl:text>,</xsl:text>
  <xsl:text>US</xsl:text>
  <xsl:text>,</xsl:text>
  <xsl:text>617</xsl:text>
  <xsl:text>,</xsl:text>
  <xsl:text>1</xsl:text>
  <xsl:text>&#xa;</xsl:text>
</xsl:template>

<xsl:template match="episode" mode="season">
  <xsl:text>&lt;li></xsl:text>
  <xsl:value-of select="name"/>
  <xsl:text>&lt;/li></xsl:text>
</xsl:template>

<xsl:function name="dts:escape_field" as="xs:string">
  <xsl:param name="field" as="xs:string"/>
  <xsl:choose>
    <xsl:when test="contains($field, '&quot;')">
      <xsl:variable name="x" select="replace($field, '&quot;',  '&quot;&quot;')"/>
      <xsl:value-of select="concat('&quot;', $x, '&quot;')"/>
    </xsl:when>
    <xsl:when test="contains($field, ',')">
      <xsl:value-of select="concat('&quot;', $field, '&quot;')"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="$field"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:function>

</xsl:stylesheet>
