<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="3.0">    
    
    <!--dobi vse linke iz cell elementa, jih tag-aj z elementom ref, ki naj ima att target s textom elementa ref-->
    
    <xsl:output method="xml"/>
    
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:cell">
        <cell>
            <xsl:analyze-string select="." regex="http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.+]|[!*\(\)~#,]|(?:%[0-9a-fA-F][0-9a-fA-F]))+">
                <xsl:matching-substring>
                    <ref>
                        <xsl:attribute name="target">
                            <xsl:value-of select="."/>
                        </xsl:attribute>
                        <xsl:value-of select="."/>
                    </ref>
                </xsl:matching-substring>
                <xsl:non-matching-substring>
                    <xsl:value-of select="."/>
                </xsl:non-matching-substring>
            </xsl:analyze-string>           
        </cell>
    </xsl:template>
          
        
    </xsl:stylesheet>
    
    