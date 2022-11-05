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
    <style>
        .searchbar{
            padding: 8px;
        }
        .searchbar .search-btn {
            display: inline-block;
            line-height: 100%;
            cursor: pointer;
            margin-top: -10px;
            margin-left: -45px;
            border: 0;
            background-color: transparent
        }
        .searchbar .search-btn>i.fa{
            padding: 10px;
        }
        .manual-search-reader .manual-body{
            margin-top: 60px;
        }
        .manual-search-reader .search-head{
            margin: 10px auto;
            padding-bottom: 15px;
            line-height: 1.5em;
            border-bottom: 3px solid #EEEEEE;
        }
        .manual-search-reader .search-head .search-title{
            font-size: 22px;
            font-weight: 300;
        }
        .manual-search-reader .search-body {
            margin-top: 80px;
        }
        .manual-search-reader .search-empty{
        	margin:150px auto;
        	text-align:center;
        }
        .manual-search-reader .search-empty .empty-text {
            font-size: 18px;
            display: block;
            margin: 24px;
            text-align: center;
            opacity: .5;
            filter: alpha(opacity=50)
        }
        .manual-search-reader .search-empty .empty-image{
            margin: 5px auto;
            display: block;
            text-align: center;
            opacity: 0.3;
            filter: alpha(opacity=30);
        }
        .manual-search-reader .search-item{
            margin: 0 15px;
            padding: 10px 20px;
            line-height: 25px;
            word-break: break-word;
        }
        .manual-search-reader .search-item:hover{
            background-color: #F5F5F5;
        }
        .manual-search-reader .search-item a{
            color: #0886E9;
        }
        .manual-search-reader .search-item em{
            color: #FF802C;
            font-style:normal;
        }
        .manual-search-reader .search-item .title{
            font-size: 16px;
            font-weight: 400;
        }
        .manual-search-reader .search-item .description{
            color: #666;
            line-height: 25px;
            min-height: 20px;
            font-size: 12px;
        }
        .manual-search-reader .search-item .site {
            overflow: hidden;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            white-space: nowrap;
            max-width: 600px;
            color: #008000;
            font-size: 12px;
        }
        .manual-search-reader .search-item .source .item {
            display: inline-block;
            margin-right: 15px;
        }
        .manual-search-reader .search-item .source,.manual-search-reader .search-item .source a{
            font-size: 12px;
            color: #999999;
        }

    </style>

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

            <a href="{{urlfor "HomeController.Index"}}" class="btn btn-default"><i class="fa fa-home" aria-hidden="true"></i> 首页</a>
            &nbsp;

            <div class="dropdown pull-left" style="margin-right: 10px;">
                <button type="button" class="btn btn-default" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-exchange" aria-hidden="true"></i> 切换项目 <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel" style="margin-top: -5px;">
<li><a href="http://qingwu/wiki/docs/materials" target="_self">材料总库</a> </li>
<li><a href="http://qingwu/wiki/docs/resume" target="_self">简历总库</a> </li>
<li><a href="http://qingwu/wiki/docs/references" target="_self">资料合集</a> </li>
<li><a href="/docs/wisdom" target="_self">智慧清无</a> </li>
<li><a href="/docs/encyclopedia" target="_self">清无百科</a> </li>
<li><a href="/docs/computer" target="_self">CS编程相关</a> </li>
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

<a href="{{urlfor "DocumentController.Edit" ":key" .Model.Identify ":id" ""}}"  style="margin-left: 10px;" class="btn btn-success">
    <i class="fa fa-edit" aria-hidden="true"></i> 编辑</a>

<!--/*2021.03.10更新：新增搜索功能*/-->
&nbsp;
<div class="searchbar" style="display:inline">
    <form class="form-inline" action="{{urlfor "SearchController.Index"}}" method="get" style="display:inline">
        <input class="form-control" name="keyword" type="search" style="width: 200px;" placeholder="请输入关键词..." value="{{.Keyword}}">
        <button class="search-btn">
            <i class="fa fa-search"></i>
        </button>
    </form>
</div>

<a href="http://heaven/" class="btn btn-default" style="margin-left: 10px;"><i class="fa"></i> WisdomQingwu</a>

<a href="http://heaven/heaven/" class="btn btn-default" style="margin-left: 10px;"><i class="fa"></i> 清无时空</a>

	<!--/*20200901更新：此处标签为全局标签，故不展示*/
<a href="{{urlfor "DocumentLabelController.List" }}" style="margin-left: 10px;" class="btn btn-default">
	<i class="fa fa-tag" aria-hidden="true"></i> 标签列表</a>-->

<a href="{{urlfor "DocumentStarController.Index" ":book_id" .Model.BookId }}"
    style="margin-left: 10px;" class="btn btn-default">
        <i class="fa fa-star" aria-hidden="true"></i> 星标文档</a>

