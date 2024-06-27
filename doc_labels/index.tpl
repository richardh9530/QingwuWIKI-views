<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>{{.LabelName}} - Powered by QingwuWIKI</title>    <!--Qingwu Add-->    <link href="/static/images/favicon.ico" mce_href="favicon.ico" rel="icon" type="image/x-icon">
    <meta name="keywords" content="WIKI知识管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理,{{.LabelName}}">
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
            <strong class="search-title">显示标签为"{{.LabelName}}"的文档</strong>
        </div>
        <div class="row">
            <div class="manual-list">
                {{range $index,$item := .Lists}}
                <div class="search-item">
                    <div class="title">
                        <a href="{{urlfor "DocumentController.ReadByBookId" ":book_id" $item.BookId ":id" $item.Identify}}" title="{{$item.DocumentName}}" target="_blank">{{str2html $item.DocumentName}}</a>
                    </div>
                    {{/*<div class="description">*/}}
                    {{/*{{str2html $item.Description}}*/}}
                    {{/*</div>*/}}
                    {{/*<div class="source">*/}}
                    {{/*{{if eq $item.SearchType "document"}}*/}}
                    {{/*<span class="item">来自项目：<a href="{{urlfor "DocumentController.Index" ":key" $item.BookIdentify}}" target="_blank">{{$item.BookName}}</a></span>*/}}
                    {{/*{{else}}*/}}
                    {{/*<span class="item">来自文章：<a href="{{urlfor "BlogController.Index" ":id" $item.DocumentId}}" target="_blank">{{$item.BookName}}</a></span>*/}}
                    {{/*{{end}}*/}}
                    {{/*<span class="item">作者：{{$item.Author}}</span>*/}}
                    {{/*<span class="item">更新时间：{{date_format  $item.ModifyTime "2006-01-02 15:04:05"}}</span>*/}}
                    {{/*</div>*/}}
                </div>
                {{else}}
                    <div class="text-center" style="height: 200px;margin: 100px;font-size: 28px;">暂无文档</div>
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