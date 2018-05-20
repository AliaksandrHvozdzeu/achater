<#include "security.ftl">
<#import "login.ftl" as l>
<#import "common.ftl" as c>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <img src="/static/img/logo.png" href="#" style="max-width: 44px; margin-top: -5px; margin-right: 10px;" class="">
    <a class="navbar-brand" href="/" style="margin-top: -5px;">Achater</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <#if user??>
                <li class="nav-item">
                    <a class="nav-link" href="/main">Messages</a>
                </li>
            <li class="nav-item">
                <!-- FORM PROFILE -->
                <a class="nav-link" href="/user/profile">Profile</a>
            </li>
            </#if>
            <#if isAdmin>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle"
                   href="#"
                   id="navbarDropdown"
                   role="button"
                   data-toggle="dropdown"
                   aria-haspopup="true"
                   aria-expanded="false"
                >
                    ADMIN
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="/user">User list</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
            </#if>
        </ul>
        <#if known>
            <#if filename == "">
                <img src="/static/img/unknown.png" href="#"
                     style="width: 44px;
                     height: 44px;
                     margin-top: -5px;
                     margin-right: 10px;
                     border-radius: 25px;"
                     class="">
            <#else>
                <img src="/img/${filename}" href="#"
                     style="width: 44px;
                     height: 44px;
                     margin-top: -5px;
                     margin-right: 10px;
                     border-radius: 25px;"
                     class="">
            </#if>
        <#else>
             <img src="/static/img/unknown.png" href="#"
                  style="width: 44px;
                  height: 44px;
                  margin-top: -5px;
                  margin-right: 10px;
                  border-radius: 25px;"
                  class="">
        </#if>
        <div>

        </div>
        <div class="navbar-text mr-3">${name}</div>
        <@l.logout />
    </div>
</nav>