{{if eq .Model.BookId 8}}
    <a href="{{urlfor "DocumentStarController.IsResume" ":book_id" .Model.BookId }}"
    style="margin-left: 10px;" class="btn btn-default">
    <i class="fa fa-address-book-o" aria-hidden="true"></i> 查看简历</a>
{{end}}

{{if eq .Model.BookId 5}}
<a href="{{urlfor "DocumentStarController.IsDoc" ":book_id" .Model.BookId }}"
style="margin-left: 10px;" class="btn btn-default">
<i class="fa fa-file-text-o" aria-hidden="true"></i> 查看公文</a>
{{end}}

<div class="navbar-header pull-right manual-menu">
{{/*<a href="http://heaven/heaven/" id="printSinglePage" class="btn btn-info" style="margin-right: 10px;"><i class="fa"></i> 清无时空</a>*/}}
{{/*<a href="javascript:window.print();" id="printSinglePage" class="btn btn-default" style="margin-right: 10px;"><i class="fa fa-print"></i> 打印</a>*/}}
                {{if gt .Member.MemberId 0}}
                {{if eq .Model.RoleId 0 1 2}}
                <div class="dropdown pull-right">
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
        <div class="manual-left">
            <div class="manual-tab">
                <div class="tab-navg">
                    <span data-mode="view" class="navg-item active"><i class="fa fa-align-justify"></i><b class="text">目录</b></span>
                    <span data-mode="search" class="navg-item"><i class="fa fa-search"></i><b class="text">搜索</b></span>
                </div>
                <div class="tab-util">
                    <span class="manual-fullscreen-switch">
                        <b class="open fa fa-angle-right" title="展开"></b>
                        <b class="close fa fa-angle-left" title="关闭"></b>
                    </span>
                </div>
                <div class="tab-wrap">
                    <div class="tab-item manual-catalog">
                        <div class="catalog-list read-book-preview" id="sidebar">
                        {{.Result}}
                        </div>
                    </div>
                    <div class="tab-item manual-search">
                        <div class="search-container">
                            <div class="search-form">
                                <form id="searchForm" action="{{urlfor "DocumentController.Search" ":key" .Model.Identify}}" method="post">
                                    <div class="form-group">
                                        <input type="search" placeholder="请输入搜索关键字" class="form-control" name="keyword">
                                        <button type="submit" class="btn btn-default btn-search" id="btnSearch">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                            <div class="search-result">
                                <div class="search-empty">
                                    <i class="fa fa-search-plus" aria-hidden="true"></i>
                                    <b class="text">暂无相关搜索结果！</b>
                                </div>
                                <ul class="search-list" id="searchList">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-copyright">
                <p>
                    本文档使用 <a href="#">QingwuWIKI</a> 发布
                </p>
            </div>
        </div>
        <div class="manual-right">
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
                    <!--
                    {{/*
                    {{if .Model.IsDisplayComment}}
                    <div id="articleComment" class="m-comment">
                        <div class="comment-result">
                            <strong class="title">相关评论(<b class="comment-total">{{.Model.CommentCount}}</b>)</strong>
                            <div class="comment-post">
                                <form class="form" action="/comment/create" method="post">
                                    <label class="enter w-textarea textarea-full">
                                        <textarea class="textarea-input form-control" name="content" placeholder="文明上网，理性发言" style="height: 72px;"></textarea>
                                        <input type="hidden" name="doc_id" value="118003">
                                    </label>
                                    <div class="util cf">
                                        <div class="pull-left"><span style="font-size: 12px;color: #999"> 支持Markdown语法 </span></div>
                                        <div class="pull-right">
                                            <span class="form-tip w-fragment fragment-tip">Ctrl + Enter快速发布</span>
                                            <label class="form-submit w-btn btn-success btn-m">
                                                <button class="btn btn-success btn-sm" type="submit">发布</button>
                                            </label>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="clearfix"></div>
                            <div class="comment-list">
                                <div class="comment-empty"><b class="text">暂无相关评论</b></div>
                                <div class="comment-item" data-id="5841">
                                    <p class="info"><a href="/@phptest" class="name">静夜思</a><span class="date">9月1日评论</span></p>
                                    <div class="content">一直不明白，控制器分层和模型分层调用起来到底有什么区别</div>
                                    <p class="util">
                                        <span class="vote">
                                            <a class="agree e-agree" href="javascript:;" data-id="5841" title="赞成">
                                                <i class="fa fa-thumbs-o-up"></i></a><b class="count">4</b>
                                            <a class="oppose e-oppose" href="javascript:;" data-id="5841" title="反对"><i class="fa fa-thumbs-o-down"></i></a>
                                        </span>
                                        <a class="reply e-reply" data-account="phptest">回复</a>
                                        <span class="operate toggle">
                                            <a class="delete e-delete" data-id="5841" data-href="/comment/delete"><i class="icon icon-cross"></i></a>
                                            <span class="number">23#</span>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    {{end}}
*/}}-->
                    <div class="jump-top">
                        <a href="javascript:;" class="view-backtop"><i class="fa fa-arrow-up" aria-hidden="true"></i></a>
                    </div>
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