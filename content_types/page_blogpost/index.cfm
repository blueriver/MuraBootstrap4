<cfoutput>
    <!--- Primary Associated Image --->
    <cfif $.content().hasImage(usePlaceholder=false)>
        <cfscript>
            img = $.content().getImageURL(
                size = 'carouselimage' // small, medium, large, custom, or any other pre-defined image size
                ,complete = false // set to true to include the entire URL, not just the absolute path (default)
            );
        </cfscript>
        <div class="container-fluid px-0 page-header-image" style="background-image:url(#img#);"></div>
    </cfif>
    <!--- /Primary Associated Image --->
    <!--- Breadcrumbs --->
    <div class="container">
        <div class="row">
            <div class="col py-3">
                <nav aria-label="breadcrumb">#Mura.dspCrumbListLinks(class="text-center")#</nav>
            </div>
        </div>
    </div>
    <!--- /Breadcrumbs --->

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-9 col-xl-8">
                #m.dspObject(
                    object="header",
                    objectParams=urlDecode(m.content('headerParams')),
                    targetattr='headerParams'
                )#
                #m.renderEditableAttribute(attribute="body",type="htmlEditor")#
            </div>
        </div>
    </div>
</cfoutput>
