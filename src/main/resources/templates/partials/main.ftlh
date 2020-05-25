<#macro renderWith title="Welcome to Forum!" scripts=["https://code.jquery.com/jquery-3.4.1.slim.min.js","https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js","https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"] styles=["css/main.css","https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css","https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"]>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta name="_csrf_header" content="${_csrf.headerName}" />
        <meta name="_csrf_token" content="${_csrf.token}" />

        <title>${title}</title>

        <#list styles as styleSource>
            <link rel="stylesheet" href="${styleSource}">
        </#list>
    </head>
    <body>

        <div class="container">
            <div class="row header-1">
                <div class="col-2">
                    <div class="brain">
                        <a href="/" class="btn-1">
                            <i class="fas fa-comments"></i>
                        </a>
                    </div>
                </div>
                <div class="col-6">
                    <span style="font-size: 4em; color: #3498db">Messenger</span>
                </div>
                <#if user??>
                    <input type="hidden" id="authorization" value="1">
                    <div class="col-3">
                        <h6>Hello, <a class="flex box-128" href="/profile">${user.name}</a></h6>
                        <form action="/logout" method="post" id="form-logout" class="flex box-128">
                            <#if _csrf??>
                                <input type="hidden" name="${(_csrf.parameterName)!'csrf'}" value="${(_csrf.token)!'--no-token--'}"/>
                            </#if>
                            <button type="submit" class="flex box-128 logout-button btn btn-light"> Logout </button>
                        </form>
                    </div>
                </#if>
                <#if nouser??>
                    <input type="hidden" id="authorization" value="0">
                    <div class="col-3">
                        <a class="flex box-128 btn btn-success" href="/registration"><h6> Sign in </h6></a>
                        <a class="flex box-128 btn btn-primary" href="/login"><h6> Login </h6></a>
                    </div>
                </#if>
            </div>
            <#--
             элемент nested указывает что в этом место
             будет подставлено некоторое содержимое,
             которое передаётся как тело макро-функции при её вызове
            -->
            <#nested>



        </div>

    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>
        
    </body>
</html>
</#macro>