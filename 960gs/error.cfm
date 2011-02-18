<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html>
<html lang="en">
<head>
	<title><mango:Message title /> &#8212; Error</title>

	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/text.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/960.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/main.css" type="text/css" media="screen" />

	<meta name="robots" content="noindex, nofollow" />
</head>
<body>
	<div class="container_12">

		<!--- HEADER --->
		<div class="grid_12">
			<h1><a href="<mango:Blog url />"><mango:Blog title /></a></h1>
			<h3><mango:Blog tagline /></h3>
		</div><!-- End grid_12 -->
		<div class="clear"></div>

		<!--- Navigation --->
		<div class="grid_12">
			<ul id="nav">
			</ul>
		</div><!-- End grid_12 -->
		<div class="clear"></div>

		<!--- main body --->
		<div class="grid_12">
			<h2 class="error"><mango:Message title /></h2>
			<mango:Message text />
			<mango:Message data />
		</div><!-- End grid_12 -->
		<div class="clear"></div>

		<div class="grid_12" id="footer">
			<mango:Event name="afterFooterStart" />
			<mango:Blog title /> &mdash; <a href="http://www.mangoblog.org" title="Mango Blog - A free ColdFusion blog engine">Powered by Mango Blog</a>
			<mango:Event name="beforeFooterEnd" />
		</div><!-- End grid_12 -->
		<div class="clear"></div>
		<!--- End footer --->

	</div><!-- End container_12 -->
</body>
</html>