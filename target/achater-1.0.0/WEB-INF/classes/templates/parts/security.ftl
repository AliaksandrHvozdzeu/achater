<#assign known = Session.SPRING_SECURITY_CONTEXT?? >
<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    filename =  user.getFilename()
    isAdmin = user.isAdmin()
    >
<#else>
    <#assign
    name = "unknown"
    filename = "unknown.png"
    isAdmin = false
    >
</#if>