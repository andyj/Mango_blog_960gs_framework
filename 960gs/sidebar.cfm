<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfif thisTag.executionMode EQ "start">

	<!--- recent posts --->
	<mangox:TemplatePod id="posts" title="Recent Entries">
	<ul>
		<mango:Posts count="5" source="recent">
		<mango:Post>
			<li><a href="<mango:PostProperty link />"><mango:PostProperty title /></a><span class="recent_date"><mango:PostProperty date dateformat="m.dd" /></span></li>
		</mango:Post>
		</mango:Posts>
		<mango:Archive pageSize="5"><mango:ArchiveProperty ifHasNextPage>
		<li><a href="<mango:ArchiveProperty link />" title="Visit the archives!">Visit the archives for more!</a></li></mango:ArchiveProperty></mango:Archive>
	</ul>
	</mangox:TemplatePod>

	<!--- categories with RSS --->
	<mangox:TemplatePod id="categories" title="Categories">
	<ul>
	<mango:Categories>
		<mango:Category>
		<li><a href="<mango:CategoryProperty rssurl />" class="category_rss"><img src="<mango:Blog skinurl />assets/images/icon_rss.gif"></a> <a href="<mango:CategoryProperty link />" title="<mango:CategoryProperty title />"><mango:CategoryProperty title /></a> </li>
		</mango:Category>
	</mango:Categories>
	</ul>
	</mangox:TemplatePod>

	<!--- search box --->
	<mangox:TemplatePod id="search" title="Search It!">
	<form name="searchForm" id="search_form" method="get" action="<mango:Blog searchUrl />">
		<input type="text" class="search_input" name="term" value="To search, type and hit enter" id="term" onfocus="if (this.value == 'To search, type and hit enter') {this.value = '';}" onblur="if (this.value == '') {this.value = 'To search, type and hit enter';}" />
		<input type="hidden" id="searchsubmit" value="Search" />
	</form>
	</mangox:TemplatePod>

	<!--- category cloud --->
	<mangox:TemplatePod id="category-cloud" title="Tag Cloud">
		<mangox:CategoryCloud />
	</mangox:TemplatePod>

	<!--- all archives by month --->
	<mangox:TemplatePod id="monthly-archives" title="Monthly Archives">
		<ul><mango:Archives type="month" count="6"><mango:Archive>
			<li><a href="<mango:ArchiveProperty link />"><mango:ArchiveProperty title dateformat="mmmm yyyy" /> (<mango:ArchiveProperty postcount />)</a></li>
		</mango:Archive></mango:Archives>
		</ul>
	</mangox:TemplatePod>

<!--- all links by category --->
	<mangox:TemplatePod id="links-by-category">
		<mangox:LinkCategories>
			<mangox:LinkCategory>
			<li class="linkcat">
			<h2><mangox:LinkCategoryProperty name /></h2>
			</mangox:LinkCategory>
				<ul>
				<mangox:Links>
				<mangox:Link>
					<li><a href="<mangox:LinkProperty address />" title="<mangox:LinkProperty title />"><mangox:LinkProperty title /></a></li>
				</mangox:Link>
				</mangox:Links>
				</ul>
			</li>
		</mangox:LinkCategories>
	</mangox:TemplatePod>


	<!--- output all the pods, including the ones added by plugins --->
	<mangox:Pods>
		<mangox:Pod>
			<mangox:PodProperty ifHasTitle>
			<li class="widget">
				<h2><mangox:PodProperty title /></h2>
				<mangox:PodProperty content />
			</li>
			</mangox:PodProperty>
		</mangox:Pod>
		<mangox:Pod><!--- output the content as is, good for "templatePods" --->
			<mangox:PodProperty ifNotHasTitle>
				<mangox:PodProperty content />
			</mangox:PodProperty>
		</mangox:Pod>
	</mangox:Pods>
</cfif>