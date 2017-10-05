<cfoutput>
<!DOCTYPE html>
<html lang="en"<cfif $.hasFETools()> class="mura-edit-mode"</cfif>>
	<cfinclude template="inc/html_head.cfm" />
	<body id="#$.getTopID()#" class="#$.createCSSHook($.content('menuTitle'))#" data-spy="scroll" data-target=".subnav" data-offset="50">
		<cfinclude template="inc/navbar.cfm" />

		<!---
			The Carousel/Slideshow
			Refer to the theme's contentRenderer.cfc for details on this method and its arguments/options
			NOTES:
				* This theme is designed for Mura 7.0+
				* Only content items with an 'Associated Image' will be rendered
				* You can control the crop of the carousel image by using the
				  custom defined 'carouselimage' image size // 'carouselimage'
		--->
		#$.dspCarouselByFeedName(
			feedName='Slideshow'
			, showCaption=true
			, cssID='myCarousel'
			, size='carouselimage'
			, interval=5000
			, autoStart=true
		)#

		<div class="py-5">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="card text-center">
							<div class="card-body">

								<i class="fa fa-laptop fa-5x text-primary"></i>

								<h2 class="mt-2 mb-3">Responsive Design</h2>

								<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
							</div>
						</div>
					</div>

					<div class="col-md-4">

						<div class="card text-center">
							<div class="card-body">

								<i class="fa fa-pencil fa-5x text-primary"></i>

								<h2 class="mt-2 mb-3">Creative Ideas</h2>

								<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
							</div>
						</div>

					</div>

					<div class="col-md-4">

						<div class="card text-center">
							<div class="card-body">

								<i class="fa fa-code fa-5x text-primary"></i>

								<h2 class="mt-2 mb-3">Bootstrap4</h2>

								<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

		<div class="jumbotron jumbotron-fluid text-center mb-0 bg-secondary text-light">
			<div class="container">
				<h2>Mura CMS is Feature-Rich, but Easy to Use</h2>
				<h3>Build ambitious websites easier &amp; faster.</h3>
			</div>
		</div>


		<div class="template pb-5">

			<div class="container">
				<section class="py-5">
					<!---
							The Content
							See the file located under '/display_objects/page_default/index.cfm' to override body styling
					--->
					#$.dspBody(
						body=$.content('body')
						, pageTitle=''
						, crumbList=false
						, showMetaImage=false
					)#

					#$.dspObjects(2)#

				</section>
			</div><!-- /.container -->

		</div>

		<cfinclude template="inc/footer.cfm" />
		<cfinclude template="inc/html_foot.cfm" />
	</body>
</html>
</cfoutput>
