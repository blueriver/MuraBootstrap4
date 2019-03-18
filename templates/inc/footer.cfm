<cfoutput>
	<cfif m.getBean('content').loadBy(title="Footer",type="Component").exists()>
		#$.dspObject(object='component',objectid="Footer")#
	<cfelse>
		<p class="alert alert-info">A component named 'Footer' is currently missing from your site.</p>
	</cfif>
</cfoutput>
