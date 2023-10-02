<#import "template.ftl" as layout>
<@layout.emailLayout>
${msg("passwordResetBodyHtml",link, linkExpiration, realmName,user.getFirstName(), linkExpirationFormatter(linkExpiration))?no_esc}
</@layout.emailLayout>