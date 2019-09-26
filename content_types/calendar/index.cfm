<cfoutput>
	#m.dspObject(
		object="header",
		objectParams=m.content('headerParams'),
		targetattr='headerParams'
	)#
	<div class="container mt-3">
	#m.renderEditableAttribute(attribute="body",type="htmlEditor")#
	#m.dspObject(
		object="calendar",
		params=objectParams
	)#
	</div>
</cfoutput>
