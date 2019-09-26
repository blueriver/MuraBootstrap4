<cfoutput>
 <header>
	<div class="container">
	<h1><div id="mura-editable-attribute-title" class="mura-editable-attribute inline" data-type="text" data-attribute="title">#m.content('title')#</div></h1>
	<p class="summary"><div id="mura-editable-attribute-summary" data-type="text" class="mura-editable-attribute inline" data-attribute="summary">#m.content('summary')#</div></p>
	<cfset commentCount = Val($.content().getStats().getComments())>
	<cfset itCategories = $.content().getCategoriesIterator()>
	<cfif
		IsDate($.setDynamicContent($.content('releasedate')))
		or Len($.setDynamicContent($.content('credits')))
		or ListLen($.content().getTags())
		or itCategories.hasNext()
		or commentCount>
		
	<ul class="list-inline">
<!--- Content Release Date --->
	<cfif IsDate($.setDynamicContent($.content('releasedate')))>
		<li>
			<i class="fa fa-clock-o" aria-hidden="true"></i> #LSDateFormat($.setDynamicContent($.content('releasedate')))#
		</li>
	</cfif>
<!--- /Content Release Date --->

<!--- Credits --->
	<cfif Len($.setDynamicContent($.content('credits')))>
		<li class="list-inline-item credits">
			<i class="fa fa-user" aria-hidden="true"></i> #esapiEncode('html', $.setDynamicContent($.content('credits')))#
		</li>
	</cfif>
<!--- /Credits --->

<!--- Comments --->
	<cfif commentCount gt 0>
		<li class="list-inline-item">
			<i class="fa fa-comments" aria-hidden="true"></i> #commentCount# Comment<cfif commentCount gt 1>s</cfif>
		</li>
	</cfif>
<!--- /Comments --->
	</ul>


<!--- Categories --->
	<ul class="categories list-inline">
		<cfif itCategories.hasNext()>
			<li class="list-inline-item badge badge-dark">
				<i class="fa fa-folder-open" aria-hidden="true"></i>
				<cfloop condition="itCategories.hasNext()">
					<cfset categoryItem = itCategories.next()>
					#HTMLEditFormat(categoryItem.getName())#</a><cfif itCategories.hasNext()>, </cfif>
				</cfloop>
			</li>
		</cfif>
	</ul>
<!--- /Categories --->

<!--- Tags --->
	<ul class="tags list-inline">
		<li class="list-inline-item">Tags:</li>
		<cfif ListLen($.content().getTags())>
			<li class="list-inline-item">
				<i class="fa fa-tags" aria-hidden="true"></i>
				<cfloop from="1" to="#ListLen($.content().getTags())#" index="t">
				#esapiEncode('html', trim(ListGetAt($.content().getTags(), t)))#<cfif t neq ListLen($.content().getTags())>, </cfif>
				</cfloop>
			</li>
		</cfif>
	</ul>
<!--- /Tags --->
	</cfif>
	</div>
</header>
<div class="container">
	<nav aria-label="breadcrumb">#$.dspCrumbListLinks(class="")#</nav>
</div>
</cfoutput>
