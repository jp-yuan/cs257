<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="person">
        <html>
            <head><title>result of applying a stylesheet to person</title></head>
            <body><h1>person description</h1></body>
            <xsl:apply-templates/>
        </html>
    </xsl:template>
    
</xsl:stylesheet>