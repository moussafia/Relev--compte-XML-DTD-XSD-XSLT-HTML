<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/">
        <html>
            <head></head>
            <body>
                <h1>Affichage releve du compte RIB: <xsl:value-of select="releve/@RIB" /></h1>
                <ul>
                    <li>Date de releve : <xsl:value-of select="releve/dateReleve" /></li>
                    <li>Solde : <xsl:value-of select="releve/solde" /></li>
                    <li>Date de debut d'operations : <xsl:value-of select="releve/operations/@dateDebut" /></li>
                    <li>Date de fin d'operations : <xsl:value-of select="releve/operations/@dateFin" /></li>
                </ul>
                
                <table border="1" width="90%">
                    <tr bgcolor="yellow">
                        <td>Type d'operations</td>
                        <td>Date operation</td>
                        <td>Montant</td>
                        <td>Desciption</td>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type" /></td>
                            <td><xsl:value-of select="@date" /></td>
                            <td><xsl:value-of select="@montant" /></td>
                            <td><xsl:value-of select="@description" /></td>
                        </tr>
                    </xsl:for-each>
                        <tr>
                            <td colspan="2"></td>
                            <td>Nombre total des operations de type DEBIT: </td>
                            <td><xsl:value-of select="count(releve/operations/operation[@type='DEBIT'])" /></td>
                        </tr>
                         <tr>
                             <td colspan="2"></td>
                             <td>Nombre total des operations de type CREDIT: </td>
                             <td><xsl:value-of select="count(releve/operations/operation[@type='CREDIT'])" /></td>
                         </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>