<mura>

	<imagesizes>
		<imagesize name="Small" width="200" height="200" />
		<imagesize name="Medium" width="400" height="400" />
		<imagesize name="Large" width="1600" height="AUTO" />
		<imagesize name="Landscape" width="1200" height="800" />
		<imagesize name="Square" width="1200" height="1200" />
		<imagesize name="Portrait" width="800" height="1200" />
		<imagesize name="Carousel-Image" width="1600" height="900" />
	</imagesizes>

	<extensions>
		<extension adminonly="0" availablesubtypes="" basekeyfield="contentHistID" basetable="tcontent" datatable="tclassextenddata" description="" hasassocfile="1" hasbody="1" hasconfigurator="0" hassummary="1" iconclass="" subtype="Default" type="Base">
			<attributeset categoryid="" container="Custom" name="Layout" orderno="1">
				<attribute adminonly="0" defaultvalue="" hint="" label="headerParams" message="" name="headerParams" optionlabellist="" optionlist="" orderno="1" regex="" required="false" type="TextBox" validation=""/>
			</attributeset>
		</extension>
		<extension adminonly="0" availablesubtypes="" basekeyfield="contentHistID" basetable="tcontent" datatable="tclassextenddata" description="" hasassocfile="1" hasbody="0" hasconfigurator="1" hassummary="1" iconclass="mi-folder-open-o" subtype="Default" type="Folder"/>
		<extension adminonly="0" availablesubtypes="" basekeyfield="contentHistID" basetable="tcontent" datatable="tclassextenddata" description="This changes the background color style on cards." hasassocfile="1" hasbody="1" hasconfigurator="0" hassummary="1" iconclass="mi-sticky-note" subtype="Default" type="Link">
			<attributeset categoryid="" container="Default" name="Card Background Style" orderno="1">
				<attribute adminonly="0" defaultvalue="Select" hint="This will apply Bootstrap classes to the Card to change it's background styles" label="Card Background Style" message="" name="CardBackgroundStyle" optionlabellist="Select^Primary^Secondary^Success^Danger^Warning^Info^Dark" optionlist="Select^text-white bg-primary^text-white bg-secondary^text-white bg-success^text-white bg-danger^text-white bg-warning^text-white bg-info^text-white bg-dark" orderno="1" regex="" required="false" type="SelectBox" validation=""/>
			</attributeset>
		</extension>
		<extension adminonly="0" availablesubtypes="" basekeyfield="contentHistID" basetable="tcontent" datatable="tclassextenddata" description="" hasassocfile="1" hasbody="1" hasconfigurator="0" hassummary="1" iconclass="mi-indent" subtype="Article" type="Page"/>
		<extension adminonly="0" availablesubtypes="" basekeyfield="contentHistID" basetable="tcontent" datatable="tclassextenddata" description="" hasassocfile="1" hasbody="1" hasconfigurator="0" hassummary="1" iconclass="" subtype="Blog Post" type="Page"/>
		<extension adminonly="0" availablesubtypes="" basekeyfield="contentHistID" basetable="tcontent" datatable="tclassextenddata" description="" hasassocfile="1" hasbody="0" hasconfigurator="0" hassummary="1" iconclass="mi-th" subtype="Default" type="Page"/>
		<extension adminonly="0" availablesubtypes="" basekeyfield="contentHistID" basetable="tcontent" datatable="tclassextenddata" description="" hasassocfile="1" hasbody="0" hasconfigurator="0" hassummary="1" iconclass="mi-desktop" subtype="Webinar" type="Page">
			<attributeset categoryid="" container="Default" name="Confirmation" orderno="1">
				<attribute adminonly="0" defaultvalue="" hint="" label="Confirmation URL" message="" name="confirmationurl" optionlabellist="" optionlist="" orderno="1" regex="" required="false" type="TextBox" validation=""/>
			</attributeset>
		</extension>
		<extension adminonly="0" availablesubtypes="" basekeyfield="contentHistID" basetable="tcontent" datatable="tclassextenddata" description="" hasassocfile="1" hasbody="0" hasconfigurator="0" hassummary="1" iconclass="mi-file-pdf-o" subtype="White Paper" type="Page">
			<attributeset categoryid="" container="Default" name="Confirmation" orderno="1">
				<attribute adminonly="0" defaultvalue="" hint="" label="Confirmation URL" message="" name="confirmationurl" optionlabellist="" optionlist="" orderno="1" regex="" required="false" type="TextBox" validation=""/>
			</attributeset>
		</extension>
	</extensions>
</mura>