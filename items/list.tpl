<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>项目空间{{.Model.ItemName}}的项目列表 - Powered by QingwuWIKI</title>    <!--Qingwu Add-->    <link href="/static/images/favicon.ico" mce_href="favicon.ico" rel="icon" type="image/x-icon">
    <meta name="keywords" content="WIKI知识管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理,{{.Model.ItemName}}">
    <meta name="description" content="WIKI知识管理系统 {{.site_description}}">
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">

    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
</head>
<body>
<div class="manual-reader manual-container manual-search-reader">
{{template "widgets/header.tpl" .}}
    <div class="container manual-body">
        <div class="search-head">
            <strong class="search-title">显示项目空间为"{{.Model.ItemName}}"的项目</strong>
        </div>
        <div class="row">
            <div class="manual-list">
            {{range $index,$item := .Lists}}
                <div class="list-item">
                    <dl class="manual-item-standard">
                        <dt>
                            <a href="{{urlfor "DocumentController.Index" ":key" $item.Identify}}" title="{{$item.BookName}}-{{$item.CreateName}}" target="_blank">
                                <img src="{{cdnimg $item.Cover}}" class="cover" alt="{{$item.BookName}}-{{$item.CreateName}}">
                            </a>
                        </dt>
                        <dd>
                            <a href="{{urlfor "DocumentController.Index" ":key" $item.Identify}}" class="name" title="{{$item.BookName}}-{{$item.CreateName}}" target="_blank">{{$item.BookName}}</a>
                        </dd>
                        <dd>
                            <span class="author">
                                <b class="text">作者</b>
                                <b class="text">-</b>
                                <b class="text">{{if eq $item.RealName "" }}{{$item.CreateName}}{{else}}{{$item.RealName}}{{end}}</b>
                            </span>
                        </dd>
                    </dl>
                </div>
            {{else}}
                <div class="search-empty">
                    <img src="{{cdnimg "/static/images/search_empty.png"}}" class="empty-image">
                    <span class="empty-text">暂无项目</span>
                </div>
            {{end}}

                <div class="clearfix"></div>
            </div>
            <nav class="pagination-container">
            {{.PageHtml}}
            </nav>
        </div>
    </div>
{{template "widgets/footer.tpl" .}}
</div>
{{template "widgets/quick_links.tpl" .}}
{{.Scripts}}
</body>
</html>