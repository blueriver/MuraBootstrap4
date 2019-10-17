<cfoutput>
<div class="pt-3 py-5 bg-dark">
    <div class="container">
        <cfif m.getBean('content').loadBy(title="Footer",type="Component").exists()>
    		#Mura.dspObject(object='component',objectid="Footer")#
    	<cfelse>
    		<p class="alert alert-info">A component named 'Footer' is currently missing from your site.</p>
    	</cfif>
    </div>
<div>

</cfoutput>
