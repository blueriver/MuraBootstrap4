<cfoutput>
    <div class="container-fluid">
        <!--- Primary Associated Image --->
        <cfif $.content().hasImage(usePlaceholder=false)>
            <cfscript>
                img = $.content().getImageURL(
                    size = 'carouselimage' // small, medium, large, custom, or any other pre-defined image size
                    ,complete = false // set to true to include the entire URL, not just the absolute path (default)
                );
            </cfscript>
            <div class="mura-asset mb-4">
                <img class="mura-meta-image img-fluid" src="#img#" alt="#esapiEncode('html_attr', $.content('title'))#">
            </div>
        </cfif>
        <!--- /Primary Associated Image --->
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-9 col-xl-8">
                #m.dspObject(
                    object="header",
                    objectParams=urlDecode(m.content('headerParams')),
                    targetattr='headerParams'
                )#
            </div>
        </div>
    </div>
    <div class="container">
	    #m.renderEditableAttribute(attribute="body",type="htmlEditor")#
	</div> 
</cfoutput>
