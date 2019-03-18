<cfoutput>
	<!--- Bootstrap JavaScript --->
	<script src="#$.siteConfig('themeAssetPath')#/assets/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!--- Theme JavaScript --->
	<!--- <script src="#$.siteConfig('themeAssetPath')#/js/theme/theme.js"></script> --->
</cfoutput>

<script>
	Mura(()=>{
		 Mura(document).on('submit','form',
		 function(e){
			 console.log(e)
		 }
	 )
	})
</script>
