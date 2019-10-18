<cfoutput>
    <!--- Primary Associated Image --->
    <cfif Mura.content().hasImage(usePlaceholder=true)>
        <cfscript>
            img = Mura.content().getImageURL(
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

    <div class="container page-blog-header">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-9 col-xl-8">
                #m.dspObject(
                    object="header",
                    objectParams=urlDecode(Mura.content('headerParams')),
                    targetattr='headerParams'
                )#
                #m.renderEditableAttribute(attribute="body",type="htmlEditor")#
            </div>
        </div>
    </div>
    <div class="bg-light py-5">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h2 class="text-center mb-4">Recent Blogs</h2>
                    <cfscript>
                        recentBlogs = Mura.getBean('feed')
                                          .where()
                                          .prop('parentid').isEQ(Mura.content('parentid'))
                                          .sort('releasedate','desc')
                                          .maxItems(3)
                                          .getQuery();
                    </cfscript>
                    <cfif recentBlogs.getRecordCount()>
                        <cfset blogList=valuelist(recentBlogs.contentid)>
                        <cfsilent>
                            <cfset objectParams.sourcetype='relatedcontent'>
                            <cfset objectparams.source='custom'>
                            <cfset objectparams.items="#blogList#">
                            <cfset objectparams.layout="cards">
                            <cfset objectparams.imageSize="3up-images">
                            <cfset objectparams.maxitems="3">
                            <cfset objectparams.nextn="3">
                            <cfset objectParams.gridStyle="mura-grid-three">
                            <cfset objectparams.forcelayout=true>
                        </cfsilent>
                        #$.dspObject_include(
                            thefile="collection/index.cfm",
                            params=objectparams
                        )#
                    </cfif>
                </div>
            </div>
        </div>
    </div>
</cfoutput>
