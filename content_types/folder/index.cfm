<cfoutput>

	<div class="container mt-3">
		#m.renderEditableAttribute(attribute="body",type="htmlEditor")#
		#m.dspObject(
			object="folder",
			params=objectParams
		)#
	</div>
</cfoutput>
