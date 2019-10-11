<cfoutput>
<header class="sticky-top">
	<nav class="navbar navbar-expand-lg bg-light navbar-light navbar-static-top py-4">
		<div class="container">
			
			<a class="navbar-brand" title="#esapiEncode('html_attr', $.siteConfig('site'))#" href="#$.createHREF(filename='')#">#$.siteConfig('site'))#</a>

			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##siteNavbar" aria-controls="siteNavbar" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="navbar-collapse collapse" id="siteNavbar">

				<cf_CacheOMatic key="dspPrimaryNav">
					<!---
						For information on dspPrimaryNav(), visit:
						http://docs.getmura.com/v6/front-end/template-variables/document-body/
					--->
					#$.dspPrimaryNav(
						viewDepth=3
						, id='navPrimary'
						, class='navbar-nav mr-auto'
						, displayHome='always'
						, closeFolders=true
						, showCurrentChildrenOnly=false
						, liClass='nav-item'
						, liHasKidsClass='dropdown'
						, liHasKidsAttributes=''
						, liCurrentClass=''
						, liCurrentAttributes=''
						, liHasKidsNestedClass=''
						, aHasKidsClass='dropdown-toggle'
						, aHasKidsAttributes=''
						, aCurrentClass='nav-link active'
						, aCurrentAttributes=''
						, ulNestedClass='dropdown-menu'
						, ulNestedAttributes=''
						, aNotCurrentClass='nav-link'
						, siteid=$.event('siteid')
					)#
				</cf_CacheOMatic>
				<script>
					Mura(function(){
						#serializeJSON($.getCurrentURLArray())#.forEach(
							function(value){
								navItem=Mura("##navPrimary [href='" + value + "']");
								if(navItem.length){
									var navItem=Mura("##navPrimary [href='" + value + "']").closest("li");
									if(navItem.length){
										navItem.addClass("active");
									}
								}
							}
						);
					})
				</script>

				<form method="post" id="searchForm" class="form-inline" role="search" action="#m.createHREF(filename='search-results')#">
					<div class="input-group">
						<input type="text" name="Keywords" id="navKeywords" class="form-control" value="#esapiEncode('html', $.event('keywords'))#" placeholder="#$.rbKey('search.search')#" aria-label="Search">
						<span class="input-group-btn">
							<button type="submit" class="btn btn-secondary">
								<i class="fa fa-search" aria-hidden="true"></i>
								<span class="sr-only">Search</span>
							</button>
						</span>
					</div>
					<input type="hidden" name="display" value="search">
					<input type="hidden" name="newSearch" value="true">
					<input type="hidden" name="noCache" value="1">
					#variables.$.renderCSRFTokens(format='form',context='search')#
				</form>

			</div><!--- /.navbar-collapse --->
		</div><!--- /.container --->
	</nav><!--- /nav --->
</header>
</cfoutput>
