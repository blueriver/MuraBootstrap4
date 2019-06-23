<cfoutput>
	<div class="jumbotron mb-3 text-center" style="background-image: url(#m.content().getImageURL(size='carouselimage')#); background-size: cover; background-repeat: no-repeat; background-attachment: scroll;">
		<h1 class="display-4" style="padding: 15px; display: inline-block; text-transform: uppercase; background-color: rgba(0, 0, 0, 0.52); color: white;">#m.renderEditableAttribute(attribute='title')#</h1>
	</div>
	<div class="container">
		#m.renderEditableAttribute(attribute="body",type="htmlEditor")#

		#$.dspObject(
			object="calendar",
			params=objectParams
		)#
	</cfoutput>
	</div>
</cfoutput>
