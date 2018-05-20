<#import "parts/common.ftl" as c>
<#import "login.ftl" as l>

<@c.page>
<div class="card text-center">
    <div class="card-header" style="height: 48px;">
        <h5 class="card-title">Greeting</h5>
    </div>
    <div class="card-body" style="background-image: url(/static/img/wp-image-142615486.png); background-size: cover;">
        <img class="card-img-top" src="/static/img/logo.png" alt="logo" style="width: 25%; border-radius: 10px;">
        <p class="card-text">Hello, user</p>
        <!--<a href="/main">
            <button class="btn btn-primary btn-mini" type="button" role="button">
                <image src="/static/img/done.png" style="width: 20px; margin-right: 5px;">Let's go
            </button>
        </a>-->
    </div>
    <div class="card-footer text-muted">
        <i>TO BE CONTACT</i>
    </div>
</div>
</@c.page>

