<cfoutput>
	#m.dspObject(
		object="header",
		objectParams=urlDecode(m.content('headerParams')),
		targetattr='headerParams'
	)#
    <div class="container mt-3">
    <!--- Primary Associated Image --->
        <cfif $.content().hasImage(usePlaceholder=false)>
            <cfscript>
                img = $.content().getImageURL(
                    size = 'carouselimage' // small, medium, large, custom, or any other pre-defined image size
                    ,complete = false // set to true to include the entire URL, not just the absolute path (default)
                );
            </cfscript>
            <div class="mura-asset mb-4">
                <img class="mura-meta-image img-fluid rounded-lg shadow" src="#img#" alt="#esapiEncode('html_attr', $.content('title'))#">
            </div>
        </cfif>
    <!--- /Primary Associated Image --->
	#m.renderEditableAttribute(attribute="body",type="htmlEditor")#
	</div> 
</cfoutput>
