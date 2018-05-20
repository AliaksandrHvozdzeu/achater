<#import "parts/common.ftl" as c>

<@c.page>
    <!-- ЧИТАЕМ СООБЩЕНИЕ -->
    <#list messages as message>
    <form method="post" action="/saveMsg"><!-- enctype="multipart/form-data">-->
        <div class="card">
            <div class="card-header">
                Update message by #${message.id}
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">Message:</label>
                    <textarea type="text" class="form-control" rows="10" name="text" id="exampleInputText" required
                              style="resize: none;">${message.text}</textarea>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Tag:</label>
                    <input type="text" class="form-control" id="exampleInputTag" required name="tag" value="${message.tag}">
                </div>

                <!--
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="" id="customFile" style="display: none">
                        <label class="custom-file-label" for="customFile">Add file</label>
                    </div>
                </div>-->

                <input type="hidden" value="${message.authorName}" name="authorName"/>
                <input type="hidden" value="${message.id}" name="messageId"/>
                <input type="hidden" value="${message.author.id}" name="userId">
                <input type="hidden" value="${_csrf.token}" name="_csrf"/>
                <div class="form-group row ml-0">
                    <button class="btn btn-primary" type="submit">Save</button>
                    <a href="/main">
                        <button href="/main" type="button" class="btn btn-danger ml-2">Cancel</button>
                    </a>
                </div>
            </div>
        </div>
    </form>
    </#list>
</@c.page>