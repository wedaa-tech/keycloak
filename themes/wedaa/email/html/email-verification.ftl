<#import "template.ftl" as layout>
<@layout.emailLayout>
${msg("emailVerificationBodyHtml",link, linkExpiration, realmName, user.getFirstName(),linkExpirationFormatter(linkExpiration))?no_esc}
</@layout.emailLayout>