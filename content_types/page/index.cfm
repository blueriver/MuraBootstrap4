<cfoutput>
	#m.dspThemeInclude("templates/inc/header.cfm")#
	<div class="container mt-3">
		<nav class="">#m.dspCrumbListLinks(class="")#</nav>
		<h2>#m.renderEditableAttribute(attribute='title')#</h2>
		#m.renderEditableAttribute(attribute="body",type="htmlEditor")#
	</div>
</cfoutput>
