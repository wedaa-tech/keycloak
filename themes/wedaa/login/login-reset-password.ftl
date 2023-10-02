<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        
       <#elseif section = "form">
        <div class="card card-3" style="border: 1px solid #CFCFCF;margin-top:30px">
        <#if realm.password>
        </#if>
        <#if realm.password>
               <div style="text-align: center;margin:30px;">
               <h2 style="font-weight:500;color:#3E4957;font-size:20px;">Forgot Password?</h2>
               </div>
               <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post" style="padding:0px 22px;">
                    <div class="input-group ">                    
                    <label style="text-align:left;">Enter your email id to which your account is linked.*</label>
                    <input type="text" id="username" name="username" class="input--style-3 input-reset"/>
                    </div>        
                <div style="width: 100%; justify-content: center; display: flex;margin-top:20px;">
                <input class="submit" type="submit" value="${msg("doSubmit")}" tabindex="3">
                </div>
                </form>  
        <#elseif section = "info" >
    ${msg("emailInstruction")}      
        </#if>
         <div style="margin-top:50px;text-align:center;margin-bottom:50px;">
        <span style="text-size:16px;">Remembered your password?</span>
        <a href="${url.loginUrl}" style="color:#0000ff; ">Sign in</a>
        <div>
        <div style="margin-top:10px;text-align:center;margin-bottom:160px">
        <span style="text-size:16px;">Don't have an account?</span>
        <a href="${url.registrationUrl}" style="color:#0000ff; ">Sign up</a>
        <div>
        </div>
        </div>
    </#if>
</@layout.registrationLayout>