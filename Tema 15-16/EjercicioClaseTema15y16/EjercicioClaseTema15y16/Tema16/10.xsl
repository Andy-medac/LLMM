<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="concesionario">
        <coches>
         <xsl:for-each select="coche[combustible='Diesel']">
             <xsl:sort select="marca"/>
                <marca><xsl:value-of select="marca"/></marca>
         </xsl:for-each>
        </coches>
    </xsl:template>
</xsl:stylesheet>

