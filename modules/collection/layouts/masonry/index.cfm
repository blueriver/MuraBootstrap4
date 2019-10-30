<cfsilent>		
	<cfparam name="objectParams.columnCount" default="5">
	<cfparam name="objectParams.columnWidth" default="240">
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
<div class="mura-collection card-columns" style="column-count: #esapiEncode('html_attr',objectParams.columnCount)#; column-width:#esapiEncode('html_attr',objectParams.columnWidth)#px;">
	<cfloop condition="iterator.hasNext()">
	<cfsilent>
		<cfset item=iterator.next()>
	</cfsilent>
	<div class="mura-collection-item">

		<div class="mura-collection-item__holder #objectParams.bgStyle# card mb-4"> <!--- #item.getValue('CardBackgroundStyle')# --->
			<cfif listFindNoCase(objectParams.displaylist,'Image')>
			<div class="mura-item-content">
				<cfif item.hasImage()>
					<cfif objectparams.modalimages>
						<a href="#item.getImageURL(size='large')#" title="#esapiEncode('html_attr',item.getValue('title'))#" data-rel="shadowbox[gallery]" class="#this.contentListItemImageLinkClass#"><img class="card-img-top" src="#item.getImageURL(argumentCollection=imageSizeArgs)#" alt="#esapiEncode('html_attr',item.getValue('title'))#"></a>
					<cfelse>
						<a href="#item.getURL()#"><img class="card-img-top" src="#item.getImageURL(argumentCollection=imageSizeArgs)#" alt="#esapiEncode('html_attr',item.getValue('title'))#"></a>
					</cfif>
				</cfif>
			</div>
			</cfif>
			<div class="card-body">
				#m.dspObject_include(
					theFile='collection/includes/dsp_meta_list.cfm',
					item=item,
					fields=objectParams.displaylist
				)#
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
