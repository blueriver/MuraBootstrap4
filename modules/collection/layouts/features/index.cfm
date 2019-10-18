<cfsilent>		
	<cfparam name="objectParams.gridstyle" default="mura-grid-two">
	<cfparam name="objectParams.imageSize" default="medium">
	<cfparam name="objectParams.imageHeight" default="AUTO">
	<cfparam name="objectParams.imageWidth" default="AUTO">
	<cfparam name="objectParams.modalimages" default="false">
	<cfparam name="objectParams.bgStyle" default="">

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
  <div class="card card-row shadow rounded-lg mb-4">
      <div class="row no-gutters align-items-center">
          <div class="col-12 col-md-6 col-lg-5<cfif iterator.getCurrentIndex() MOD 2> order-md-2</cfif> card-img-right">

            <!-- Image (placeholder) -->
            <img src="#item.getImageURL(argumentCollection=imageSizeArgs)#" alt="#item.getTitle()#" class="img-fluid w-100">

          </div>
          <div class="col-12 col-md-6 col-lg-7 order-md-1">

            <!-- Body -->
            <div class="card-body">

                #m.dspObject_include(
                    theFile='collection/includes/dsp_meta_list.cfm',
                    item=item,
                    fields=objectParams.displaylist
                )#
            </div>

          </div>

      </div> <!-- / .row -->
</div>
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