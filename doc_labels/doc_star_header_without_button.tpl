<header class="navbar navbar-static-top navbar-fixed-top manual-header" role="banner">
    <div class="container">
        <div class="navbar-header col-sm-12 col-md-9 col-lg-8">
            <a href="{{.BaseUrl}}/" class="navbar-brand" title="{{.SITE_NAME}}">
                {{if .SITE_TITLE}}
                {{.SITE_TITLE}}
                {{else}}
                {{.SITE_NAME}}
                {{end}}
            </a>
        </div>
    </div>
</header>