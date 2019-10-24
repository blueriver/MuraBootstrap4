<cfoutput>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="#esapiEncode('html_attr', Mura.content('metaDesc'))#">
	<meta name="keywords" content="#esapiEncode('html_attr', Mura.content('metaKeywords'))#">
	<cfif len(Mura.content('credits'))><meta name="author" content="#esapiEncode('html_attr', Mura.content('credits'))#"></cfif>
	<cfif YesNoFormat(Mura.content('searchExclude'))><meta name="robots" content="noindex"></cfif>
	<meta name="generator" content="Mura CMS #Mura.globalConfig('version')#">

	<title>#esapiEncode('html', Mura.content('HTMLTitle'))# - #esapiEncode('html', Mura.siteConfig('site'))#</title>

	<!--- Mura CMS Base Styles--->
	<!--- Optional: Mura CMS Skin Styles. Duplicate to your theme to customize, changing 'assetPath' to 'themeAssetPath' below. Don't forget to move, remove or replace sprite.png. --->
	#Mura.outputMuraCSS(version="8", includeskin=true)#

	<!--- Bootstrap core CSS --->
<!--- 	<link rel="stylesheet" href="#Mura.siteConfig('themeAssetPath')#/css/bootstrap.css"> --->

	<!--- Font Awesome --->
	<link rel="stylesheet" href="#Mura.siteConfig('themeAssetPath')#/assets/font-awesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="#Mura.siteConfig('themeAssetPath')#/assets/font-awesome/css/brands.min.css">
	<link rel="stylesheet" href="#Mura.siteConfig('themeAssetPath')#/assets/font-awesome/css/solid.min.css">

	<!-- Nucleo Icons -->
	<link rel="stylesheet" href="#Mura.siteConfig('themeAssetPath')#/assets/nucleo/css/style.css">

	<!--- Theme CSS --->
	<link rel="stylesheet" href="#Mura.siteConfig('themeAssetPath')#/css/site.css">

	<!--- jQuery --->
	<script src="#Mura.siteConfig('themeAssetPath')#/js/libraries/jquery-3.3.1.min.js"></script>

	<!--- FAV AND TOUCH ICONS --->
	<link rel="shortcut icon" href="#Mura.globalConfig('corePath')#/modules/v1/core_assets/images/favicon.ico">
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="#Mura.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="#Mura.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="#Mura.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="#Mura.siteConfig('themeAssetPath')#/images/ico/ico/apple-touch-icon-57-precomposed.png">

	<!--- MURA FEEDS --->
	<cfset rs=Mura.getBean('feedManager').getFeeds(Mura.event('siteID'),'Local',true,true) />
	<cfset apiEndpoint=Mura.siteConfig().getApi('feed','v1').getEndpoint() />
	<cfloop query="rs"><link rel="alternate" type="application/rss+xml" title="#esapiEncode('html_attr', Mura.siteConfig('site'))# - #esapiEncode('html_attr', rs.name)#" href="#XMLFormat('#apiEndpoint#/?feedID=#rs.feedID#')#"></cfloop>

	<style>
     .module-lite {
			 background:white;
			 color: black;
		 }

		 .module-lite h1,
		 	.module-lite h2,
			.module-lite h3,
			.module-lite h4,
			.module-lite h5,
			.module-lite h6,
			.module-lite h1,
			.module-lite h2,
			.module-lite h3,
			.module-lite h4,
			.module-lite h5,
			.module-lite a:link,
			.module-lite a:visited,
			.module-lite a:hover,
			.module-lite a:active {
				color: black;
			}

		 .module-dark {
			 background:black;
			 color: white;
		 }

		 .module-dark h1,
		 	.module-dark h2,
			.module-dark h3,
			.module-dark h4,
			.module-dark h5,
			.module-dark h6,
			.module-dark h1,
			.module-dark h2,
			.module-dark h3,
			.module-dark h4,
			.module-dark h5,
			.module-dark a:link,
			.module-dark a:visited,
			.module-dark a:hover,
			.module-dark a:active {
				color: white;
			}
			
		[data-objectspacing="tight"],
		[data-objectspacing="loose"],
		[data-metaspacing="tight"],
		[data-metaspacing="loose"],
		[data-contentspacing="tight"],
		[data-contentspacing="loose"] {
			padding: 1rem;
		}

		@media (min-width: 768px) {
			[data-objectspacing="tight"],
			[data-metaspacing="tight"],
			[data-contentspacing="tight"] {
				padding: 1rem;
			}

			[data-objectspacing="loose"],
			[data-metaspacing="loose"],
			[data-contentspacing="loose"] {
				padding: 2rem;
			}
		}

		@media (min-width: 992px) {
			[data-objectspacing="loose"],
			[data-metaspacing="loose"],
			[data-contentspacing="loose"]{
				padding: 3rem;
			}
		}

	</style>
</head>
</cfoutput>
