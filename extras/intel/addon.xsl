<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:sdk="http://schemas.android.com/sdk/android/addon/7">

	<!-- https://dl.google.com/android/repository/addon.xml -->

	<xsl:strip-space elements="*" />
	<xsl:output indent="yes" method="text" />

	<xsl:template match="/sdk:*">
		<xsl:for-each select="sdk:*[not(sdk:obsolete)]/sdk:archives/sdk:archive/sdk:url">

			<xsl:variable name="url" select="text()"></xsl:variable>

			<xsl:choose>
				<xsl:when test="not(starts-with($url, 'https://dl.google.com/android/repository/extras/intel/'))">
					<xsl:text>https://dl.google.com/android/repository/extras/intel/</xsl:text>
				</xsl:when>
			</xsl:choose>

			<xsl:value-of select="$url" />

			<!-- http://stackoverflow.com/questions/723226/producing-a-new-line-in-xslt -->
			<xsl:text>&#xa;</xsl:text>

		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
