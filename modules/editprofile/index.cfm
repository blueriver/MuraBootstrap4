
<cfsilent>
	<cfif not isdefined('request.userBean')>
		<cfset request.userBean=application.userManager.read(session.mura.userID) />
	</cfif>
	<cfif request.userBean.exists() and request.userBean.getPasswordExpired()>
		<cfset request.userBean.getErrors().passwordExpired=variables.Mura.rbKey("layout.passwordexpirednotice")>
	</cfif>

	<cfparam name="msg" default="#variables.Mura.rbKey('user.message')#">
</cfsilent>
<cfoutput>
	<div class="jumbotron text-center mb-0" style="background-image: url(#m.content().getImageURL(size='hero')#); background-size: cover; background-repeat: no-repeat; background-attachment: scroll;">
		<h1 class="display-4" style="padding: 15px; display: inline-block; text-transform: uppercase; background-color: rgba(0, 0, 0, 0.52); color: white;"><cfif not session.mura.isLoggedIn>#variables.Mura.rbKey('user.createprofile')#<cfelse>#variables.Mura.rbKey('user.editprofile')#</cfif></h1>
	</div>

	<cfif not(structIsEmpty(request.userBean.getErrors()) and request.doaction eq 'createprofile')>
		<div id="svEditProfile" class="container mt-3 mura-edit-profile #this.editProfileWrapperClass#">

			<cfif not structIsEmpty(request.userBean.getErrors()) >
				<div class="#this.editProfileErrorMessageClass#">#variables.Mura.getBean('utility').displayErrors(request.userBean.getErrors())#</div>
			<cfelse>
				<div class="#this.editProfileInfoMessageClass#">#msg#</div>
			</cfif>

			<!--- EDIT PROFILE FORM --->
			<!--- <a id="editSubscriptions" href="##">Edit Email Subscriptions</a> --->
			<form role="form" name="profile" id="profile" class="#this.editProfileFormClass# <cfif this.generalWrapperClass neq "">#this.formWrapperClass#</cfif>" method="post" enctype="multipart/form-data" novalidate="novalidate">
				<fieldset>
					<legend>#variables.Mura.rbKey('user.contactinformation')#</legend>

					<!--- First Name --->
					<div class="req #this.editProfileFormGroupWrapperClass#">
						<label class="#this.editProfileFieldLabelClass#" for="firstName">
							#variables.Mura.rbKey('user.fname')#
							<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
						</label>
						<div class="#this.editProfileFormFieldsWrapperClass#">
							<input class="#this.editProfileFormFieldsClass#" type="text" id="firstName" name="fname" value="#HTMLEditFormat(request.userBean.getfname())#" data-required="true" data-message="#htmlEditFormat(variables.Mura.rbKey('user.fnamerequired'))#" maxlength="50" placeholder="#variables.Mura.rbKey('user.fname')#">
						</div>
					</div>

					<!--- Last Name --->
					<div class="req #this.editProfileFormGroupWrapperClass#">
						<label class="#this.editProfileFieldLabelClass#" for="lastName">
							#variables.Mura.rbKey('user.lname')#
							<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
						</label>
						<div class="#this.editProfileFormFieldsWrapperClass#">
							<input class="#this.editProfileFormFieldsClass#" type="text" id="lastName" name="lname" value="#HTMLEditFormat(request.userBean.getlname())#" data-required="true" data-message="#htmlEditFormat(variables.Mura.rbKey('user.lnamerequired'))#" maxlength="50" placeholder="#variables.Mura.rbKey('user.lname')#">
						</div>
					</div>

					<!--- Username --->
					<div class="req #this.editProfileFormGroupWrapperClass#">
						<label class="#this.editProfileFieldLabelClass#" for="usernametxt">
							#variables.Mura.rbKey('user.username')#
							<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
						</label>
						<div class="#this.editProfileFormFieldsWrapperClass#">
							<input class="#this.editProfileFormFieldsClass#" type="text" id="usernametxt" name="username" value="#HTMLEditFormat(request.userBean.getUserName())#" data-required="true" data-message="#htmlEditFormat(variables.Mura.rbKey('user.usernamerequired'))#" maxlength="50" placeholder="#variables.Mura.rbKey('user.username')#">
						</div>
					</div>

					<!--- Company / Organization --->
					<div class="#this.editProfileFormGroupWrapperClass#">
						<label class="#this.editProfileFieldLabelClass#" for="companytxt">#variables.Mura.rbKey('user.organization')#</label>
						<div class="#this.editProfileFormFieldsWrapperClass#">
							<input class="#this.editProfileFormFieldsClass#" type="text" id="companytxt" name="company" value="#HTMLEditFormat(request.userBean.getCompany())#" maxlength="50" placeholder="#variables.Mura.rbKey('user.organization')#">
						</div>
					</div>

					<!--- Email --->
					<div class="req #this.editProfileFormGroupWrapperClass#">
						<label class="#this.editProfileFieldLabelClass#" for="emailtxt">
							#variables.Mura.rbKey('user.email')#
							<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
						</label>
						<div class="#this.editProfileFormFieldsWrapperClass#">
							<input class="#this.editProfileFormFieldsClass#" type="text" id="emailtxt" name="email" value="#HTMLEditFormat(request.userBean.getEmail())#" maxlength="50" data-required="true" placeholder="#variables.Mura.rbKey('user.email')#" data-message="#HTMLEditFormat(variables.Mura.rbKey('user.emailvalidate'))#">
						</div>
					</div>

					<cfif not session.mura.isloggedin>
						<!--- Email2 (for NEW USER) --->
						<div class="req #this.editProfileFormGroupWrapperClass#">
							<label class="#this.editProfileFieldLabelClass#" for="email2xt">
								#variables.Mura.rbKey('user.emailconfirm')#
								<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
							</label>
							<div class="#this.editProfileFormFieldsWrapperClass#">
								<input class="#this.editProfileFormFieldsClass#" type="text" id="email2xt" name="email2" value="" maxlength="50" data-required="true" data-validate="match" matchfield="email" placeholder="#variables.Mura.rbKey('user.emailconfirm')#" data-message="#HTMLEditFormat(variables.Mura.rbKey('user.emailconfirmvalidate'))#" />
							</div>
						</div>
					</cfif>

					<!---
						Comment out the following two password fields to automatically create a random password
						for the user instead of letting them pick one themselves
					--->

					<cfif isBoolean(Mura.globalConfig('strongpasswords')) and Mura.globalConfig('strongpasswords')>
						<div class="#this.alertInfoClass#">#Mura.rbKey('user.passwordstrengthhelptext')#</div>
					</cfif>

					<!--- Password --->
					<div class="req #this.editProfileFormGroupWrapperClass#">
						<label class="#this.editProfileFieldLabelClass#" for="passwordtxt">
							#variables.Mura.rbKey('user.password')#
							<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
						</label>
						<div class="#this.editProfileFormFieldsWrapperClass#">
							<input class="#this.editProfileFormFieldsClass#" type="password" name="passwordNoCache" id="passwordtxt" data-validate="match" matchfield="password2" value=""  maxlength="50" <cfif not session.mura.isloggedin>data-required="true"</cfif> placeholder="#variables.Mura.rbKey('user.password')#" data-message="#HTMLEditFormat(variables.Mura.rbKey('user.passwordvalidate'))#" autocomplete="off"/>
						</div>
					</div>

					<!--- Password2 --->
					<div class="req #this.editProfileFormGroupWrapperClass#">
						<label class="#this.editProfileFieldLabelClass#" for="password2txt">
							#variables.Mura.rbKey('user.passwordconfirm')#
							<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
						</label>
						<div class="#this.editProfileFormFieldsWrapperClass#">
							<input class="#this.editProfileFormFieldsClass#" type="password" name="password2" id="password2txt" value=""  maxlength="50" <cfif not session.mura.isloggedin>data-required="true"</cfif> placeholder="#variables.Mura.rbKey('user.passwordconfirm')#" data-message="#HTMLEditFormat(variables.Mura.rbKey('user.passwordconfirmrequired'))#" autocomplete="off"/>
						</div>
					</div>

				</fieldset>

				<!--- INTEREST GROUPS --->
				<!--- <cfif application.categoryManager.getInterestGroupCount(Mura.event('siteID'), TRUE)>
					<fieldset>
						<legend>#variables.Mura.rbKey('user.interests')#:</legend>
						<cf_dsp_categories_nest siteid="#variables.Mura.event('siteID')#">
					</fieldset>
				</cfif> --->

				<!--- This *should* work if you want to allow an avatar, but it hasn't been fully tested. If you need help with it, hit us up in the Mura forum.
				<fieldset>
					<legend>Upload Your Photo</legend>

						<ul class="columns2">
							<li class="col">
								<p class="inputNote">Photo must be JPG format optimized for up to 150 pixels wide.</p>
									<input type="file" name="newFile" data-validate="regex" regex="(.+)(\.)(jpg|JPG)" data-message="Your logo must be a .JPG" value=""/>
							</li>
							<li class="col">
							<cfif len(request.userBean.getPhotoFileID())>
								<img src="#variables.Mura.globalConfig('context')#/index.cfm/_api/render/small/?fileid=#request.userBean.getPhotoFileID()#" alt="your photo" />
								<input type="checkbox" name="removePhotoFile" value="true"> Remove current logo
							</cfif>
							</li>
						</ul>
				</fieldset>
				--->

				<!--- EXTENDED ATTRIBUTES (as defined in the class extension manager) --->
				<cfsilent>
					<cfif request.userBean.getIsNew()>
						<cfset request.userBean.setSiteID(variables.Mura.event("siteid"))>
					</cfif>
					<cfif request.userBean.getIsPublic()>
						<cfset userPoolID=application.settingsManager.getSite(request.userBean.getSiteID()).getPublicUserPoolID()>
					<cfelse>
						<cfset userPoolID=application.settingsManager.getSite(request.userBean.getSiteID()).getPrivateUserPoolID()>
					</cfif>
					<cfset extendSets=application.classExtensionManager.getSubTypeByName(request.userBean.gettype(),request.userBean.getsubtype(),userPoolID).getExtendSets(inherit=true,activeOnly=true) />
				</cfsilent>

				<!--- Extended Attributes --->
				<cfif arrayLen(extendSets)>
					<cfloop from="1" to="#arrayLen(extendSets)#" index="s">
						<cfset extendSetBean=extendSets[s]/>
						<cfsilent>
							<cfset started=false />
							<cfset attributesArray=extendSetBean.getAttributes() />
						</cfsilent>

						<cfloop from="1" to="#arrayLen(attributesArray)#" index="a">
							<cfset attributeBean=attributesArray[a]/>
							<cfset attributeValue=request.userBean.getExtendedAttribute(attributeBean.getAttributeID(),true)/>

							<cfif attributeBean.getType() neq "hidden">
								<cfif not started>
									<legend>#extendSetBean.getName()#</legend>
									<input name="extendSetID" type="hidden" value="#extendSetBean.getExtendSetID()#">
									<cfset started=true>
								</cfif>

								<div class="<cfif attributeBean.getRequired()>req</cfif> #this.editProfileFormGroupWrapperClass#">
									<cfif not listFind("TextArea,MultiSelectBox",attributeBean.getType())>
										<label class="#this.editProfileFieldLabelClass#" for="ext#attributeBean.getAttributeID()#">
											#attributeBean.getLabel()#
											<cfif attributeBean.getRequired()><ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins></cfif>
											<!--- <cfif len(attributeBean.gethint())><br />#attributeBean.gethint()#</cfif> --->
										</label>
									<cfelse>
										<label class="#this.editProfileFieldLabelClass#" for="ext#attributeBean.getAttributeID()#">
											#attributeBean.getLabel()#
											<cfif attributeBean.getRequired()><ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins></cfif>
											<cfif len(attributeBean.gethint())><span class="#this.editProfileHelpBlockClass#">#attributeBean.gethint()#</span></cfif>
										</label>
									</cfif>

									<div class="#this.editProfileFormFieldsWrapperClass#">
										<cfif attributeBean.getType() neq 'TextArea'>
											#attributeBean.renderAttribute(attributeValue,true)#

											<cfif attributeBean.getType() neq "MultiSelectBox" and len(attributeBean.gethint())>
												<span class="#this.editProfileHelpBlockClass#">#attributeBean.gethint()#</span>
											</cfif>
											<!--- If it's a file --->
											<cfif attributeBean.getType() eq "File" and len(attributeValue) and attributeValue neq 'useMuraDefault'>
												<div class="#this.editProfileFormGroupWrapperClass#">
													<div class="#this.editProfileExtAttributeFileWrapperClass#">
														<div class="#this.editProfileExtAttributeFileCheckboxClass#">
															<label>
																<input type="checkbox" name="extDelete#attributeBean.getAttributeID()#" value="true"/> Delete
															</label>
														</div>
													</div>
													<div class="#this.editProfileExtAttributeDownloadClass#">
														<span class="#this.editProfileHelpBlockClass#"><a class="#this.editProfileExtAttributeDownloadButtonClass#" href="#variables.Mura.globalConfig('context')#/tasks/render/file/index.cfm?fileID=#attributeValue#" target="_blank">Download</a></span>
													</div>
												</div>
											</cfif>
										<cfelse>
											#attributeBean.renderAttribute(attributeValue)#
										</cfif>
									</div>
								</div>
							</cfif>
						</cfloop>
					</cfloop>
				</cfif>
				<!--- @END Extended Attributes --->

				<!--- form protection --->
				<div class="#this.editProfileFormGroupWrapperClass#">
					<div class="#this.editProfileSubmitButtonWrapperClass#">
						#variables.Mura.dspObject_include(thefile='datacollection/dsp_form_protect.cfm')#
					</div>
				</div>

				<!--- EDIT PROFILE BUTTON --->
				<div class="#this.editProfileFormGroupWrapperClass#">
					<div class="#this.editProfileSubmitButtonWrapperClass#">
						<cfif session.mura.isLoggedIn>
							<button type="submit" class="#this.editProfileSubmitButtonClass#">#htmlEditFormat(variables.Mura.rbKey('user.updateprofile'))#</button>
							<input type="hidden" name="userid" value="#session.mura.userID#">
							<input type="hidden" name="doaction" value="updateprofile">
						<cfelse>
							<input type="hidden" name="userid" value="">
							<input type="hidden" name="isPublic" value="1">
							<input type="hidden" name="inactive" value="0"> <!--- Set the value to "1" to require admin approval of new accounts --->
							<button type="submit" class="#this.editProfileSubmitButtonClass#">#htmlEditFormat(variables.Mura.rbKey('user.createprofile'))#</button>
							<input type="hidden" name="doaction" value="createprofile">
							<!--- <input type="hidden" name="groupID" value="[userid from Group Detail page url]"> Add users to a specific group --->
						</cfif>

						<input type="hidden" name="siteid" value="#HTMLEditFormat(variables.Mura.event('siteID'))#">
						<input type="hidden" name="returnURL" value="#HTMLEditFormat(request.returnURL)#">
						<input type="hidden" name="display" value="editprofile">
						#variables.Mura.renderCSRFTokens(format='form',context='editprofile')#
					</div>
				</div>
			</form>
		</div>

		<script type="text/javascript">
			document.getElementById("profile").elements[0].focus();
		</script>
	<cfelse>

		<!--- This is where the script for a newly created account does if inactive is default to 1 for new accounts--->
		<cfsilent>
			<cfif request.userBean.getInActive() and len(getSite().getExtranetPublicRegNotify())>
			<cfsavecontent variable="notifyText"><cfoutput>
			A new registration has been submitted to #getSite().getSite()#

			Date/Time: #now()#
			#variables.Mura.rbKey('user.email')#: #request.userBean.getEmail()#
			#variables.Mura.rbKey('user.username')#: #request.userBean.getUserName()#
			#variables.Mura.rbKey('user.fname')#: #request.userBean.getFname()#
			#variables.Mura.rbKey('user.lname')#: #request.userBean.getLname()#
			</cfoutput></cfsavecontent>
			<cfset email=variables.Mura.getBean('mailer') />
			<cfset email.sendText(notifyText,
							getSite().getExtranetPublicRegNotify(),
							getSite().getSite(),
							'#getSite().getSite()# Public Registration',
							variables.Mura.event('siteID')) />

			</cfif>
		</cfsilent>

		<cfif request.userBean.getInActive()>
			<div class="#this.editProfileSuccessMessageClass#">
				<p>#variables.Mura.rbKey('user.thankyouinactive')#</p>
			</div>
		<cfelse>
			<div class="#this.editProfileSuccessMessageClass#"><p>#variables.Mura.rbKey('user.thankyouactive')#</p></div>
		</cfif>
	</cfif>
</cfoutput>
