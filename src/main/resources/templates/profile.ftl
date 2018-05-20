<#import "parts/common.ftl" as c>

<@c.page>
    ${message?ifExists}
<div class="card" xmlns="http://www.w3.org/1999/html">
    </br>
    <div class="container">
        <div class="fb-profile">
            <img align="left" class="fb-image-lg" src="/static/img/back.jpg"
                 style="border-radius: 3px;"
                 alt="Profile image example"/>
            <img align="left" class="fb-image-profile thumbnail shadow-profile-icon" src="/img/${filename}"
                 style="border-radius: 120px;"
                 alt="Profile image example"/>
            <div class="fb-profile-text">
                <h1>${username} <img src="/static/img/correct.png"
                                     data-toggle="collapse"
                                     href="#collapseNewMessage"
                                     role="button"
                                     aria-expanded="false"
                                     aria-controls="collapseNewMessage"
                                     style="width: 4%;"
                /></h1>
                <div>
                    country: <a><img src="/static/img/flag/${country}.ico"
                                     style="width: 3%;"/><i> ${country}</i></a>
                </div>
                <div>
                    adress: <a><img src="/static/img/marker.png"
                                    style="width: 3%;"/><i> ${adress}</i></a>
                </div>
                <div>
                    email: <a href="mailto:${useremail}"><i>${useremail}</i></a>
                </div>
                <div>
                    tel: <a><i>${usertel}</i></a>
                </div>
                <div>
                    date reg.: <a><i id="user_id_${username}">${datereg}</i></a>
                </div>
                <script>
                    var date = unixTimeToDate(${datereg?replace(" ","")?replace(",","")});
                    document.getElementById("user_id_${username}").innerHTML = date;
                </script>
                <div class="form-group row">
                    <a href="${facebook!'#'}" target="_blank">
                        <img src="/static/img/social/facebook.png" class="social-logo"/>
                    </a>
                    <a href="${google!'#'}" target="_blank">
                        <img src="/static/img/social/google.png" class="social-logo"/>
                    </a>
                    <a href="${linkedin!'#'}" target="_blank">
                        <img src="/static/img/social/linkedin.png" class="social-logo"/>
                    </a>
                    <a href="skype:${skype!'#'}?chat">
                        <img src="/static/img/social/skype.png" class="social-logo"/>
                    </a>
                    <a href="viber://chat?number=${usertel!'#'}">
                        <img src="/static/img/social/viber.png" class="social-logo"/>
                    </a>
                    <a href="${twitter!'#'}" target="_blank">
                        <img src="/static/img/social/twitter.png" class="social-logo"/>
                    </a>
                    <a href="${vk!'#'}" target="_blank">
                        <img src="/static/img/social/vk.png" class="social-logo"/>
                    </a>
                </div>
            </div>
        </div>
    </div>
    </br>
</div>
</br>
<form method="post" enctype="multipart/form-data">
    <div class="collapse" id="collapseNewMessage">
        <div class="card">
            <div class="card-header">
                Edit profile: <b><i>${username}</i></b>
            </div>
            <div class="card-body">
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Password:</label>
                    <div class="col-sm-10">
                        <input type="password" name="password" class="form-control"
                               required placeholder="Password" value="${password!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Telephone:</label>
                    <div class="col-sm-10">
                        <input type="tel" name="usertel" class="form-control" required
                               pattern="^\+375[0-9]{9}$" placeholder="Telephone" value="${usertel!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">email:</label>
                    <div class="col-sm-10">
                        <input type="email" name="useremail" class="form-control" required placeholder="email"
                               value="${useremail!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">adress:</label>
                    <div class="col-sm-10">
                        <input type="text" name="adress" class="form-control" placeholder="Adress"
                               value="${adress!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <!-- COUNTRY SELECT -->
                    <label class="col-sm-2 col-form-label">Country:</label>
                    <div class="col-sm-10">
                        <input id="selectPublisYear"
                               name="countyname"
                               value="${country}"
                               class="form-control"
                               type="text" list="country-list">
                        <datalist id="country-list">
                            <#list countries as county>
                                <option value="${county.countryName}">
                                    <a>${county.countryName}</a>
                                </option>
                            </#list>
                        </datalist>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">vk:</label>
                    <div class="col-sm-10">
                        <input type="text" name="vk" class="form-control" placeholder="vk"
                               value="${vk!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">twitter:</label>
                    <div class="col-sm-10">
                        <input type="text" name="twitter" class="form-control" placeholder="twitter"
                               value="${twitter!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">skype:</label>
                    <div class="col-sm-10">
                        <input type="text" name="skype" class="form-control" placeholder="skype"
                               value="${skype!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">linkedin:</label>
                    <div class="col-sm-10">
                        <input type="text" name="linkedin" class="form-control" placeholder="linkedin"
                               value="${linkedin!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Facebook:</label>
                    <div class="col-sm-10">
                        <input type="text" name="facebook" class="form-control" placeholder="facebook"
                               value="${facebook!''}"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Google+:</label>
                    <div class="col-sm-10">
                        <input type="text" name="google" class="form-control" placeholder="google"
                               value="${google!''}"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="filename" id="customFile" required style="display: none">
                        <label class="custom-file-label" required for="customFile">Add photo</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type="submit">Save</button>
                <a data-toggle="collapse"
                   href="#collapseNewMessage"
                   role="button" style="margin-left: -7px;">
                    <button type="button" class="btn btn-danger ml-2">Cancel</button>
                </a>
            </div>
        </div>
    </div>
</form>
</br>
<a href="/main">
    <button href="/main" type="button" class="btn btn-primary btn-mini" style="width: auto;">
        <image src="/static/img/back.png" style="width: 20px; margin-right: 5px;">Back
    </button>
</a>
</br>
</br>
</@c.page>