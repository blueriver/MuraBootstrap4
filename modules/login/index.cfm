<cfif not isBoolean(variables.Mura.event('isBlocked'))>
	<cfset variables.Mura.event('isBlocked',false)>
</cfif>
<cfoutput>
	<div class="module-brand text-center mb-0 spacing-loose">
		<h1>#variables.Mura.rbKey('user.login')#</h1>
	</div>

	<div id="svLoginContainer" class="mura-login-container #this.loginWrapperClass#">
		<div class="#this.loginWrapperInnerClass#">
			<!---
				SUMMARY
				The page summary can be used to show some content before the user has logged in.
				Outputs only if there is content in the summary field.
			
			#variables.Mura.content('summary')#
			--->
			<cfset errorMessage = '' />
			<cfif StructKeyExists(session, 'mfa') and Len(session.mfa.username)>
				<cfset objStrikes = CreateObject('component', 'mura.user.userstrikes').init(session.mfa.username, application.configBean) />
				<cfset isBlocked = objStrikes.isBlocked() />
			<cfelse>
				<cfset isBlocked = StructKeyExists(session, 'blockLoginUntil') and IsDate(session.blockLoginUntil) and session.blockLoginUntil gt Now() />
			</cfif>

			<cfif isBlocked>
				<cfset errorMessage = variables.Mura.rbKey('login.blocked') />
			<cfelseif variables.Mura.event('status') eq 'denied'>
				<cfset errorMessage = variables.Mura.rbKey('login.denied') />
			<cfelseif variables.Mura.event('status') eq 'failed'>
				<cfset errorMessage = variables.Mura.rbKey('login.failed') />
			<cfelseif variables.Mura.event('failedchallenge') eq 'true'>
				<cfset errorMessage = variables.Mura.rbKey('login.incorrectauthorizationcode') />
			<cfelseif variables.Mura.event('linkinvalid') eq 'true'>
				<cfset errorMessage = 'The link you have entered is invalid or expired.' />
			</cfif>

			<cfif Len(errorMessage)>
				<div id="loginMsg" class="#this.alertDangerClass#">
					#errorMessage#
				</div>
			</cfif>

			<cfif not variables.Mura.event('isBlocked')>
				<cfif variables.Mura.event('status') eq 'challenge' and isdefined('session.mfa')>
					<cfset output=variables.Mura.renderEvent('onSiteMFAChallengeRender')>
					<cfif len(output)>
						#output#
					<cfelse>
						<cfif variables.Mura.getBean('configBean').getValue(property='MFAPerDevice',defaultValue=false) and not len(variables.Mura.event('authcode'))>
							<p id="loginMsg" class="#this.alertDangerClass#">#variables.Mura.rbKey('user.newdevice')#</p>
						</cfif>

						<cfif len(variables.Mura.event('authcode'))>
							<p id="loginMsg" class="#this.alertDangerClass#">#variables.Mura.rbKey('user.authcodeerror')#</p>
						</cfif>

						<form role="form" id="login" class="mura-login-form #this.loginFormClass# <cfif this.formWrapperClass neq "">#this.formWrapperClass#</cfif>" name="frmLogin" method="post" novalidate="novalidate">
							<div>
								<h3>#variables.Mura.rbKey('user.pleaseenterauthcode')#</h3>
								<!--- Username --->
								<div class="req #this.loginFormGroupWrapperClass#">
									<label for="txtUsername" class="#this.loginFormFieldLabelClass#">
										#variables.Mura.rbKey('user.authcode')#
										<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
									</label>
									<div class="#this.loginFormFieldWrapperClass#">
										<input autocomplete="off" class="#this.loginFormFieldClass#" type="text" id="txtUsername" placeholder="#variables.Mura.rbKey('user.authcode')#" name="authcode" data-required="true" data-message="#htmlEditFormat(variables.Mura.rbKey('user.authcoderequired'))#" autofocus>
									</div>
								</div>

								<cfif variables.Mura.getBean('configBean').getValue(property='MFAPerDevice',defaultValue=false)>
									<input type="hidden" name="rememberdevice" value="1"/>
									<!---
									<div class="#this.loginFormGroupWrapperClass#">
										<div class="#this.loginFormPrefsClass#">
											<label class="#this.loginFormCheckboxClass#" for="cbRememberDevice" >
												<input type="checkbox" id="cbRememberDevice" name="rememberdevice" value="1"> #htmlEditFormat(variables.Mura.rbKey('user.rememberdevice'))#
											</label>
										</div>
									</div>
								--->

								</cfif>

								<div class="#this.loginFormGroupWrapperClass#">
									<div class="#this.loginFormSubmitWrapperClass#">
										<button type="submit" class="#this.loginFormSubmitClass#">#htmlEditFormat(variables.Mura.rbKey('user.submitauthcode'))#</button>
									</div>
								</div>
								#variables.Mura.renderCSRFTokens(format='form',context='login')#
								<input type="hidden" name="doaction" value="login">
								<input type="hidden" name="status" value="challenge">
								<input type="hidden" name="attemptChallenge" value="true">
							</div>
						</form>
					</cfif>
				<cfelse>
					<form role="form" id="login" class="mura-login-form #this.loginFormClass# <cfif this.formWrapperClass neq "">#this.formWrapperClass#</cfif>" name="frmLogin" method="post" novalidate="novalidate">

						<cfif listFindNoCase(Mura.globalConfig().getEnableOauth(), 'google') or listFindNoCase(Mura.globalConfig().getEnableOauth(), 'facebook') >
								<div class="#this.loginFormGroupWrapperClass# w-100">
									<div class="#this.loginFormSubmitWrapperClass# w-100">
										<div class="mura-login-auth-wrapper w-100 text-center">
										<!--- Use Google oAuth Button --->
										<cfif listFindNoCase(Mura.globalConfig().getEnableOauth(), 'google')>
											<a href="#Mura.getBean('googleLoginProvider').generateAuthUrl(session.urltoken)#" title="#variables.Mura.rbKey('login.loginwithgoogle')#" class="mura-login-auth-btn ggl">
												<i class="fab fa-1x fa-google mi-google"></i>
												<span>#variables.Mura.rbKey('login.loginwithgoogle')#</span>
											</a>
										</cfif>
										<cfif listFindNoCase(Mura.globalConfig().getEnableOauth(), 'facebook')>
											<a href="#Mura.getBean('facebookLoginProvider').generateAuthUrl(session.urltoken)#" title="#variables.Mura.rbKey('login.loginwithfacebook')#" class="mura-login-auth-btn fb">
					               	<i class="fab fa-1x fa-facebook mi-facebook"></i>
			                  	<span>#variables.Mura.rbKey('login.loginwithfacebook')#</span>
			 									</a>
										</cfif>
									</div>
								</div>
							</div>
						</cfif>

						<div>
							<cfif listFindNoCase(Mura.globalConfig().getEnableOauth(), 'google') or listFindNoCase(Mura.globalConfig().getEnableOauth(), 'facebook') >
			              <div class="text-divider"><span>#variables.Mura.rbKey('login.or')#</span></div>
										<h3 class="text-center">#variables.Mura.rbKey('login.loginwithcredentials')#</h3>

							<cfelse>
									<h3 class="text-center">#variables.Mura.rbKey('user.pleaselogin')#</h3>
							</cfif>

							<!--- Username --->
							<div class="req #this.loginFormGroupWrapperClass#">
								<label for="txtUsername" class="#this.loginFormFieldLabelClass#">
									#variables.Mura.rbKey('user.username')#
									<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
								</label>
								<div class="#this.loginFormFieldWrapperClass#">
									<input class="#this.loginFormFieldClass#" type="text" id="txtUsername" placeholder="#variables.Mura.rbKey('user.username')#" name="username" data-required="true" data-message="#htmlEditFormat(variables.Mura.rbKey('user.usernamerequired'))#" autofocus>
								</div>
							</div>

							<!--- Password --->
							<div class="req #this.loginFormGroupWrapperClass#">
								<label for="txtPassword" class="#this.loginFormFieldLabelClass#">
									#variables.Mura.rbKey('user.password')#
									<ins>(#HTMLEditFormat(variables.Mura.rbKey('user.required'))#)</ins>
								</label>
								<div class="#this.loginFormFieldWrapperClass#">
									<input class="#this.loginFormFieldClass#" type="password" id="txtPassword" name="password" placeholder="#variables.Mura.rbKey('user.password')#" data-required="true" data-message="#htmlEditFormat(variables.Mura.rbKey('user.passwordrequired'))#" autocomplete="off">
								</div>
							</div>

							<cfif not variables.Mura.getBean('configBean').getValue(property='MFA',defaultValue=false)>
								<!--- Remember Me --->
								<div class="#this.loginFormGroupWrapperClass#">
									<div class="#this.loginFormPrefsClass#">
										<label class="#this.loginFormCheckboxClass#" for="cbRememberMe" >
											<input type="checkbox" id="cbRememberMe" name="rememberMe" value="1"> #htmlEditFormat(variables.Mura.rbKey('user.rememberme'))#
										</label>
									</div>
								</div>
							</cfif>

							<!--- Login Button --->
							<div class="#this.loginFormGroupWrapperClass#">
								<div class="#this.loginFormSubmitWrapperClass#">
									<button type="submit" class="#this.loginFormSubmitClass#">#htmlEditFormat(variables.Mura.rbKey('user.login'))#</button>
								</div>
							</div>

							<input type="hidden" name="doaction" value="login">
							<input type="hidden" name="linkServID" value="#HTMLEditFormat(variables.Mura.event('linkServID'))#">
							<input type="hidden" name="returnURL" value="#HTMLEditFormat(variables.Mura.event('returnURL'))#">
							#variables.Mura.renderCSRFTokens(format='form',context='login')#
						</div>
					</form>


					<cfif variables.Mura.event('doaction') eq 'sendlogin'>
						<cfset msg2=application.userManager.sendLoginByEmail(variables.Mura.event('email'), variables.Mura.event('siteID'),'#urlencodedformat(variables.Mura.event('returnURL'))#')>
					</cfif>

					<!--- Forgot Username / Password Form --->
					<form name="form2" class="mura-send-login #this.forgotPasswordFormClass# <cfif this.formWrapperClass neq "">#this.formWrapperClass#</cfif>" method="post" id="sendLogin" novalidate="novalidate">
						<div>
							<h3>#variables.Mura.rbKey('user.forgetusernameorpassword')#</h3>
							<p>#variables.Mura.rbKey('user.forgotloginmessage')#</p>

							<cfif isdefined('msg2')>
								<cfif FindNoCase('is not a valid',msg2)><div class="#this.loginFormErrorClass#">#HTMLEditFormat(variables.Mura.siteConfig("rbFactory").getResourceBundle().messageFormat(variables.Mura.rbKey('user.forgotnotvalid'),variables.Mura.event('email')))#<cfelseif FindNoCase('no account',msg2)><div class="#this.alertDangerClass#">#HTMLEditFormat(variables.Mura.siteConfig("rbFactory").getResourceBundle().messageFormat(variables.Mura.rbKey('user.forgotnotfound'),variables.Mura.event('email')))#<cfelse><div class="#this.alertSuccessClass#">#variables.Mura.rbKey('user.forgotsuccess')#</cfif></div>
							</cfif>

							<!--- Email --->
							<div class="#this.loginFormGroupWrapperClass#">
								<label class="#this.loginFormFieldLabelClass#" for="txtEmail">#variables.Mura.rbKey('user.email')#</label>
								<div class="#this.loginFormFieldWrapperClass#">
									<input id="txtEmail" name="email" class="#this.loginFormFieldClass#" type="text" placeholder="#variables.Mura.rbKey('user.email')#" data-validate="email" data-required="true" data-message="#htmlEditFormat(variables.Mura.rbKey('user.emailvalidate'))#" />
								</div>
							</div>

							<!--- Submit Button --->
							<div class="#this.loginFormGroupWrapperClass#">
								<div class="#this.loginFormSubmitWrapperClass#">
									<button type="submit" class="#this.loginFormSubmitClass#">#htmlEditFormat(variables.Mura.rbKey('user.getpassword'))#</button>
								</div>
							</div>

							<input type="hidden" name="doaction" value="sendlogin">
							<input type="hidden" name="linkServID" value="#HTMLEditFormat(variables.Mura.event('linkServID'))#">
							<input type="hidden" name="display" value="login">
							<input type="hidden" name="returnURL" value="#HTMLEditFormat(variables.Mura.event('returnURL'))#">
						</div>
					</form>

					<!--- Not Registered? --->
					<cfif variables.Mura.siteConfig('ExtranetPublicReg')>
						<div id="notRegistered" class="mura-not-registered">
							<#variables.Mura.getHeaderTag('subHead1')# class="center">#variables.Mura.rbKey('user.notregistered')# <a class="#this.notRegisteredLinkClass#" href="#variables.Mura.siteConfig('editProfileURL')#&returnURL=#urlencodedformat(variables.Mura.event('returnURL'))#">#variables.Mura.rbKey('user.signup')#</a></#variables.Mura.getHeaderTag('subHead1')#>
						</div>
					</cfif>
				</cfif>

				<script type="text/javascript">
					var loginForm = document.getElementById("login");
					if ( loginForm !== null ) {
					   loginForm.elements[0].focus();
					}
				</script>
			</cfif>
		</div>
	</div>
</cfoutput>
