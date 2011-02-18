<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<!DOCTYPE html>
<html lang="en">
<head>
<mango:Page>
	<title><mango:PageProperty title /> &#8212; <mango:Blog title /></title>

	<meta http-equiv="Content-Type" content="text/html; charset=<mango:Blog charset />" />

	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/reset.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/text.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/960.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<mango:Blog skinurl />assets/css/main.css" type="text/css" media="screen" />

	<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<mango:Blog rssurl />" />
	<link rel="alternate" type="application/atom+xml" title="Atom" href="<mango:Blog atomurl />" />
	<link rel="EditURI" type="application/rsd+xml" title="RSD" href="<mango:Blog apiurl />" />

	<meta name="generator" content="Mango <mango:Blog version />" />
	<mango:PageProperty ifHasCustomField='meta-description'>
		<meta name="description" content="<mango:PageProperty customfield='meta-description' />" />
	</mango:PageProperty>
	<mango:PageProperty ifNotHasCustomField='meta-description'>
		<meta name="description" content="<mango:Blog description />" />
	</mango:PageProperty>
	<meta name="robots" content="index, follow" />
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
				<li><a href="<mango:Blog basePath />">Home</a></li>
				<mango:Pages parentPage="">
					<mango:Page>
						<li <mango:PageProperty ifiscurrentpage>id="current"</mango:PageProperty>>
							<a <mango:PageProperty ifiscurrentpage>class="current"</mango:PageProperty> href="<mango:PageProperty link>" title="<mango:PageProperty title />"><mango:PageProperty title /></a>
						</li>
					</mango:Page>
				</mango:Pages>
			</ul>
		</div><!-- End grid_12 -->
		<div class="clear"></div>

		<!--- Main body --->
		<div class="grid_9">

        	<h2><mango:PageProperty title /></h2>
			<mango:PageProperty body />

			<div class="post-footer">
				<mango:Event name="beforePageContentEnd" template="page" mode="full" />
			</div>

            <div id="comments">
				<mango:PageProperty ifcommentsallowed>
					<h3 class="comments_headers"><mango:PageProperty commentCount /> response<mango:PageProperty ifCommentCountGT="1">s</mango:PageProperty><mango:PageProperty ifCommentCountLT="1">s</mango:PageProperty><mango:PageProperty ifcommentsallowed> so far &darr;</mango:PageProperty></h3>
	            </mango:PageProperty>

			    <mango:PageProperty ifNotCommentsAllowed ifCommentCountGT="0">
					<div class="comment-number">
						<h3 class="comments_headers"><mango:PageProperty commentCount /> response<mango:PageProperty ifCommentCountGT="1">s</mango:PageProperty></h3><p> (comments are now closed)	</p>
		    		</div><!--end comment-number-->
				</mango:PageProperty>

			    <mango:Comments>
					<mango:Comment>
						<blockquote<mango:CommentProperty ifIsAuthor> class="author"</mango:CommentProperty>>
	                    <p><strong><mango:CommentProperty ifhasurl><a href='<mango:CommentProperty url />' rel='external nofollow'></mango:CommentProperty><mango:CommentProperty name /><mango:CommentProperty ifhasurl></a></mango:CommentProperty> </strong> - <mango:CommentProperty date dateformat="mmm d, yyyy" /> at <mango:CommentProperty time /><p>
						<mango:CommentProperty content /></blockquote>
					</mango:Comment>
				</mango:Comments>

				<mango:PageProperty ifcommentsallowed>
                    <!-- Comment Form -->
                    <h3 id="respond" class="comments_headers">Leave a Comment</h3>
                    <mango:Message ifMessageExists type="comment" status="error">
                        <p class="error">There was a problem: <mango:Message text /></p>
                    </mango:Message>

					<mango:Message ifMessageExists type="comment" status="success">
                        <p class="message"><mango:Message text /></p>
                    </mango:Message>

                    <form method="post" action="#respond" id="comment_form">

                        <mango:AuthenticatedAuthor ifNotIsLoggedIn>
                       	<div>
                       		<label for="comment_name">Name</label>
							<input id="comment_name" type="text" name="comment_name" value="<mango:RequestVar name='comment_name' />" />
						</div>
						<div>
	                        <label for="email">Mail (it will not be displayed)</label>
							<input type="text" id="email" name="comment_email" value="<mango:RequestVar name='comment_email' />" />
						</div>
						<div>
	                        <label for="url">Website</label>
							<input type="text" id="url" name="comment_website" size="30" value="<mango:RequestVar name='comment_website' />"  />
						</div>
                        </mango:AuthenticatedAuthor>
						<div>
	                        <label for="comment_content">Your comments</label>
    	                    <textarea id="comment_content" name="comment_content" rows="7"><mango:RequestVar name="comment_content" /></textarea>
						</div>
						<div>
                        	<label for="subscribe">Subscribe to this comment thread</label>
							<input type="checkbox" id="subscribe" name="comment_subscribe" value="1" />
						</div>
                       <mango:Event name="beforeCommentFormEnd" /></p>
						<div>
	                        <input name="submit" class="button" type="submit" id="submit" value="Submit" />
						</div>
						<!--- Hidden fields --->
						<input type="hidden" name="action" value="addComment" />
                        <input type="hidden" name="comment_post_id" value="<mango:PageProperty id />" />
                        <input type="hidden" name="comment_parent" value="" />
                        <mango:AuthenticatedAuthor ifIsLoggedIn>
                            You are logged in as <mango:AuthorProperty name />
                            <input type="hidden" name="comment_name" value="<mango:AuthorProperty name />" />
                            <input type="hidden" name="comment_email" value="<mango:AuthorProperty email />" />
                            <input type="hidden" name="comment_website" value="<mango:Blog url />" />
                        </mango:AuthenticatedAuthor>
                        </form>
                </mango:PageProperty>
			</div> <!-- ends id:comments -->
		</div><!-- End grid_9 -->

		<!--- SIDEBAR --->
		<div class="grid_3">
			<mangox:PodGroup locationId="sidebar-page" template="index">
               <mango:Pages ifCountGT="0" count="1" parentPage="firstParent">
				<mangox:TemplatePod id="page-menu" title="Page Menu">
					<template:pageMenu start="parent" />
				</mangox:TemplatePod>
				</mango:Pages>
                <template:sidebar />
            </mangox:PodGroup>
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

	</div> <!-- END container_12 -->
<mango:Event name="beforeHtmlBodyEnd" />
</mango:Page>
</body>
</html>
