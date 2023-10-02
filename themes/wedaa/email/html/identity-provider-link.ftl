<#import "template.ftl" as layout>
<@layout.emailLayout>
${msg("identityProviderLinkBodyHtml", identityProviderDisplayName, realmName, identityProviderContext.username, link, linkExpiration, linkExpirationFormatter(linkExpiration),user.getFirstName())?no_esc}
</@layout.emailLayout>