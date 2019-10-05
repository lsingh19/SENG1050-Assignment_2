<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- 
		File Name: convert.xsl
		Last Modified: 26-10-2018
	--> 

<!-- The code below will output the xml file using xsl into a html format --> 
<xsl:output method="html" />
	<!-- Acts as the 'main' template --> 
    <xsl:template match="/">
	   <html>
		 <head>	
			<!-- The title of the webpage display on the broswer tab of the webpage -->
		 	<title>Farm Information</title>		
			<!-- Letting the browser that the webpage will be styled using an external web page -->
			<link rel="stylesheet" href="style.css" /> 
				<!-- The following styles will only be applied for this webpage alone and no other webpages
					 webpage will be styled using these styles 
				-->
				<style> 
					h3 {text-decoration: underline; text-align:center; }
					p{background: rgba(255, 255, 255, 1); border-radius: 2px; }
					#help {display: block; margin-left: auto; margin-right: auto; float:none;}
				</style>
		 </head>
		 <body>
			<!-- The following code will retrieve the goodsType from the xml page and display it as the 
				 main heading for that webpage-->
			<h1><xsl:value-of select="ofm/goodsType/@sort"/> Farms</h1>
				<!-- Navigation links to other webpages on the website -->
				<div id="nav">
						<hr/>
							<nav> 
								<a href="index.html">Home Page</a> |
								<a href = "Fruit.xml">Fruit Farms</a> |
								<a href = "Vegetables.xml">Vegetables Farms</a> | 
								<a href = "datacollection.html">Data Collection</a> | 
								<a href = "https://www.visser.com.au/blog/generic-privacy-policy-for-australian-websites/">Privacy Policy</a> |
								<a href = "https://media.termsfeed.com/pdf/terms-and-conditions-template.pdf">Terms and Conditions</a> |
								<a href = "https://www.blogtyrant.com/best-about-us-pages/">About us</a> |
								<a href = "https://www.blogtyrant.com/best-contact-us-pages/">Contact</a> 
							</nav>
						<hr/>
				</div>
					
				<!-- The following code will apply the template called 'ofm/goodsType' --> 
				<xsl:apply-templates select="ofm/goodsType" />
				
				<!-- Details about the creater and the last date it was modified -->
				<div class= "ffs">
					<address id="copyright"> 
						<b>Created by:</b> Lovekesh Singh <br/>
						<b>Last Modified:</b> 26/10/2018  <br/>
						<b>Institution:</b> <abbr title="University of Newcastle">UON</abbr> <br/>
						<b>Student No:</b> c3256655 <br/>
						<b>Email:</b> c3256655@uon.edu.au <br/> 
					</address> 
				</div>
		 </body>
	   </html>
	   
     </xsl:template>
							
		<!-- The following tempelate is called and details about the farms and produce will be printed --> 
	<xsl:template match="ofm/goodsType">
			<!-- A for-loop will be used to printed details about each farm one by one -->
			<xsl:for-each select="goods">
				<!-- The following code sort out the farms by alphabetical order in the webpage -->
				
				<xsl:sort select="farm/farmName"/>
				<!-- A level 2 heading with the farm named will be displayed and styled using an external css file -->
				
				<h2><xsl:value-of select="farm/farmName"/></h2>
				
				<!-- The following codes will output the details about the farm aswell as the details abou the produce -->
				<p>
					<!-- Note: anything that is retrieved from the xml document will be displayed in bold -->
					<b>Farm Picture:</b><br/>
					<img alt="Farm Picture" height="275" width="350" id="help">
						<xsl:attribute name="src">
							<xsl:value-of select="farm/farmPicture"/>			
						</xsl:attribute>			
					</img>  <br/>
					<b>Farm Description:</b> <xsl:value-of select="farm/farmDescription"/> <br/>
					<b>This farm exports:</b> <xsl:value-of select="goodsName"/> <br/>
						<img alt="Goods Picture" height="100" width="100" id="help">
							<xsl:attribute name="src">
								<xsl:value-of select="goodsPicture"/>			
							</xsl:attribute>			
						</img>	
				</p>
				<p>
					<h3> Contact Information </h3>
						<b>FarmLogo:</b> <br/>
						<img alt="Farm Logo" height="75" width="75" id="help">
							<xsl:attribute name="src">
								<xsl:value-of select="farm/farmLogo"/>			
							</xsl:attribute>			
						</img>	
					<br/>
					<b>Farm URL:</b> <xsl:value-of select="farm/farmURL"/> <br/>
					<b>Farm Address:</b> <xsl:value-of select="farm/farmAddress"/> <br/>
					<b>Farm Phone Number:</b> <xsl:value-of select="farm/farmPhoneNumber"/> <br/>
					<b>Farm Owner:</b> <xsl:value-of select="farm/farmOwner"/> <br/>
					<b>Farm Established:</b> <xsl:value-of select="farm/farmEstablished"/> <br/>
					<b>Employees:</b> <xsl:value-of select="farm/numberOfEmployees"/> staff<br/>
					<b>Delivery Fee:</b> <xsl:value-of select="delivery/deliveryFee"/> (<xsl:value-of select="delivery/currency"/>) <br/>
					<b>The minimum price for delivery:</b> <xsl:value-of select="delivery/minimumPrice"/> (<xsl:value-of select="delivery/currency"/>) <br/>
				</p>
			</xsl:for-each> 
	</xsl:template>		
</xsl:stylesheet> 