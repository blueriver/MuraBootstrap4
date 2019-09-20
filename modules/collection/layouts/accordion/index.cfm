<cfsilent>		
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
		<div class="mura-collection-item">

			<div class="mura-collection-item__holder">
				
				<div class="accordion" id="rapidsAccordion">
					<div class="card ">
						<div class="card-header" id="##content-#item.getContentID()#">
						    <h2 class="mb-0">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="##content-#item.getContentID()#" aria-expanded="true" aria-controls="content-#item.getContentID()#">#item.getTitle()#</button>
							</h2>
						</div>
						
						<div id="content-#item.getContentID()#" class="collapse show" aria-labelledby="##content-#item.getContentID()#" data-parent="##rapidsAccordion">
							<div class="card-body #item.getValue('CardBackgroundStyle')#"> <!--- #objectParams.bgStyle# --->
								<cfif listFindNoCase(objectParams.displaylist,'Image')>
									<div class="mura-item-content">
										<cfif item.hasImage()>
											<cfif objectparams.modalimages>
												<a href="#item.getImageURL(size='small')#" title="#esapiEncode('html_attr',item.getValue('title'))#" data-rel="shadowbox[gallery]" class="#this.contentListItemImageLinkClass#"><img class="mb-4" src="#item.getImageURL(argumentCollection=imageSizeArgs)#" alt="#esapiEncode('html_attr',item.getValue('title'))#"></a>
											<cfelse>
												<a href="#item.getURL()#"><img class="mb-4" src="#item.getImageURL(argumentCollection=imageSizeArgs)#" alt="#esapiEncode('html_attr',item.getValue('title'))#"></a>
											</cfif>
										</cfif>
									</div>
								</cfif>
								
								#m.dspObject_include(
									theFile='collection/includes/dsp_meta_list.cfm',
									item=item,
									fields=objectParams.displaylist
								)#
							</div>
						</div>
					</div>
				</div>
				
			</div>
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
