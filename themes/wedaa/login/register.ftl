<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
   <#if section = "title">
   ${msg("registerTitle")}
   <#elseif section = "header">
   <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="${url.resourcesPath}/img/wedaa-icon.png" rel="icon"/>
     <link href="${url.resourcesPath}/img/wedaa-background.png" rel="icon"/>
     
   <#elseif section = "form">
   <div class="card card-3" style="border: 1px solid #CFCFCF;margin-top:30px">
      <#if realm.password>
         <div class="card-register">
            <div style="text-align: center;margin-bottom: 20px;
               font-size: 32px;">
               <span class="span-text" style="font-weight:500;color:#3E4957;font-size:20px">Create an Account</span>
            </div>
            <form id="kc-form-login" class="form" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
               <#if false >
                  <div class="input-group-register">
                     <input id="firstName" class="input--style-3 input-width" type="text" name="firstName" required oninvalid="this.setCustomValidity('Enter your firstname')"
                        oninput="this.setCustomValidity('')" value="${(register.formData.firstName!'')}" tabindex="1" placeholder="First Name*">
                  </div>
                  <div class="input-group-register">
                     <input id="lastName" class="input--style-3 input-width" type="text" name="lastName" required oninvalid="this.setCustomValidity('Enter your secondname')"
                        oninput="this.setCustomValidity('')"  value="${(register.formData.lastName!'')}" tabindex="1" placeholder="Last Name*">
                  </div>
                  <div class="input-group-register">
                  <input type="text" id="email" class="input--style-3 input-width"  name="email"required oninvalid="this.setCustomValidity('Enter your email id')"
                        oninput="this.setCustomValidity('')"  value="${(register.formData.email!'')}" autocomplete="email" placeholder="${msg("Email*")}"/>
                  </div>
               </#if>
               <#if !realm.registrationEmailAsUsername>
                  <div  class="input-group-register">
                     <input type="text" id="username" class="input--style-3 input-width" name="username" required oninvalid="this.setCustomValidity('Enter your email id')"
                        oninput="this.setCustomValidity('')" value="${(register.formData.username!'')}" autocomplete="username" placeholder="${msg("User Name*")}"/>
                  </div>
                  <div class="input-group-register">
                     <input type="text" id="email" class="input--style-3 input-width"  name="email"required oninvalid="this.setCustomValidity('Enter your email id')"
                        oninput="this.setCustomValidity('')"  value="${(register.formData.email!'')}" autocomplete="email" placeholder="${msg("Email*")}"/>
                  </div>

                  
                  <div class="input-group-register">
                  <input type="password" id="password" class="input--style-3 input-width"  name="password"required oninvalid="this.setCustomValidity('Enter your password')"
                        oninput="this.setCustomValidity('')"  value="${(register.formData.password!'')}" autocomplete="password" placeholder="${msg("Password*")}"/>
                  <button type="button" class="toggle" id="togglePassword" data-target="password"><i class="fa fa-eye" style="color:#3E4957;"></i></button>
                  </div>
                  <div class="input-group-register">
                  <input type="password" id="password-confirm" class="input--style-3 input-width"  name="password-confirm"required oninvalid="this.setCustomValidity('Enter your confirm password')"
                        oninput="this.setCustomValidity('')"  value="${(register.formData.passwordConfirm!'')}" autocomplete="password-confirm" placeholder="${msg("Confirm password*")}"/>
                  <button type="button" class="toggle" id="togglePasswordConfirm" data-target="password-confirm"><i class="fa fa-eye" style="color:#3E4957;"></i></button>
                  </div>
               </#if>
         
               <div class="signup-checkbox" style="text-align:left;display:none">
                  <label>
                     <input id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                  </label>
               <#if false>  
                 <a style="color:#0000ff;" href="/terms" target="_blank">Terms & Conditions</a> and <a style="color:#0000FF;" href="/privacy" target="_blank">Privacy Policy </a>
               </#if>
               </div>
               <div style="width: 100%; justify-content: center; display: flex;">
                  <input class="submit" id="submitBtn" type="submit" value="${msg("doRegister")}" tabindex="3">
               </div>
            </form>
             
            <#if social.providers??>
               <div id="social-providers" style="text-align:center;">
               <p><span style="text-align:center;text:no-wrap; top:10px;position:relative;color:#A5AAB0"> or register with </span></p>
               </div>
               <#list social.providers as p>
                  <div style="display: block;cursor: pointer;">
                     <div class="providers-list" style="display: flex;">
                        <img src="${url.resourcesPath}/img/${p.displayName}.svg" style="width:28px;height:28px;"> 
                        <input class="providers-label" type="button"  onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                     </div>
                  </div>
               </#list>
            </#if>            
            <div style="text-align: center;margin-top:25px;">
               <span style="text-size:16px;">Already have an account?</span>
               <a href="${url.loginUrl}" style="color:#0000ff;font-weight:500 ">Sign In</a>
            </div>
            <div style="margin-top:25px;text-align:center;">
               <span style="text-size:16px;">Want to go back?</span>
               <a href="${properties.wedaaUrl}" style="color:#0000ff;font-weight:500">Cancel</a>
            <div>
         </div>
             
      </#if>  
      <script>
         var checker = document.getElementById('rememberMe');
         var submit = document.getElementById('submitBtn');
         checker.onchange = function() {
            submit.disabled = !this.checked;
         };
         
         document.addEventListener("DOMContentLoaded", function () {
            const toggleButtons = document.querySelectorAll(".toggle");
            toggleButtons.forEach(function (button) {
               button.addEventListener("click", function () {
                  const targetId = this.getAttribute("data-target");
                  const passwordInput = document.getElementById(targetId);

                  if (passwordInput) {
                     // toggle the type attribute
                     const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
                     passwordInput.setAttribute("type", type);

                     // toggle the icon
                     this.querySelector("i").classList.toggle("fa-eye-slash");
                  }
               });
            });
         });

      </script>
   </#if>
</@layout.registrationLayout>