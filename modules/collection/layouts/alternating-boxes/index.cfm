<cfsilent>
	<cfparam name="objectParams.imageSize" default="medium">
	<cfparam name="objectParams.imageHeight" default="AUTO">
	<cfparam name="objectParams.imageWidth" default="AUTO">
	<cfparam name="objectParams.modalimages" default="false">

	<cfset imageSizeArgs={
		size=objectParams.imageSize,
		height=objectParams.imageHeight,
		width=objectParams.imageWidth
	}>
</cfsilent>

<cfoutput>
  <div class="mura-collection">    
  <cfloop condition="iterator.hasNext()">
      <cfsilent>
          <cfset item=iterator.next()>
      </cfsilent>
    <div class="card card-row border-0" id="#Mura.createCSSHook(item.get('menuTitle'))#">
        <div class="row no-gutters align-items-stretch">
            <div class="col-12 col-md-6<cfif iterator.getCurrentIndex() MOD 2> card-img-left<cfelse> card-img-right order-md-2</cfif>">
                <cfif objectparams.modalimages>
                    <a href="#item.getImageURL(size='large')#" title="#esapiEncode('html_attr',item.getValue('title'))#" data-rel="shadowbox[gallery]" class="#this.contentListItemImageLinkClass#"><img class="" src="#item.getImageURL(argumentCollection=imageSizeArgs)#" alt="#esapiEncode('html_attr',item.getValue('title'))#"></a>
                <cfelse>
                    <img src="#item.getImageURL(argumentCollection=imageSizeArgs)#" alt="#esapiEncode('html_attr',item.getValue('title'))#" class="">
                </cfif>
            </div>
            <div class="col-12 col-md-6 p-0">
              <!-- Body -->
              <div class="card-body spacing-normal">
                  #m.dspObject_include(
                      theFile='collection/includes/dsp_meta_list.cfm',
                      item=item,
                      fields=objectParams.displaylist
                  )#
              </div>
            </div>
        </div> <!-- / .row -->
  </div><!-- / .card -->
  </cfloop>
  </div>
    #m.dspObject_include(
      theFile='collection/includes/dsp_pagination.cfm',
      iterator=iterator,
      nextN=iterator.getNextN(),
      source=objectParams.source
  )#
  
  <cfif len(objectParams.viewalllink)>
      <a class="view-all" href="#objectParams.viewalllink#">#HTMLEditFormat(objectParams.viewalllabel)#</a>
  </cfif>
  
</cfoutput>