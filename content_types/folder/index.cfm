<cfoutput>
	#Mura.dspObject(
		object="header",
		objectParams=urlDecode(Mura.content('headerParams')),
		targetattr='headerParams'
	)#
	#Mura.dspObjects(2)#<!---Pre-Content Display Region--->
	<div class="container mt-3">
	#m.dspObject(
		object="folder",
		params=objectParams
	)#
	</div>
	#Mura.dspObjects(3)#<!---Pre-Footer Display Region--->
</cfoutput>
