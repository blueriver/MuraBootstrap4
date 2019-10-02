
<cfsilent>
    <cfparam name="objectparams.title" default="#$.content('title')#">
    <cfparam name="objectparams.summary" default="#$.content('summary')#">
</cfsilent>

<cf_objectconfigurator params="#objectparams#">
	<cfoutput>
	<div class="mura-control-group">
        <label>
            Title
        </label>
        <input name="title" class="objectParam" type="text" value="#esapiEncode('html_attr',$.content('title'))#" maxlength="255">
        <div class="mura-control-group"><label>Edit Summary</label>
        <button type="button" class="btn mura-html" data-target="summary" data-label="Edit HTML">Edit Summary</button>
        <input type="hidden" class="objectParam" name="summary" value="#esapiEncode('html_attr',$.content('summary'))#">
    </div>
	</cfoutput>
</cf_objectconfigurator>

