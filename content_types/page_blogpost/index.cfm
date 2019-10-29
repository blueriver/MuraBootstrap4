<cfoutput>
    #m.dspObject(
        object="header",
        objectParams=urlDecode(Mura.content('headerParams')),
        targetattr='headerParams'
    )#
    #$.dspObjects(2)#<!---Pre-Content Display Region--->
    <div class="container my-3">
        <div class="row justify-content-center">
            <div class="col-12 col-md-10 col-lg-9 col-xl-8">
                #m.renderEditableAttribute(attribute="body",type="htmlEditor")#
            </div>
        </div>
    </div>
    #$.dspObjects(3)#<!---Pre-Footer Display Region--->
</cfoutput>
