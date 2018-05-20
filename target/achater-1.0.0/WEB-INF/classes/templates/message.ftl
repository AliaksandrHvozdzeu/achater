<#import "parts/common.ftl" as c>

<@c.page>
    <!-- ЧИТАЕМ СООБЩЕНИЕ -->
    <#list messages as message>
    <div class="card">
        <div class="card-header">
            <i>${message.authorName}</i>
        </div>
        <div class="card-body">
            <h5 class="card-title">#${message.tag}</h5>

            <#if message.filename??>
               <img src="/img/${message.filename}" class="card-img-top" style="width: 90%; margin-left: 5%;">
            </#if>

            <p class="card-text text-justify">${message.text}</p>
            <a href="/main">
                <button href="/main" type="button" class="btn btn-primary btn-mini" style="width: auto;">
                    <image src="/static/img/back.png" style="width: 20px; margin-right: 5px;">Back
                </button>
            </a>
        </div>
    </div>

    <div>
        <span>
            </br>
            </br>
            </br>
        </span>
    </div>
    </#list>
</@c.page>