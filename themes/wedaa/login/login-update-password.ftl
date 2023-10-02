<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="title">
            ${msg("createUpdatePasswordTitle",(realm.displayName!''))}
            <#elseif section="header">
                <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
                <link href="${url.resourcesPath}/img/favicon.png" rel="icon" />
                <#elseif section="form">
                    <div class="card card-3" style="border: 1px solid #CFCFCF;margin-top:30px">
                        <#if realm.password>
                            <div class="card-body">
                                <h1 class="title" style="text-align:center;font-variant: unset;font-size: 20px;font-weight:500">Change Password</h1>
                                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                                    <div>
                                        <div class="input-group-register">
                                            <label>Create Password<span class="required">*</span></label>
                                            <input class="input--style-3 input-width" id="password" type="password" placeholder="Password" name="password-new">
                                            <button type="button" id="btnToggle" class="toggle" onclick="passwordCheck()" style="top:45px"><i id="eyeIcon" class="fa fa-eye" style="color:#3E4957;"></i></button>
                                        </div>
                                        <div class="input-group-register">
                                            <label>Confirm Password<span class="required">*</span></label>
                                            <input class="input--style-3 input-width" id="password-change" type="password" placeholder="Confirm Password" name="password-confirm" onkeyup="checkPass();">
                                            <button type="button" id="btnToggle" class="toggle" style="top:45px"><i id="eyeIconConfirm" class="fa fa-eye" style="color:#3E4957;"></i></button>
                                            <span id="confirm-message2" style="padding-top:0.5em;display:block"></span>
                                        </div>
                                        <div style="width: 100%; justify-content: center; display: flex;margin-top:20px;">
                                            <input class="submit" type="submit" value="${msg("doSubmit")}" tabindex="3">
                                        </div>
                                    </div>
                                </form>
                                <#elseif section="info">
                                    ${msg("emailInstruction")}
                        </#if>
        </#if>
        <script>
        const togglePassword = document.querySelector("#eyeIcon");
        const password = document.querySelector("#password");
        togglePassword.addEventListener("click", function() {
            // toggle the type attribute
            const type = password.getAttribute("type") === "password" ? "text" : "password";
            password.setAttribute("type", type);
            // toggle the icon
            this.classList.toggle("fa-eye-slash");
        });
        const toggleConfirmPassword = document.querySelector("#eyeIconConfirm");
        const confirmPassword = document.querySelector("#password-change");
        toggleConfirmPassword.addEventListener("click", function() {
            // toggle the type attribute
            const type = confirmPassword.getAttribute("type") === "password" ? "text" : "password";
            confirmPassword.setAttribute("type", type);
            // toggle the icon
            this.classList.toggle("fa-eye-slash");
        });
        </script>
        <script>
        function checkPass() {
            //Store the password field objects into variables ...
            var password = document.getElementById('password');
            var confirm = document.getElementById('password-change');
            //Store the Confirmation Message Object ...
            var message = document.getElementById('confirm-message2');
            //Set the colors we will be using ...
            var good_color = "#91CF50";
            var bad_color = "#d0021b";
            //Compare the values in the password field 
            //and the confirmation field
            if (password.value == confirm.value) {
                //The passwords match. 
                //Set the color to the good color and inform
                //the user that they have entered the correct password 
                message.style.color = good_color;
                message.innerHTML = '<img src="${url.resourcesPath}/img/green-success-arrow.svg" alt="Passwords Match!" style="width:25px;height:25px;vertical-align: middle; padding-right:0.5em"> <span>Passwords Matched!</span>';
            } else {
                //The passwords do not match.
                //Set the color to the bad color and
                //notify the user.
                message.style.color = bad_color;
                message.innerHTML = '<img src="${url.resourcesPath}/img/flag-red-circle.svg" alt="Passwords Do Not Match!" style="width:25px;height:25px;vertical-align: middle; padding-right:0.5em"> <span>Passwords you have entered do not Match!</span>';
            }
        }
        </script>
    </@layout.registrationLayout>