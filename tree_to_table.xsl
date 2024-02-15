<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="person">
        <html>
            <head>
                <title>Result of applying a stylesheet to person</title>
                <style>
                    table {
                    border-collapse: collapse;
                    width: 20%;
                    }
                    th, td {
                    border: 1px solid black;
                    padding: 8px; /* Add padding for constant spacing */
                    text-align: left;
                    }
                    th {
                    background-color: #f2f2f2;
                    }
                </style>
            </head>
            
                <h1>person description</h1>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Age</th>
                    <th>DOB</th>
                    <th>Father Name</th>
                    <th>Mother Name</th>
                </tr>
            
            
            <xsl:apply-templates/>
        </html>
    </xsl:template>
    
    <xsl:template match="FirstName">
        
        <td><xsl:value-of select="."/></td>
        
    </xsl:template>
    
    <xsl:template match="LastName">
        
        <td><xsl:value-of select="."/></td>
        
    </xsl:template>
    
    <xsl:template match="Age">
        
        <td><xsl:value-of select="."/></td>
        
    </xsl:template>
    
    <xsl:template match="DOB">
        
        <td><xsl:value-of select="."/></td>
        
    </xsl:template>
    
    <xsl:template match="FatherName">
        <td><xsl:value-of select="."/></td>
    </xsl:template>
    
    <xsl:template match="MotherName">
        <td><xsl:value-of select="."/></td>
    </xsl:template>
    
</xsl:stylesheet>