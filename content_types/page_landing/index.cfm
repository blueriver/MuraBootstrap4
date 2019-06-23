<cfoutput>
	<div class="jumbotron mb-0 text-center"  style="background-image: url(#m.content().getImageURL(size='carouselimage')#); background-size: cover; background-repeat: no-repeat; background-attachment: fixed;">
		<h1 class="display-4" style="padding: 15px; display: inline-block; text-transform: uppercase; background-color: rgba(0, 0, 0, 0.52); color: white;">#m.renderEditableAttribute(attribute='title')#</h1>
	</div>
	#m.dspObjects(2)#
</cfoutput>
