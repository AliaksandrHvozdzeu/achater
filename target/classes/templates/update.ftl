<#import "parts/common.ftl" as c>

<@c.page>
    <!-- ЧИТАЕМ СООБЩЕНИЕ -->
    <form method="post" action="/saveMsg" enctype="multipart/form-data">
        <div class="card">
            <div class="card-header">
                Update message by #${message.id}
            </div>
            <div class="card-body">
                <div class="form-group">
                    <label for="exampleInputEmail1">Message:</label>
                    <textarea type="text"
                              class="form-control"
                              rows="10"
                              name="text"
                              id="exampleInputText"
                              required
                              style="resize: none; overflow: hidden;">${message.text}
                    </textarea>
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">Tag:</label>
                    <input type="text"
                           class="form-control"
                           id="exampleInputTag"
                           name="tag"
                           required
                           value="${message.tag}">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file"
                               name="file"
                               id="loadFile"
                               style="display: none"
                               onchange="fileCheck('loadFile', 'errorLoadFile', 'labelFileName');">
                        <label class="custom-file-label cut-long-filename"
                               id="labelFileName"
                               for="loadFile">Add file
                        </label>
                    </div>
                    <div class="invalid-feedback" id="errorLoadFile">
                    </div>
                </div>
                <input type="hidden"
                       value="${message.authorName}"
                       name="authorName"/>
                <input type="hidden"
                       value="${message.id}" name="messageId"/>
                <input type="hidden"
                       value="${message.author.id}"
                       name="userId"/>
                <input type="hidden"
                       value="${_csrf.token}"
                       name="_csrf"/>
                <div class="form-group row ml-0">
                    <button class="btn btn-primary"
                            type="submit">Save
                    </button>
                    <a href="/main">
                        <button href="/main"
                                type="button"
                                class="btn btn-danger ml-2">Cancel
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </form>
</@c.page>