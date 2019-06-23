<cfoutput>
<!DOCTYPE html>
<html lang="en"<cfif $.hasFETools()> class="mura-edit-mode"</cfif>>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="depth-#$.content('depth')# #$.createCSSHook($.content('menuTitle'))#">
		<cfinclude template="inc/navbar.cfm" />
		<cfset pageTitle = $.content('type') neq 'Page' ? $.content('title') : ''>
		<div class="container">
			#$.dspBody(
				body=$.content('body')
				, pageTitle=pageTitle
				, crumbList=false
				, showMetaImage=false
			)#
		</div>
		<cfinclude template="inc/footer.cfm" />
		<cfinclude template="inc/html_foot.cfm" />
	</body>
</html>
</cfoutput>
