<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="xml" indent="yes" encoding="UTF-8" />
<xsl:template match="/Rows">
 <html>
	<head>
	<title>DATA</title>
	<style type="text/css">
		table {
		  font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
		  border: 1px solid #005826;
		  text-align: center;
		  border-collapse: collapse;
		  font-size: 10px;
		}
		table td, th {
		  border: 1px solid #005826;
		  padding: 3px 3px;
		}
		table tbody td {
		  font-size: 10px;
		}
		table thead {
		  background: #005826;
		  border-bottom: 2px solid #FFFFFF;
		}
		table thead th {
		  font-size: 11px;
		  color: #FFFFFF;
		  text-align: center;
		  border-left: 1px solid #FFFFFF;
		  border-right: 1px solid #FFFFFF;
		}
		table thead th:first-child {
		  border-left: none;
		}
		table tfoot td {
		  font-size: 10px;
		}
	</style>
	
 	</head>
  	<body>
		<table style="border-collapse: collapse">
			<thead>
			<tr>
				<th align="center"><div style="width: 20px">No</div></th>
				<th align="center"><div style="width: 65px">WS Device</div></th>
				<th align="center"><div style="width: 200px">Location</div></th>
				<th align="center"><div style="width: 170px">Transaction Date</div></th>
        		<th align="center"><div style="width: 100px">Running On</div></th>
				<th align="center"><div style="width: 60px">Rain</div></th>
			</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="Row">
				<xsl:sort select="title" />
				</xsl:apply-templates>
			</tbody>
		</table>
  	</body>
  </html>
</xsl:template>


<xsl:template match="Row">
	<xsl:variable name="altColor">
		<xsl:choose>
			<xsl:when test="position() mod 2 = 1">#FFFFFF</xsl:when>
			<xsl:otherwise>#EAFEEA</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	
	<tr bgcolor="{$altColor}">
		<td align="center"><div style="width: 20px"><xsl:value-of select = "position()"/></div></td>
		<xsl:comment>
		<td align="center">
			<xsl:element name="IMG">
			  <xsl:attribute name="src">
				<xsl:value-of select="status"/>
			  </xsl:attribute>
			  <xsl:attribute name="title">
				<xsl:value-of select="your_title"/>
			   </xsl:attribute >
			</xsl:element>
		</td>
		</xsl:comment>
		<td align="center"><div style="width: 65px"><xsl:value-of select="WSCode"/></div></td>
		<td align="center"><div style="width: 200px"><xsl:value-of select="Remarks"/></div></td>
		<td align="center"><div style="width: 170px"><xsl:value-of select="LastModified"/></div></td>
		<td align="center"><div style="width: 100px"><xsl:value-of select="RunningOn"/></div></td>
		<td align="center"><div style="width: 60px"><xsl:value-of select="Rain"/></div></td>
	</tr>
</xsl:template>

</xsl:stylesheet>