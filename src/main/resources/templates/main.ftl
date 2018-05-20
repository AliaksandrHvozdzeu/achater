<#include "parts/security.ftl">
<#import "parts/common.ftl" as c>

<@c.page>
<div class="card">
    <div class="card-body">
        <form method="get" action="/main" class="form-inline">

            <input id="searchFld" type="text" name="filter" class="form-control col-sm-9 mr-sm-2"
                   value="${filter?ifExists}"
                   placeholder="Search by tag">

            <button id="searchBtn" type="submit" class="btn btn-primary my-2 my-sm-0">
                <image src="/static/img/search.png" style="width: 20px; margin-right: 5px;">Search
            </button>

            <a class="btn btn-success my-2 my-sm-0"
               data-toggle="collapse"
               href="#collapseNewMessage"
               role="button"
               aria-expanded="false"
               style="margin-left: 7px;"
               aria-controls="collapseNewMessage">
                <image src="/static/img/baseline_add_white_18dp.png" style="width: 20px; margin-right: 5px;">
                    New message
            </a>

        </form>
        <div class="collapse <#if message??>show</#if>" id="collapseNewMessage">
            </br>
            <div class="card">
                <div class="card-header">
                    <h3>New message</h3>
                </div>
                <div class="card-body">
                    <div class="form-group mt-2">
                        <form method="post" action="/newMsg" enctype="multipart/form-data">
                            <div class="form-group">
                                <textarea class="form-control ${(textError??)?string('is-invalid', '')}"
                                          value="<#if message??>${message.text}</#if>"
                                          name="text"
                                          placeholder="Insert message"
                                          aria-label="With textarea"
                                          rows="10"
                                          style="resize: none; overflow: hidden;"></textarea>
                                <#if textError??>
                                <div class="invalid-feedback">
                                    ${textError}
                                </div>
                                </#if>
                            </div>
                            <div class="form-group">
                                <input type="text"
                                       class="form-control ${(tagError??)?string('is-invalid', '')}"
                                       value="<#if message??>${message.tag}</#if>"
                                       name="tag"
                                       placeholder="Tag">
                                <#if tagError??>
                                <div class="invalid-feedback">
                                    ${tagError}
                                </div>
                                </#if>
                            </div>
                            <div class="form-group">
                                <div class="custom-file">
                                    <input type="file"
                                           name="file"
                                           id="customFile"
                                           style="display: none"
                                           onchange="fileCheck('customFile', 'errorLoadFileNewMessage', 'labelFileNameNewMessage');">
                                    <label class="custom-file-label cut-long-filename"
                                           for="customFile"
                                           id="labelFileNameNewMessage">Add file
                                    </label>
                                </div>
                                <div class="invalid-feedback" id="errorLoadFileNewMessage">
                                </div>
                            </div>
                            <input type="hidden"
                                   name="_csrf"
                                   value="${_csrf.token}"/>
                            <div class="form-group">
                                <button type="submit"
                                        class="btn btn-primary">Save
                                </button>
                                <button type="button"
                                        class="btn btn-danger"
                                        data-toggle="collapse"
                                        href="#collapseNewMessage"
                                        role="button">Cancel
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="card-columns">
    <#list messages as message>
        <div class="card my-3" style="width: 100%; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
        <#if message.filename??>
            <div class="card-header">
                <#if message.author.filename == "">
                    <img src="/static/img/unknown.png" href="#"
                         style="width: 33px; margin-right: 5px; margin-left: -11px; border-radius: 25px; border: 3px solid #666; box-shadow: 0 0 7px #666;">
                <#else>
                    <img src="/img/${message.author.filename}"
                         style="width: 33px; margin-right: 5px; margin-left: -11px; border-radius: 25px; border: 3px solid #666; box-shadow: 0 0 7px #666;">
                </#if>
                <a>${message.authorName}</a><a><i id="dateOnLbl_${message.id}"
                                                  style="font-size: 8pt; float: right; margin-top: 8px;"></i></a>
                <script>
                    var date = unixTimeToDate(${message.dateon?replace(" ","")?replace(",","")});
                    document.getElementById("dateOnLbl_${message.id}").innerHTML = date;
                </script>
            </div>
            </br>
            <#if message.filename == "">
            <#else>
                <img src="/img/${message.filename}" class="card-img-top"
                     style="width: 37%; left: 31%; position: inherit;">
            </#if>
        <#else>
            <div class="card-header">
                <#if message.author.filename == "">
                    <img src="/static/img/unknown.png" href="#"
                         style="width: 33px; margin-right: 5px; margin-left: -11px; border-radius: 25px; border: 3px solid #666; box-shadow: 0 0 7px #666;">
                <#else>
                    <img src="/img/${message.author.filename}"
                         style="width: 33px; margin-right: 5px; margin-left: -11px; border-radius: 25px; border: 3px solid #666; box-shadow: 0 0 7px #666;">
                </#if>
                <a>${message.authorName}</a><a><i id="dateOnLbl_${message.id}"
                                                  style="font-size: 8pt; float: right; margin-top: 8px;"></i></a>
                <script>
                    var date = unixTimeToDate(${message.dateon?replace(" ","")?replace(",","")});
                    document.getElementById("dateOnLbl_${message.id}").innerHTML = date;
                </script>
            </div>
            </br>
        </#if>
            <div class="m-2" style="widows: 80%;">
                <b><i href=""
                      onclick="document.getElementById('searchFld').value='${message.tag}';
                      document.getElementById('searchBtn').click();"
                      style="font-size: 8pt;">
                    <#if message.tag == "">
                    <#else>
                        #${message.tag}
                    </#if>
                </i></b>
                </br>
                <div class="text-justify">${message.text}...</div>
            </div>
            <div class="card-footer text-muted">
                <a aria-controls="collapseButtonsExample_${message.id}"
                   data-toggle="collapse"
                   href="#collapseButtonsExample_${message.id}"
                   role="button">
                    <image src="/static/img/list.png" style="width: 20px; margin-right: 5px;">
                </a>
            </div>
            <div class="card-body collapse" id="collapseButtonsExample_${message.id}">
                <div class="btn-group btn-group-sm" role="group" aria-label="" style="">
                <#if !isAdmin>
                    <form method="get" action="/message" class="form-inline" style="width: 100%">
                        <button href="/message" name="id" value="${message.id}" type="submit"
                                class="btn btn-success ml-2"
                                style="width: 100px">
                            <image src="/static/img/read.png" style="width: 20px; margin-right: 5px; margin-top: -4px;">
                                Read
                        </button>
                    </form>
                </#if>
                <#if isAdmin>
                    <!-- -------------------------------READ MESSAGE----------------------------- -->
                    <form method="get" action="/message" class="form-inline" style="width: 40%">
                        <button href="/message" name="id" value="${message.id}" type="submit"
                                class="btn btn-success ml-2"
                                style="width: 100%">
                            <image src="/static/img/read.png" style="width: 20px; margin-right: 5px; margin-top: -4px;">
                                Read
                        </button>
                    </form>
                    <!-- ------------------------------------------------------------------------ -->

                    <!-- -------------------------------UPDATE MESSAGE----------------------------- -->
                <form method="get" action="/update" class="form-inline" style="width: 40%; margin-left: 3%;">
                    <button href="update" name="id" value="${message.id}" type="submit"
                            class="btn btn-primary btn-mini" style="width: 100%">
                        <image src="/static/img/edit.png" style="width: 20px; margin-right: 5px; margin-top: -4px;">
                            Edit
                    </button>
                </form>
                <!-- ------------------------------------------------------------------------ -->

                <!-- -----------------------------DELETE MESSAGE----------------------------- -->
                <form method="get" action="/delete" class="form-inline" style="width: 40%; margin-left: 3%;">
                    <button href="/delete" name="id" value="${message.id}" type="submit"
                            class="btn btn-danger btn-mini" style="width: 100%">
                        <image src="/static/img/delete.png" style="width: 20px; margin-right: 5px; margin-top: -4px;">
                            Delete
                    </button>
                </form>
                <!-- ------------------------------------------------------------------------ -->
                </#if>
                </div>
            </div>
        </div>
    <#else>
    <!--</br>
        <div class="card" style="width: 18rem;">
            <img class="card-img-top" src="/static/img/Red-email-icon.png" alt="No message" style="width: 80%; margin-left: 9%;">
            <div class="card-body">
                <p class="card-text">No message.</p>
            </div>
        </div>-->
    </#list>
</div>
</@c.page>