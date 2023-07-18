<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="3.0">    
    
    <!--head takoj za div - value iz xy cell-->
    
    <xsl:output method="xml"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:div/tei:table">
        <xsl:copy>
            <head>
                <xsl:value-of select="tei:row[3]/tei:cell[2]"/>
            </head>
            <xsl:apply-templates select="tei:row"/>
        </xsl:copy>
    </xsl:template>
          
        
    </xsl:stylesheet>
    
    