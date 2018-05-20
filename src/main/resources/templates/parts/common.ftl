<#macro page>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Achater</title>
    <link rel="shortcut icon" href="/static/img/logo.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link rel="stylesheet" href="/static/css/app.css">
    <script type="text/javascript" src="/static/js/app.js"></script>
    <script type="text/javascript" src="/static/js/settings.js"></script>
    <script type="text/javascript" src="/static/js/moment.min.js"></script>
    <script type="text/javascript" src="/static/js/moment-with-locales.min.js"></script>
</head>
<body>
    <#include "navbar.ftl">
    <#setting locale="en">
    <#setting date_format="dd-MM-yyyy">
<div class="container mt-5">
<#nested>
</div>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
        integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
        crossorigin="anonymous"></script>
</body>
</html>
</#macro>