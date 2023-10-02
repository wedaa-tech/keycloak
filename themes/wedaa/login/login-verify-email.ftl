<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    
        <#--  ${msg("emailVerifyTitle")}  -->
    <#if section = "form">       
        <div class="limiter">
		<div class="container-vf">
			<div class="wrap-vf">
				<div class="vf-form-title" style="background-color:#fff">
                <div>
               <#--   <img src="${url.resourcesPath}/img/11.png" atl="logo" />  -->
					</div>
                    <span class="vf-form-title-1">
						Email Verification
					</span>
				</div>

				<p style="font-size:16px;font-size:16px;padding: 1rem;line-height: 1.4;" class="instruction">
            ${msg("emailVerifyInstruction1")}
        </p>
        <p style="font-size:16px;margin-bottom:0" class="instruction">
            ${msg("emailVerifyInstruction2")}
        </p>
        <p style="font-size:16px;margin-top:0;" class="instruction"></p>
					<div class="container-vf-form-btn" style="justify-content:center;padding-left:0">
                    
                    <a href="${url.loginAction}"> 
						<button class="vf-form-btn">
						Resend
						</button>
                        </a>
					</div>
			
			</div>
		</div>
	</div>
    </#if>
</@layout.registrationLayout>