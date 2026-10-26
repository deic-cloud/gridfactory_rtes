<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head><title>Runtime Environments</title></head>
      <body style="background-color:white">
      
        <h2>MetaPackages</h2>
        <xsl:for-each select="RTECatalog/MetaPackage">
        <div style="width:450px; padding:5px; margin-bottom:10px;
        border:5px double black; color:black; background-color:white;
        text-align:left">
          <p>
            <xsl:apply-templates select="name"/>
            <xsl:apply-templates select="id"/>
          </p>
            <xsl:apply-templates select="description"/>
            <hr />
            <p>
              instances:
              <xsl:for-each select="instance">
                <xsl:apply-templates select="."/>
              </xsl:for-each>
	    </p>
        </div>
      </xsl:for-each>
      
      <h2>TarPackages</h2>
      <xsl:for-each select="RTECatalog/TarPackage">
        <div style="width:450px; padding:5px; margin-bottom:10px;
        border:5px double black; color:black; background-color:white;
        text-align:left">
            <xsl:apply-templates select="id"/>
            <xsl:apply-templates select="url"/><br />
            <b>basesystem</b>: <xsl:apply-templates select="basesystem"/><br />
            <b>depends</b>:
            <xsl:for-each select="depends">
              <xsl:apply-templates select="."/>
            </xsl:for-each>
        </div>
      </xsl:for-each>

      <h2>ImagePackages</h2>
      <xsl:for-each select="RTECatalog/ImagePackage">
        <div style="width:450px; padding:5px; margin-bottom:10px;
        border:5px double black; color:black; background-color:white;
        text-align:left">
            <xsl:apply-templates select="id"/>
            <xsl:apply-templates select="url"/><br />
            <b>basesystem</b>: <xsl:apply-templates select="basesystem"/><br />
            <b>depends</b>:
            <xsl:for-each select="depends">
              <xsl:apply-templates select="."/>
            </xsl:for-each>
        </div>
      </xsl:for-each>
      
      <h2>BaseSystems</h2>
      <xsl:for-each select="RTECatalog/BaseSystem">
        <div style="width:450px; padding:5px; margin-bottom:10px;
        border:5px double black; color:black; background-color:white;
        text-align:left">
            <xsl:apply-templates select="id"/>
            <xsl:apply-templates select="name"/>
            <xsl:apply-templates select="distribution"/>
            <xsl:apply-templates select="description"/>
        </div>
      </xsl:for-each>
      
    </body>
  </html>
</xsl:template>

<xsl:template match="id|name">
  <xsl:variable name="id" select="."/>
  <div id="{$id}" style="font-family:Verdana, Arial; font-size:12pt; font-weight:bold">
    id: <xsl:value-of select="."/>
  </div>
</xsl:template>

<xsl:template match="instance">
  <xsl:variable name="id" select="."/>
  <xsl:apply-templates select="instance"/>
  <text style="font-family:Verdana, Arial; font-size:12pt">
    <a href="#{$id}"><xsl:value-of select="."/></a><xsl:text> </xsl:text>
  </text>
</xsl:template>

<xsl:template match="depends">
  <xsl:variable name="id" select="."/>
  <xsl:apply-templates select="depends"/>
  <text style="font-family:Verdana, Arial; font-size:12pt">
    <a href="#{$id}"><xsl:value-of select="."/></a><xsl:text> </xsl:text>
  </text>
</xsl:template>

<xsl:template match="basesystem">
  <xsl:variable name="id" select="."/>
  <xsl:apply-templates select="basesystem"/>
  <text style="font-family:Verdana, Arial; font-size:12pt">
    <a href="#{$id}"><xsl:value-of select="."/></a><xsl:text> </xsl:text>
  </text>
</xsl:template>

<xsl:template match="name|distribution|description">
  <xsl:variable name="name" select="."/>
  <div style="font-family:Verdana, Arial; font-size:12pt; font-weight:bold">
    <xsl:value-of select="name()"/>: <a name="{$name}"><xsl:value-of select="."/></a>
  </div>
</xsl:template>

<xsl:template match="url">
  <xsl:variable name="url" select="."/>
  <div style="font-family:Verdana, Arial; font-size:12pt">
    <b>url</b>: <a href="{$url}"><xsl:value-of select="."/></a>
  </div>
</xsl:template>

</xsl:stylesheet>
