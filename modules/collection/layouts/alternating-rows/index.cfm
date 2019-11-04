<cfoutput>
<div class="mura-collection">    
<cfloop condition="iterator.hasNext()">
	<cfsilent>
		<cfset item=iterator.next()>
	</cfsilent>
  <div class="card card-row shadow rounded-lg mb-4">
      <div class="row no-gutters align-items-stretch">
          <div class="col-12 col-md-6 col-lg-5<cfif iterator.getCurrentIndex() MOD 2> order-md-2 card-img-right<cfelse> card-img-left</cfif>">
            <a href="#item.getUrl()#" target="#item.getTarget()#">
              <img src="#item.getImageURL(size='landscape')#" alt="#item.getTitle()#" class="">
            </a>
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