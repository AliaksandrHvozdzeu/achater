<#include "security.ftl">
<#macro login path isRegisterForm>
<form action="${path}" method="post" enctype="multipart/form-data">
    <div class="card">
        <div class="card-header">
            <#if isRegisterForm>
                <h3>Registration form</h3>
            <#else>
                <h3>Login form</h3>
            </#if>
        </div>
        <div class="card-body">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">User name:</label>
                <div class="col-sm-10">
                    <input type="text" name="username" class="form-control" required placeholder="User name"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password:</label>
                <div class="col-sm-10">
                    <input type="password" name="password" class="form-control" required placeholder="Password"/>
                </div>
            </div>
    <#if isRegisterForm>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Telephone:</label>
            <div class="col-sm-10">
                <input type="tel" name="usertel" class="form-control" required
                       pattern="^\+375[0-9]{9}$" placeholder="Telephone"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">email:</label>
            <div class="col-sm-10">
                <input type="email" name="useremail" class="form-control" required placeholder="Email"/>
            </div>
        </div>
        <div class="col-sm-6">
            <!--<div class="g-recaptcha" data-sitekey="6LdHhloUAAAAAEuK4-oPbvQ-jnnlam4S4H2dvH9l"></div>-->
        </div>
        <!-- LOAD PHOTO FOR REGISTRATION FORM -->
        <!--
        <div class="form-group">
            <div class="custom-file">
                <input type="file" name="filename" id="customFile" required style="display: none">
                <label class="custom-file-label" required for="customFile">Add photo</label>
            </div>
        </div>
        <!-- -------------------------------- -->
    </#if>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <#if !isRegisterForm><a href="/registration">
        <button type="button" class="btn btn-success btn-mini">Registration</button>
    </a></#if>
            <button class="btn btn-primary" type="submit">
                <#if isRegisterForm>
                    Create
                <#else>
                    Sign In
                </#if>
            </button>
            <#if isRegisterForm>
            <a href="/main" style="margin-left: -7px;">
                <button href="/main" type="button" class="btn btn-danger ml-2">Cancel</button>
            </a>
            </#if>
        </div>
    </div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <button class="btn btn-primary" type="submit">
        <image src="/static/img/baseline_exit_to_app_white_18dp.png" style="width: 20px; margin-right: 5px;">
        <#if known>
            Sing out
        <#else>
            Sign in
        </#if>
    </button>
</form>
</#macro>

