<#import "parts/common.ftl" as c>

<@c.page>
    <div class="container">
        <h3>Form edit data of user: ${user.username}</h3>
        <form action="/user" method="post"  enctype="multipart/form-data">
            <div class="form-group">
                <label for="usr">Name:</label>
                <input type="text" class="form-control" id="usr" name="username" required value="${user.username}">
            </div>
            <div class="form-group">
                <label for="usr">Password:</label>
                <input type="text" class="form-control" id="psw" name="password" required value="${user.password}">
            </div>
            <div class="form-group">
                <label for="usr">Telephone number:</label>
                <input type="text" class="form-control" id="tel" name="usertel" required value="${user.usertel}">
            </div>
            <div class="form-group">
                <label for="usr">Email:</label>
                <input type="text" class="form-control" id="eml" name="useremail" required value="${user.useremail}">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file" id="customFile" required style="display: none">
                    <label class="custom-file-label" required for="customFile">Add photo</label>
                </div>
            </div>
            <#list roles as role>
                <div class="form-group row ml-4 d-inline">
                    <label><input type="checkbox"
                                  name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                    </label>
                </div>
            </#list>
            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <div class="form-group row ml-0">
                <button class="btn btn-primary" type="submit">Save</button>
                <a href="/user">
                    <button href="/user" type="button" class="btn btn-danger ml-2">Cancel</button>
                </a>
            </div>
        </form>
    </div>
</@c.page>