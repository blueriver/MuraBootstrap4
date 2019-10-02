<cfsilent>
	<cfif request.muraFrontEndRequest>
		<cfset objectparams.title=$.content('title')>
		<cfset objectparams.summary=$.content('summary')>
	<cfelse>
		<cfparam name="objectparams.title" default="#$.content('title')#">
		<cfparam name="objectparams.summary" default="#$.content('summary')#">
	</cfif>
</cfsilent>

<cfoutput>
 <header>
	<div class="container">
	<nav aria-label="breadcrumb">#$.dspCrumbListLinks(class="")#</nav>
	<h1><div id="mura-editable-attribute-title" class="mura-editable-attribute inline" data-type="text" data-attribute="title">#esapiEncode('html',objectparams.title)#</div></h1>
	<div class="summary" id="mura-editable-attribute-summary" data-type="text" class="mura-editable-attribute inline" data-attribute="summary">#objectparams.summary#</div>
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
		<li class="list-inline-item release-date">
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
		<li class="list-inline-item comments">
			<i class="fa fa-comments" aria-hidden="true"></i> #commentCount# Comment<cfif commentCount gt 1>s</cfif>
		</li>
	</cfif>
<!--- /Comments --->
	</ul>


<!--- Categories --->
	<ul class="list-inline">
		<cfif itCategories.hasNext()>
				<cfloop condition="itCategories.hasNext()">
					<cfset categoryItem = itCategories.next()>
				<li class="list-inline-item badge badge-dark category">
<!--- 					<i class="fa fa-folder-open" aria-hidden="true"></i> --->
						#HTMLEditFormat(categoryItem.getName())#
				</li>
				</cfloop>
		</cfif>
<!--- 	</ul> --->
<!--- /Categories --->

<!--- Tags --->
<!--- 	<ul class="tags list-inline"> --->
		<cfif ListLen($.content().getTags())>
			
				<cfloop from="1" to="#ListLen($.content().getTags())#" index="t">
			<li class="list-inline-item badge badge-light tag">
<!--- 				<i class="fa fa-tags" aria-hidden="true"></i> --->
				#esapiEncode('html', trim(ListGetAt($.content().getTags(), t)))#<!--- <cfif t neq ListLen($.content().getTags())>, </cfif> --->
			</li>
			</cfloop>
		</cfif>
	</ul>
<!--- /Tags --->
	</cfif>
	</div>
</header>
</cfoutput>
