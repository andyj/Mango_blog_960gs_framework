<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />
	<title><mango:Blog title /> &#8212; <mango:Blog tagline /></title>
	<meta name="generator" content="Mango <mango:Blog version />" />
	<meta name="description" content="<mango:Blog description />" />

	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/text.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/960.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/main.css" type="text/css" media="screen" />

	<meta name="robots" content="index, follow" />
	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<mango:Blog rssurl />" />
	<link rel="alternate" type="application/atom+xml" title="Atom" href="<mango:Blog atomurl />" />
	<link rel="EditURI" type="application/rsd+xml" title="RSD" href="<mango:Blog apiurl />" />
	<mango:Event name="beforeHtmlHeadEnd" />
</head>
<body>
	<mango:Event name="beforeHtmlBodyStart" />

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
				<li><a class="current" href="<mango:Blog basePath />">front page</a></li>
				<mango:Pages><mango:Page>
					<li><a href="<mango:PageProperty link>" title="<mango:PageProperty title />">
						<mango:PageProperty title /></a></li>
					</mango:Page></mango:Pages>
				<li class="rss"><a href="<mango:Blog rssurl />">RSS</a></li>
			</ul>
		</div><!-- End grid_12 -->
		<div class="clear"></div>

		<!--- Main body --->
		<div class="grid_9">
			<mango:Posts count="10">
				<mango:Post>
				<h2><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent Link to <mango:PostProperty title />"><mango:PostProperty title /></a></h2>
				<h4><mango:PostProperty date dateformat="mmmm dd, yyyy" /> &middot; By <mango:PostProperty author /> &middot; <mango:PostProperty ifcommentsallowed><a href="<mango:PostProperty link />#respond" title="Comment on <mango:PostProperty title />"><mango:PostProperty ifCommentCountGT="0"><mango:PostProperty commentCount /> Comment<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty></mango:PostProperty><mango:PostProperty ifCommentCountLT="1">No Comments</mango:PostProperty></a></mango:PostProperty></h4>
				<div class="entry">
					<mango:PostProperty ifhasExcerpt excerpt>
					<p><a href="<mango:PostProperty link />" title="Read the rest of this entry">[Read more &rarr;]</a></p>
					</mango:PostProperty>
					<mango:PostProperty ifNotHasExcerpt body />
				</div>
				<div class="entry-footer entry">
				<mango:Event name="beforePostContentEnd" template="index" mode="excerpt" />
				</div>
				<p class="tagged"><span class="add_comment"><mango:PostProperty ifcommentsallowed>&rarr; <a href="<mango:PostProperty link />#respond" title="Comment on <mango:PostProperty title />"><mango:PostProperty ifCommentCountGT="0"><mango:PostProperty commentCount /> Comment<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty></mango:PostProperty><mango:PostProperty ifCommentCountLT="1">No Comments</mango:PostProperty></a></mango:PostProperty></span><strong>Tags:</strong>
				<mango:Categories><mango:Category><a href="<mango:CategoryProperty link />" title="View all posts in  <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a> <mango:Category ifCurrentIsNotLast>&middot; </mango:Category></mango:Category></mango:Categories>
				</p>
				<div class="clear"></div>
				</mango:Post>
			</mango:Posts>

			<mango:Archive pageSize="10">
				<div class="navigation">
					<div class="previous"><mango:ArchiveProperty ifHasNextPage><a class="previous" href="<mango:ArchiveProperty link pageDifference="1" />">&larr; Previous Entries</a></mango:ArchiveProperty></div>
				<div class="next"></div>
			</div>
			</mango:Archive>
		</div><!-- End grid_9 -->

		<!--- SIDEBAR --->
		<div class="grid_3">
			<ul class="sidebar_list">
				<mangox:PodGroup locationId="sidebar" template="index">
					<mangox:TemplatePod id="blog-description" title="About">
					<p><mango:Blog description descriptionParagraphFormat /></p>
					</mangox:TemplatePod>
					<template:sidebar />
				</mangox:PodGroup>
			</ul>
		</div><!-- End grid_3 -->
		<div class="clear"></div>

		<!--- Footer --->
		<div class="grid_12">
			<mangox:PodGroup locationId="footer" template="index">
				<template:footer />
	        </mangox:PodGroup>
		</div>
		<div class="clear"></div>

		<div class="grid_12" id="footer">
			<mango:Event name="afterFooterStart" />
			<mango:Blog title /> &mdash; <a href="http://www.mangoblog.org" title="Mango Blog - A free ColdFusion blog engine">Powered by Mango Blog</a>
			<mango:Event name="beforeFooterEnd" />
		</div><!-- End grid_12 -->
		<div class="clear"></div>
		<!--- End footer --->

	</div><!-- End container_12 -->

	<mango:Event name="beforeHtmlBodyEnd" />
</body>
</html>