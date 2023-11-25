<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "title">
${msg("loginTitle",(realm.displayName!''))}
<#elseif section = "header">

<#elseif section = "form">
<div class="card card-3" style="border: 1px solid #CFCFCF;margin-top:30px">
<#if realm.password>
<div class="card-body">
   <div style="text-align: center;margin-bottom: 20px;
               font-size: 32px;font-family:Inter;">
               <span class="span-text" style="font-weight:500;color:#3E4957;font-size:20px;">Login</span>
            </div>
<form id="kc-form-login" class="form form1" return true;" action="${url.loginAction}" method="post">
   <div class="input-group">
      <div>
         <input id="username" class="input--style-3 input-width" type="text" placeholder="Email Address" name="username" autocomplete="off">
      </div>
   </div>
   <div class="input-group">
      <div>
         <input class="input--style-3 input-width" id="txtPassword" type="password" placeholder="Password" name="password" autocomplete="off">  
         <button type="button" id="btnToggle" class="toggle" style="top:16px"><i id="togglePassword" class="fa fa-eye" style="color:#3E4957;"></i></button>                       
      </div>
   </div>

<#if !usernameEditDisabled??>
  <div style="display: flex; justify-content: space-between; align-items: center;">
    <div>
      <#if realm.rememberMe>
         <div class="signup-checkbox" style="text-align: left; color: #0000ff;">
         <label style="font-family: Inter; font-weight: 500;">
            <input id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
         </label>
         </div>
      </#if>
    </div>

    <#if false>
      <div style="clear: both;margin-top: 4em;text-align: center;font-size:0.75em">
         By continuing, you agree to <a style="color:#0000ff;" href="/terms" target="_blank">Terms & Conditions</a> and <a style="color:#0000FF;" href="/privacy" target="_blank">Privacy Policy </a>.
      </div>
   </#if>

    <#if realm.resetPasswordAllowed>
      <div>
        <span><a style="color: #0000ff; font-size: 1em; font-weight: 500;" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
      </div>
    </#if>
  </div>
</#if>
 
   <div class="p-b-20" style="text-align:center;font-family:Inter;font-weight:700">
      <button class="submit" value="${msg('doLogIn')}" type="submit">Continue</button>
   </div>
</form>
</#if>
<#if social.providers??>
<div id="social-providers" style="text-align:center;">
   <p><span style="text-align:center;position:relative;top:10px;color:#A5AAB0"> or login with </span></p>
</div>
<#list social.providers as p>
   <div style="display: block;cursor: pointer;margin-top:0.5em">
      <div class="providers-list" style="display: flex;">
         <img src="${url.resourcesPath}/img/${p.displayName}.svg" style="width:28px;height:28px;"> 
         <input class="providers-label" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
      </div>
   </div>
</#list>
</#if>
<div style="margin-top:25px;text-align:center;">
   <span style="text-size:16px;">Don't have an account?</span>
   <a href="${url.registrationUrl}" style="color:#0000ff;font-weight:500">Sign Up</a>
   <div>
   </div>
<div style="margin-top:25px;text-align:center;">
   <span style="text-size:16px;">Want to go back?</span>
   <a href="${properties.wedaaUrl}" style="color:#0000ff;font-weight:500">Cancel</a>
   <div>
   </div>
</div>
<script>
        const togglePassword = document.querySelector("#togglePassword");
        const password = document.querySelector("#txtPassword");

        togglePassword.addEventListener("click", function () {
            // toggle the type attribute
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);
            
            // toggle the icon
            this.classList.toggle("fa-eye-slash");
        });

       
    </script>
</#if>

</@layout.registrationLayout>