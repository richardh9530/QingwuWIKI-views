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
<a href="http://heaven/" class="btn btn-default" style="margin-left: 10px;"><i class="fa"></i> WisdomQingwu</a>
<a href="http://heaven/heaven/" class="btn btn-default" style="margin-left: 10px;"><i class="fa"></i> 清无时空</a>

<div class="navbar-header pull-right manual-menu">
{{/*<a href="http://heaven/heaven/" id="printSinglePage" class="btn btn-info" style="margin-right: 10px;"><i class="fa"></i> 清无时空</a>*/}}
{{/*<a href="javascript:window.print();" id="printSinglePage" class="btn btn-default" style="margin-right: 10px;"><i class="fa fa-print"></i> 打印</a>*/}}
                {{if gt .Member.MemberId 0}}
                {{if eq .Model.RoleId 0 1 2}}
                <div class="dropdown pull-right">
                    <a href="{{urlfor "DocumentController.Edit" ":key" .Model.Identify ":id" ""}}" class="btn btn-success"><i class="fa fa-edit" aria-hidden="true"></i> 编辑</a>
                    {{if eq .Model.RoleId 0 1}}
                    <a href="{{urlfor "BookController.Setting" ":key" .Model.Identify}}" class="btn btn-primary"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                    {{end}}
                </div>
                {{end}}
                {{end}}
                {{/*<div class="dropdown pull-right" style="margin-right: 10px;">
                    <a href="{{urlfor "HomeController.Index"}}" class="btn btn-default"><i class="fa fa-home" aria-hidden="true"></i> 首页</a>
                </div>*/}}
                <div class="dropdown pull-right" style="margin-right: 10px;">
                {{if eq .Model.PrivatelyOwned 0}}
                {{if .Model.IsEnableShare}}
                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#shareProject"><i class="fa fa-share-square" aria-hidden="true"></i> 分享</button>
                {{end}}
                {{end}}
                </div>
                {{if .Model.IsDownload}}
                <div class="dropdown pull-right" style="margin-right: 10px;">
                    <button type="button" class="btn btn-primary" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-cloud-download" aria-hidden="true"></i> 下载 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="margin-top: -5px;">
                        <li><a href="{{urlfor "DocumentController.Export" ":key" .Model.Identify "output" "pdf"}}" target="_blank">PDF</a> </li>
                        <li><a href="{{urlfor "DocumentController.Export" ":key" .Model.Identify "output" "epub"}}" target="_blank">EPUB</a> </li>
                        <li><a href="{{urlfor "DocumentController.Export" ":key" .Model.Identify "output" "mobi"}}" target="_blank">MOBI</a> </li>
                        <li><a href="{{urlfor "DocumentController.Export" ":key" .Model.Identify "output" "docx"}}" target="_blank">Word</a> </li>
                        {{if eq .Model.Editor "markdown"}}
                        <li><a href="{{urlfor "DocumentController.Export" ":key" .Model.Identify "output" "markdown"}}" target="_blank">Markdown</a> </li>
                        {{end}}
                    </ul>
                </div>
                {{end}}
            </div>
        </div>
    </header>
    <article class="container-fluid manual-body">
            <div class="manual-article">
                <div class="article-head">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-2">

                            </div>
                            <div class="col-md-8 text-center">
                                <h1 id="article-title">{{.Title}}</h1>
                            </div>
                            <div class="col-md-2">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="article-content">
                    <div class="article-body  {{if eq .Model.Editor "markdown"}}markdown-body editormd-preview-container{{else}}editor-content{{end}}"  id="page-content">
{{/*                        {{.Content}}*/}}
                    </div>
                    <div class="jump-top">
                        <a href="javascript:;" class="view-backtop"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
                    </div>
                </div>

        </div>
        <div class="manual-progress"><b class="progress-bar"></b></div>
    </article>
    <div class="manual-mask"></div>
</div>


{{if .Model.IsEnableShare}}
<!-- 分享项目 -->
<div class="modal fade" id="shareProject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">项目分享</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 text-center" style="padding-bottom: 15px;">
                        <img src="{{urlfor "DocumentController.QrCode" ":key" .Model.Identify}}" alt="扫一扫手机阅读" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">项目地址</label>
                    <div class="col-sm-10">
                        <input type="text" value="{{urlfor "DocumentController.Index" ":key" .Model.Identify}}" class="form-control" onmouseover="this.select()" id="projectUrl" title="项目地址">
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
{{end}}
<!-- 下载项目 -->
<div class="modal fade" id="downloadBookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">项目分享</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-sm-12 text-center" style="padding-bottom: 15px;">
                        <img src="{{urlfor "DocumentController.QrCode" ":key" .Model.Identify}}" alt="扫一扫手机阅读" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">项目地址</label>
                    <div class="col-sm-10">
                        <input type="text" value="{{urlfor "DocumentController.Index" ":key" .Model.Identify}}" class="form-control" onmouseover="this.select()" id="projectUrl" title="项目地址">
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
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
    $("#searchList").on("click","a",function () {
        var id = $(this).attr("data-id");
        var url = "{{urlfor "DocumentController.Read" ":key" .Model.Identify ":id" ""}}/" + id;
        $(this).parent("li").siblings().find("a").removeClass("active");
        $(this).addClass("active");
        loadDocument(url,id,function (body) {
            return $(body).highlight(window.keyword);
        });
    });

    /**
     * tui-editor 新增
     */
    if(window.use_tui){
        load_html_to_tui_viewer('{{.Content}}')  // 加载正文
    }else{
    	$("#page-content").html('{{.Content}}')
    }
    console.log(document.getElementsByTagName("table"))
    $("table").tablesorter({debug: false});  // table 排序


});
</script>
{{.Scripts}}
</body>
</html>