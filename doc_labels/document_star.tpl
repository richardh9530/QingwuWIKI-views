<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>星标文档 - Powered by QingwuWIKI</title>    <!--Qingwu Add-->    <link href="/static/images/favicon.ico" mce_href="favicon.ico" rel="icon" type="image/x-icon">
<meta name="keywords" content="QingwuWIKI知识管理系统,WIKI,wiki,wiki在线,文档在线管理,接口文档在线管理,接口文档管理,{{.LabelName}}">
<meta name="description" content="QingwuWIKI知识管理系统 {{.site_description}}">
<!-- Bootstrap -->
<link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
<link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">

<link href="{{cdncss "/static/css/main.css" "version"}}" rel="stylesheet">
</head>
<body>
    <div class="manual-reader manual-container manual-search-reader">
        {{if eq .Remarks "is_doc"}}
            {{template "doc_labels/doc_star_header_without_button.tpl" .}}
        {{else if eq .Remarks "is_resume"}}
            {{template "doc_labels/doc_star_header_without_button.tpl" .}}
        {{else}}
            {{template "doc_labels/doc_star_header.tpl" .}}
        {{end}}

        <div class="container manual-body">
            <div class="search-head">
                {{if eq .Remarks "is_doc"}}
                    <strong class="search-title">公文列表</strong>
                {{else if eq .Remarks "is_resume"}}
                    <strong class="search-title">简历列表</strong>
                {{else}}
                    <strong class="search-title">星标文档</strong>
                {{end}}
            </div>
            <div class="row">
                <div class="manual-list">
                    {{range $index,$item := .Lists}}
                        <div class="search-item">

                            <div class="title">
                            	...
                                <a href="{{urlfor "DocumentController.ReadByBookId" ":book_id" $item.BookId ":id" $item.ThirdParentDocIdentify}}"
                                    title="{{$item.ThirdParentDocName}}" target="_blank">{{str2html $item.ThirdParentDocName}}</a>
                                	>>
                                <a href="{{urlfor "DocumentController.ReadByBookId" ":book_id" $item.BookId ":id" $item.SecondParentDocIdentify}}"
                                    title="{{$item.SecondParentDocName}}" target="_blank">{{str2html $item.SecondParentDocName}}</a>
                                	>>
                                <a href="{{urlfor "DocumentController.ReadByBookId" ":book_id" $item.BookId ":id" $item.FirstParentDocIdentify}}"
                                    title="{{$item.FirstParentDocName}}" target="_blank">{{str2html $item.FirstParentDocName}}</a>
                                    >>
                                <a href="{{urlfor "DocumentController.ReadByBookId" ":book_id" $item.BookId ":id" $item.Identify}}"
                                    title="{{$item.DocumentName}}" target="_blank">{{str2html $item.DocumentName}}</a>
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
    </div>
    {{template "widgets/quick_links.tpl" .}}
    {{.Scripts}}
</body>
</html>