<cfoutput>
	#m.dspThemeInclude("templates/inc/header.cfm")#
	<div class="container mt-3">
		#m.renderEditableAttribute(attribute="body",type="htmlEditor")#

		#m.dspObject(
			object="calendar",
			params=objectParams
		)#
	</cfoutput>
	</div>
</cfoutput>
