<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html>
<html lang="en">
<head profile="http://gmpg.org/xfn/11">
	<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
	<title>Login &#8212; <mango:Blog title /></title>

	<meta name="generator" content="Mango <mango:Blog version />" />

	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/text.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/960.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/main.css" type="text/css" media="screen" />

	<meta name="robots" content="noindex, nofollow" />
	<mango:Event name="beforeHtmlHeadEnd" />
</head>
<body>
	<mango:Event name="beforeHtmlBodyStart" />

	<div class="container_12">

		<div class="grid_12">
			<h1><a href="<mango:Blog url />"><mango:Blog title /></a></h1>
			<h3><mango:Blog tagline /></h3>
		</div><!-- End grid_12 -->
		<div class="clear"></div>

		<div class="grid_12">
			<ul id="nav">
			</ul>
		</div><!-- End grid_12 -->
		<div class="clear"></div>

		<!--- main body --->
		<div class="grid_12">
			<h2>Login</h2>
			<mango:RequestVar ifExists="errormsg">
				<p class="error"><mango:RequestVar name="errormsg" /></p>
			</mango:RequestVar>

			<cfoutput>
				<form action="<mangox:Environment selfUrl />" method="post" id="login_form">
					<p>
						<label for="username">Username:</label>
						<input name="username" id="username" value="" size="22" type="text" class="text_input">
					</p>
					<p>
						<label for="password">Password:</label><br />
						<input name="password" id="password" value="" size="22" type="password" class="text_input">
					</p>
					<input name="login" class="form_submit" type="submit" id="submit" src="<mango:Blog skinurl />assets/images/submit_comment.gif" value="Login" />
				</form>
			</cfoutput>

		</div><!-- End grid_12 -->
		<div class="clear"></div>


		<div class="grid_12" id="footer">
			<mango:Event name="afterFooterStart" />
			<mango:Blog title /> &mdash; <a href="http://www.mangoblog.org" title="Mango Blog - A free ColdFusion blog engine">Powered by Mango Blog</a>
			<mango:Event name="beforeFooterEnd" />
		</div><!-- End grid_12 -->
		<div class="clear"></div>
	</div><!-- End container_12 -->
	<mango:Event name="beforeHtmlBodyEnd" />
</body>
</html>