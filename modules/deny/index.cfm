<cfoutput>
	<div class="jumbotron text-center mb-0" style="background-image: url(#m.content().getImageURL(size='carouselimage')#); background-size: cover; background-repeat: no-repeat; background-attachment: scroll;">
		<h1 class="display-4" style="padding: 15px; display: inline-block; text-transform: uppercase; background-color: rgba(0, 0, 0, 0.52); color: white;">#variables.$.rbKey('sitemanager.restricted')#</cfif></h1>
	</div>
	<div class="container mt-3">
		<p>#variables.$.rbKey('sitemanager.restrictedinstructions')#</p>
	</div>
</cfoutput>
