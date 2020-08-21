<!DOCTYPE html>
<html lang="zh-CN">
<head>

    <title>{{.Title}} - Powered by QingwuWIKI</title>    <!--Qingwu Add-->    <link href="/static/images/favicon.ico" mce_href="favicon.ico" rel="icon" type="image/x-icon">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta name="author" content="QingwuWIKI" />
    <meta name="site" content="https://www.qingwu.me" />
    <meta name="keywords" content="QingwuWIKI知识管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理,{{.Model.BookName}},{{.Title}}">
    <meta name="description" content="{{.Title}}-{{if .Description}}{{.Description}}{{else}}{{.Model.Description}}{{end}}">

    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">

    <link href="{{cdncss "/static/jstree/3.3.4/themes/default/style.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/nprogress/nprogress.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/kancloud.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/jstree.css"}}" rel="stylesheet">

    <link href="{{cdncss "/static/editor.md/lib/mermaid/mermaid.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/editor.md/lib/sequence/sequence-diagram-min.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/editor.md/css/editormd.preview.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/markdown.preview.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss (print "/static/editor.md/lib/highlight/styles/" .HighlightStyle ".css") "version"}}" rel="stylesheet">

    <link href="{{cdncss "/static/katex/katex.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/print.css" "version"}}" media="print" rel="stylesheet">
    <!-- tui-editor Styles -->
    <link href="{{cdncss "/static/tui-editor/css/tui-editor.css"}}" rel="stylesheet"></link>
    <link href="{{cdncss "/static/tui-editor/css/tui-editor-contents.css"}}" rel="stylesheet"></link>
    <link href="{{cdncss "/static/tui-editor/css/codemirror.css"}}" rel="stylesheet"></link>
    <link href="{{cdncss "/static/tui-editor/css/github.min.css"}}" rel="stylesheet"></link>

    <script type="text/javascript">
    	window.book={"identify":"{{.Model.Identify}}"};
    	window.use_tui = false;
    </script>
</head>
<body>
<div class="m-manual manual-mode-view manual-reader">
    <header class="navbar navbar-static-top manual-head" role="banner">
        <div class="container-fluid">
            <div class="navbar-header pull-left manual-title">
            <div class="dropdown pull-left" style="margin-right: 10px;">
                <button type="button" class="btn btn-default" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-exchange" aria-hidden="true"></i> 切换项目 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="margin-top: -5px;">
                    <li><a href="/docs/wisdom" target="_self">智慧清无</a> </li>
                    <li><a href="/docs/research" target="_self">Research</a> </li>
                    <li><a href="/docs/computer" target="_self">CS编程相关</a> </li>
                    <li><a href="/docs/encyclopedia" target="_self">清无百科</a> </li>
                    <li><a href="/docs/basics" target="_self">学科基础知识</a> </li>
                    <li><a href="/docs/books" target="_self">清无典藏书库</a> </li>
                </ul>
            </div>
                <span class="slidebar" id="slidebar"><i class="fa fa-align-justify"></i></span>
                <a href="{{urlfor "DocumentController.Index" ":key" .Model.Identify}}" title="{{.Model.BookName}}" class="book-title">{{.Model.BookName}}</a>
                [<a href="/qingwu/view_knowledge_graph/{{.Model.BookId}}">
                    查看图谱
                </a>]
                <span style="font-size: 12px;font-weight: 100;"></span>
            </div>
                	&nbsp;
            <a href="{{urlfor "HomeController.Index"}}" class="btn btn-default"><i class="fa fa-home" aria-hidden="true"></i> 首页</a>

        </div>
    </header>
    <article class="container-fluid manual-body">
        {{template "widgets/header.tpl" .}}
        <div class="container manual-body">
        <div class="search-head">
        <strong class="search-title">星标文档</strong>
        </div>
        <div class="row">
        <div class="manual-list">
        {{range $index,$item := .Lists}}
        <div class="search-item">
        <div class="title">
        <a href="{{urlfor "DocumentController.ReadByBookId" ":book_id" $item.BookId ":id" $item.Identify}}" title="{{$item.DocumentName}}" target="_blank">{{str2html $item.DocumentName}}</a>
        </div>
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
    </article>
    <div class="manual-mask"></div>
</div>

{{template "widgets/quick_links.tpl" .}}
<script src="{{cdnjs "/static/js/jquery.form.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/layer/layer.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/jstree/3.3.4/jstree.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/nprogress/nprogress.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/editor.md/lib/highlight/highlight.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/js/jquery.highlight.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/js/jquery.tablesorter.min.js"}}" type="text/javascript"></script>
<!-- tui-editor Scripts -->
<script src="{{cdnjs "/static/tui-editor/js/tui-editor-Viewer-full.js"}}" type="text/javascript" ></script>

<script src="{{cdnjs "/static/js/kancloud.js" "version"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/js/splitbar.js" "version"}}" type="text/javascript"></script>


<script type="text/javascript">
$(function () {


});
</script>
{{.Scripts}}
</body>
</html>