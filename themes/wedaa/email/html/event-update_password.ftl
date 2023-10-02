<#import "template.ftl" as layout>
<@layout.emailLayout>
${msg("eventUpdatePasswordBodyHtml",event.date, event.ipAddress,user.getFirstName())?no_esc}
</@layout.emailLayout>
