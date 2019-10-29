<cfoutput>
	#Mura.dspObject(
		object="header",
		objectParams=urlDecode(Mura.content('headerParams')),
		targetattr='headerParams'
	)#
	#Mura.dspObjects(2)#<!---Pre-Content Display Region--->
	<div class="container mt-3">
	#Mura.renderEditableAttribute(attribute="body",type="htmlEditor")#
	#Mura.dspObject(
		object="calendar",
		params=objectParams
	)#
	</div>
	#Mura.dspObjects(3)#<!---Pre-Footer Display Region--->
</cfoutput>
