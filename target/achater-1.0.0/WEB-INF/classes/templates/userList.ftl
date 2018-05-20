<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-group">
    <div class="form-group">
        <h3>List of users</h3>
    </div>
    <form method="get" action="" class="form-inline">
        <div class="form-group">
            <div class="col-sm-8">
                <input id="searchUserFld" type="text" name="filter" class="form-control"
                       placeholder="Search by name">
            </div>
        </div>
        <div class="form-group">
            <button id="searchBtn" type="submit" class="btn btn-primary ml-2">
                <image src="/static/img/search.png" style="width: 20px; margin-right: 5px;">Search
            </button>
        </div>
    </form>
    </br>
</div>
    <#list users as user>
    <div class="container-fluid">
        <div class="card">
            <h5 class="card-header">
            <#if user.filename == "">
                <#if user.isBlockInApp() == true>
                    <img src="/static/img/unknown.png" href="#"
                         style="width: 33px; margin-right: 5px; margin-left: -11px; border-radius: 25px; border: 3px solid #dc3545; box-shadow: 0 0 7px #dc3545;">
                <#else>
                     <img src="/static/img/unknown.png" href="#"
                          style="width: 33px; margin-right: 5px; margin-left: -11px; border-radius: 25px; border: 3px solid #666; box-shadow: 0 0 7px #666;">
                </#if>
            <#else>
                <#if user.isBlockInApp() == false>
                    <img src="/img/${user.filename}"
                         style="width: 33px; margin-right: 5px; margin-left: -11px; border-radius: 25px; border-radius: 25px; border: 3px solid #28a745; box-shadow: 0 0 7px #28a745;">
                <#else>
                     <img src="/img/${user.filename}"
                          style="width: 33px; margin-right: 5px; margin-left: -11px; border-radius: 25px; border-radius: 25px; border: 3px solid #666; box-shadow: 0 0 7px #666;">
                </#if>
            </#if>
                <i><b>${user.username}</b></i>
                <a aria-controls="collapseButtonsExample_${user.id}"
                   data-toggle="collapse"
                   href="#collapseButtonsExample_${user.id}"
                   role="button">
                    <image src="/static/img/list.png" style="width: 33px; margin-right: -2px; float: right;">
                </a>
            </h5>


            <div class="card-body collapse" id="collapseButtonsExample_${user.id}">
                <div class="card-body">
                    <div>
                        <a class="card-text">tel: ${user.usertel?ifExists}</a>
                    </div>
                    <div>
                        <a class="card-text">email: ${user.useremail?ifExists}</a>
                    </div>
                    <div>
                        <a class="card-text">role: <#list user.roles as role>${role}<#sep>, </#list></a>
                    </div>
                    <div>
                        <a class="card-text">date reg.: <a id="user_list_id_${user.id}">${user.dateReg?ifExists}</a>
                    </div>
                    <script>
                        var date = unixTimeToDate(${user.dateReg?replace(" ","")?replace(",","")});
                        document.getElementById("user_list_id_${user.id}").innerHTML = date;
                    </script>
                      <#if user.isBlockInApp() == true>
                            <a class="card-text" style="color: #dc3545">Account is blocked.</a>
                      <#else>
                            <a class="card-text">Account not locked.</a>
                      </#if>
                </div>
                <div>
                    <a href="/user/${user.id}">
                        <button style="width: 32%" type="button" class="btn btn-primary btn-sm">Edit</button>
                    </a>
                    <a href="/user/deleteUser/${user.id}">
                        <button style="width: 32%" type="button" class="btn btn-danger btn-sm">Delete</button>
                    </a>
                    <#if user.isBlockInApp() == true>
                       <a href="/user/blockUser/${user.id}">
                           <button style="width: 32%" type="button" class="btn btn-success btn-sm">Unblock</button>
                       </a>
                    <#else>
                       <a href="/user/blockUser/${user.id}">
                           <button style="width: 32%" type="button" class="btn btn-secondary btn-sm">Block</button>
                       </a>
                    </#if>
                </div>
            </div>
        </div>
    </div>
    </br>
    </#list>
</br>
</@c.page>