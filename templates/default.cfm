<cfoutput>
<!DOCTYPE html>
<html lang="en"<cfif $.hasFETools()> class="mura-edit-mode"</cfif>>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>
		<cfset regionMarkup=m.dspObjects(1)>
    <cfif request.muraRegionObjectCounts.region1>
      <div class="header-aux-content">
        #regionMarkup#
      </div>
    <cfelse>
      <cfset request.muraActiveRegions=listDeleteAt(request.muraActiveRegions,listLen(request.muraActiveRegions))>
	  </cfif>
		#request.muraActiveRegions#
		<div class="container">
			#$.dspBody(
				body=$.content('body')
				, pageTitle=pageTitle
				, crumbList=false
				, showMetaImage=false
			)#
			#$.dspObjects(2)#
		</div>
		<cfinclude template="inc/footer.cfm" />
		<cfinclude template="inc/html_foot.cfm" />
	</body>
</html>
</cfoutput>
