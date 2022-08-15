<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>{{.SITE_NAME}} - Powered by QingwuWIKI</title>    <!--Qingwu Add-->    <link href="/static/images/favicon.ico" mce_href="favicon.ico" rel="icon" type="image/x-icon">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta name="author" content="Minho" />
    <meta name="site" content="https://www.iminho.me" />
    <meta name="keywords" content="QingwuWIKI知识管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理">
    <meta name="description" content="QingwuWIKI知识管理系统 {{.site_description}}">
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">

</head>
<body>
<div class="manual-reader manual-container">
    {{template "widgets/header.tpl" .}}
    <div class="container manual-body">
        <div class="row">
             <div class="manual-list">
                     <div class="list-item">
                         <dl class="manual-item-standard">
                             <dt>
                                 <a href="http://qingwu/wiki/docs/materials" title="材料总库-admin" target="_blank">
                                     <img src="http://qingwu/static/qingwuwiki/qingwu/images/uploads/201803/cover_151ec5c513eceb14_small.jpg" class="cover" alt="材料总库-admin">
                                 </a>
                             </dt>
                             <dd>
                                 <a href="/qingwu/view_knowledge_graph/" class="name"
                                     title="材料总库-admin"
                                     >材料总库
                                 </a>
                             </dd>
                             <dd>
                             <span class="author">
                                 <b class="text">作者</b>
                                 <b class="text">-</b>
                                 <b class="text">admin</b>
                             </span>
                             </dd>
                         </dl>
                     </div>
                {{range $index,$item := .Lists}}
                    <div class="list-item">
                        <dl class="manual-item-standard">
                            <dt>
                                <a href="{{urlfor "DocumentController.Index" ":key" $item.Identify}}" title="{{$item.BookName}}-{{$item.CreateName}}">
                                    <img src="{{cdnimg $item.Cover}}" class="cover" alt="{{$item.BookName}}-{{$item.CreateName}}" onerror="this.src='{{cdnimg "static/images/book.jpg"}}';">
                                </a>
                            </dt>
                            <dd>
                                <a href="/qingwu/view_knowledge_graph/{{$item.BookId}}" class="name"
                                    title="{{$item.BookName}}-{{$item.CreateName}}"
                                    >{{$item.BookName}}
                                </a>
                            </dd>
                            {{/*<dd>*/}}
                                {{/*<a href="{{urlfor "DocumentController.Index" ":key" $item.Identify}}" class="name"*/}}
                                 {{/*title="{{$item.BookName}}-{{$item.CreateName}}"*/}}
                                 {{/*target="_blank">{{$item.BookName}}*/}}
                                {{/*</a>*/}}
                            {{/*</dd>*/}}
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
                    <div class="text-center" style="height: 200px;margin: 100px;font-size: 28px;">暂无项目</div>
                {{end}}
                <div class="clearfix"></div>
            </div>
            <nav class="pagination-container">
                {{if gt .TotalPages 1}}
                {{.PageHtml}}
                {{end}}
                <div class="clearfix"></div>
            </nav>
        </div>
    </div>
    {{template "widgets/footer.tpl" .}}
</div>
{{template "widgets/quick_links.tpl" .}}
{{.Scripts}}
</body>
</html>