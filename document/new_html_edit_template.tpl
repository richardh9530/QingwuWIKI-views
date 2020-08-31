<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>编辑文档 - Powered by QingwuWIKI</title>    <!--Qingwu Add-->    <link href="/static/images/favicon.ico" mce_href="favicon.ico" rel="icon" type="image/x-icon">
    <script type="text/javascript">
        window.editor = null;
        window.imageUploadURL = "{{urlfor "DocumentController.Upload" "identify" .Model.Identify}}";
        window.fileUploadURL = "{{urlfor "DocumentController.Upload" "identify" .Model.Identify}}";
        window.documentCategory = {{.Result}};
        window.book = {{.ModelResult}};
        window.selectNode = null;
        window.deleteURL = "{{urlfor "DocumentController.Delete" ":key" .Model.Identify}}";
        window.editURL = "{{urlfor "DocumentController.Content" ":key" .Model.Identify ":id" ""}}";
        window.releaseURL = "{{urlfor "BookController.Release" ":key" .Model.Identify}}";
        window.sortURL = "{{urlfor "BookController.SaveSort" ":key" .Model.Identify}}";
        window.historyURL = "{{urlfor "DocumentController.History"}}";
        window.removeAttachURL = "{{urlfor "DocumentController.RemoveAttachment"}}";
        window.highlightStyle = "{{.HighlightStyle}}";
    </script>
    <!-- Bootstrap -->

    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/bootstrap/plugins/tagsinput/bootstrap-tagsinput.css"}}" rel="stylesheet"><!--标签-->
    <link href="{{cdncss "/static/bootstrap/plugins/bootstrap-switch/css/bootstrap3//bootstrap-switch.min.css"}}" rel="stylesheet"><!--开关-->
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/jstree/3.3.4/themes/default/style.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/jstree.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/webuploader/webuploader.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/markdown.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/prettify/themes/atelier-estuary-dark.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/css/markdown.preview.css" "version"}}" rel="stylesheet">
    <link href="{{cdncss (print "/static/editor.md/lib/highlight/styles/" .HighlightStyle ".css") "version"}}" rel="stylesheet">
    <link href="{{cdncss "/static/katex/katex.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/quill/quill.core.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/quill/quill.snow.css"}}" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/static/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="/static/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->
    <style type="text/css">
        .modal{z-index: 999999999;}
        #docEditor {
            overflow:auto;
            border: 1px solid #ddd;
            border-left: none;
            height: 100%;
            outline:none;
            padding: 5px 5px 30px 5px;
        }
        #docEditor p{
            margin-bottom: 14px;
            line-height: 1.7em;
            font-size: 14px;
            color: #5D5D5D;
        }
        .ql-picker-options{z-index: 99999;}
        .btn-info{background-color: #ffffff !important;}
        .btn-info>i{background-color: #cacbcd !important; color: #393939 !important; box-shadow: inset 0 0 0 1px transparent,inset 0 0 0 0 rgba(34,36,38,.15);}
        .editor-wrapper>pre{padding: 0;}
        .editor-wrapper .editor-code{
            font-size: 13px;
            line-height: 1.8em;
            color: #dcdcdc;
            border-radius: 3px;
            display: block;
            overflow-x: auto;
            padding: 0.5em;
            background: #3f3f3f;
        }
        .editor-wrapper-selected .editor-code{border: 1px solid #1e88e5;}

        .ql-toolbar.ql-snow{
            border: none !important;
        }
        .editor-group{
            float: left;
            height: 32px;
            margin-right: 10px;
        }

        .editor-group .editor-item,.editor-group .editor-item-select>.ql-picker-label{
            float: left;
            display: inline-block;
            min-width: 34px;
            height: 30px !important;
            padding: 5px;
            line-height: 30px;
            text-align: center;
            color: #4b4b4b;
            border-top: 1px solid #ccc !important;
            border-left: 1px solid #ccc !important;
            border-bottom: 1px solid #ccc !important;
            background: #fff;
            border-radius: 0;
            font-size: 12px
        }
        .ql-snow .ql-picker.ql-expanded .ql-picker-options{
            margin-top: 5px;
        }
        .editor-group .editor-item-select>.ql-picker-label{
            border-right: 1px solid #ccc !important;
        }
        .editor-group .editor-item-single-select>.ql-picker-label{
            border-radius: 4px;
            padding: 0;
        }

        .editor-group .editor-item-last{
            border-right: 1px solid #ccc !important;
            border-radius: 0 4px 4px 0;
        }
        .editor-group .editor-item-first{
            border-right: 0;
            border-radius: 4px  0 0 4px;
        }
        .editor-group .disabled:hover{
            background: #ffffff !important;
        }
        .editor-group .editor-item-change:hover{
             background-color: #58CB48 !important;
        }
        .editor-group  .editor-item:hover {
            background-color: #e4e4e4;
            color: #4b4b4b !important;
        }

        .editor-group a{
            float: left;
        }

        .editor-group .change i{
            color: #ffffff;
            background-color: #44B036 !important;
            border: 1px #44B036 solid !important;
        }
        .editor-group .change i:hover{
            background-color: #58CB48 !important;
        }
        .editor-group .disabled i:hover{
            background: #ffffff !important;
        }
        .editor-group a.disabled{
            border-color: #c9c9c9;
            opacity: .6;
            cursor: default
        }
        .editor-group a>i{
            display: inline-block;
            width: 34px !important;
            height: 30px !important;
            line-height: 30px;
            text-align: center;
            color: #4b4b4b;
            border: 1px solid #ccc;
            background: #fff;
            border-radius: 4px;
            font-size: 15px
        }
        .editor-group a>i.item{
            border-radius: 0;
            border-right: 0;
        }
        .editor-group a>i.last{
            border-bottom-left-radius:0;
            border-top-left-radius:0;
        }
        .editor-group a>i.first{
            border-right: 0;
            border-bottom-right-radius:0;
            border-top-right-radius:0;
        }
        .editor-group  a i:hover {
            background-color: #e4e4e4
        }

        .editor-group  a i:after {
            display: block;
            overflow: hidden;
            line-height: 30px;
            text-align: center;
            font-family: icomoon,Helvetica,Arial,sans-serif;
            font-style: normal;
        }

        .bootstrap-tagsinput{  /*标签*/
            display: block !important;
        }

    </style>
</head>
<body>

<div class="m-manual manual-editor">
    <div class="manual-head btn-toolbar" id="editormd-tools"  style="min-width: 1260px;margin-left:5px;" data-role="editor-toolbar" data-target="#editor">

        <div class="editormd-group-special">
            <a href="{{urlfor "BookController.Index"}}" data-toggle="tooltip" data-title="返回"><i class="fa fa-chevron-left" aria-hidden="true"></i></a>
        </div>

        <div class="editormd-group-special">
            <a href="javascript:change_to_markdown_editor();" data-toggle="tooltip" data-title="切换为Markdwon编辑器" id="editor_changer">
            	<i class="fa fa-exchange" aria-hidden="true">&nbsp;切换为markdown编辑器</i>
            </a>
        </div>

        <div class="editormd-group-special">
            <a href="javascript:;" data-toggle="tooltip" data-title="完成" class="ql-finish"><i class="fa fa-check-square" name="preview" unselectable="on">&nbsp;完成</i></a>  <!--eye-->
        </div>

        <div class="editormd-group-special">
            <a href="javascript:;" id="save-origin-html" data-toggle="tooltip" data-title="保存原文" class="ql-save-origin-html">
                <i class="fa fa-folder" aria-hidden="true" name="save-origin-html">&nbsp;保存原文</i>
            </a>
            {{/*<a href="javascript:;" id="edit-origin-text" data-toggle="tooltip" data-title="编辑原文" >*/}}
            {{/*	<i class="fa fa-edit last" aria-hidden="true" name="edit-origin-text"></i>*/}}
            {{/*</a>*/}}
        </div>

        <div class="editormd-group"><!--查看原文-->
            <a href="javascript:;" id="view-origin-html" data-toggle="tooltip" data-title="查看原文" class="ql-view-origin-html">
                <i class="fa fa-eye" aria-hidden="true" name="view-origin-html"></i>
            </a>
        </div>

        <div class="editor-group">
            <a href="javascript:;" id="markdown-save" data-toggle="tooltip" data-title="保存" class="disabled save"><i class="fa fa-save first" aria-hidden="true" name="save"></i></a>
            <a href="javascript:;" data-toggle="tooltip" data-title="发布" id="btnRelease"><i class="fa fa-cloud-upload last" name="release" aria-hidden="true"></i></a>
        </div>
        <div class="editor-group">
            <a href="javascript:;" data-toggle="tooltip" data-title="撤销 (Ctrl-Z)" class="ql-undo"><i class="fa fa-undo first" name="undo" unselectable="on"></i></a>
            <a href="javascript:;" data-toggle="tooltip" data-title="重做 (Ctrl-Y)" class="ql-redo"><i class="fa fa-repeat last" name="redo" unselectable="on"></i></a>
        </div>

        <div class="editor-group ql-formats">
            <a href="javascript:;" data-toggle="tooltip" data-title="附件" id="btnUploadFile"><i class="fa fa-paperclip last" aria-hidden="true" name="attachment"></i></a>

        </div>

        <div class="editor-group" id="editor_toolbar">

        </div>

        <div class="clearfix"></div>
    </div>
    <div class="manual-body">
        <div class="manual-category" id="manualCategory" style=" border-right: 1px solid #DDDDDD;width: 281px;position: absolute;">
            <div class="manual-nav">
                <div class="nav-item active"><i class="fa fa-bars" aria-hidden="true"></i> 文档</div>
                <div class="nav-plus pull-right" id="btnAddDocument" data-toggle="tooltip" data-title="创建文档" data-direction="right"><i class="fa fa-plus" aria-hidden="true"></i></div>
                <div class="clearfix"></div>
            </div>
            <div class="manual-tree" id="sidebar"> </div>
        </div>
        <div class="manual-editor-container" id="manualEditorContainer" style="min-width: 800px;">
            <div class="manual-editormd" style="bottom: 0;">
                <div id="content" class="manual-editormd-active ql-editor ql-blank  editor-content editor" name="content"><!--正文-->
                <div id="docEditor" style="display:none">
            </div>

                <div class="manual-editor-status" style="border-top: 1px solid #DDDDDD;">
                    <div id="attachInfo" class="item">0 个附件</div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加文档 -->
<div class="modal fade" id="addDocumentModal" tabindex="-1" role="dialog" aria-labelledby="addDocumentModalLabel">
    <div class="modal-dialog" role="document">
        <form method="post" action="{{urlfor "DocumentController.Create" ":key" .Model.Identify}}" id="addDocumentForm"
            class="form-horizontal" onsubmit="return beforeCreateDocument()">
            <input type="hidden" name="identify" value="{{.Model.Identify}}">
            <input type="hidden" name="doc_id" value="0">
            <input type="hidden" name="parent_id" value="0">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加文档</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">文档名称 <span class="error-message">*</span></label>
                        <div class="col-sm-10">
                            <input type="text" name="doc_name" id="documentName" placeholder="文档名称" class="form-control"  maxlength="50">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">文档标识</label>
                        <div class="col-sm-10">
                            <input type="text" name="doc_identify" id="documentIdentify" placeholder="文档唯一标识" class="form-control" maxlength="50">
                            <p style="color: #999;font-size: 12px;">文档标识只能包含小写字母、数字，以及“-”和“_”符号,并且只能小写字母开头</p>
                        </div>

                    </div>

                    <div class="form-group"><!--/*2020-08-16新增；注：new_html_edit_template与markdown_edit_template同步更新*/-->
                        <label class="col-sm-2 control-label">原始链接 <span class="error-message">&nbsp;</span></label>
                        <div class="col-sm-10">
                            <input type="text" name="doc_origin_url" id="documentOriginUrl" placeholder="文档原始链接" class="form-control" maxlength="500">
                            <p style="color: #999;font-size: 12px;">如无，则空</p>
                        </div>
                    </div>

                    <div class="form-group"><!--/*2020-08-16新增*/-->
                        <label class="col-sm-2 control-label">发布日期 <span class="error-message">&nbsp;</span></label>
                        <div class="col-sm-10">
                            <input type="text" name="doc_release_date" id="documentReleaseDate" placeholder="文档发布日期" class="form-control" maxlength="20">
                            <p style="color: #999;font-size: 12px;">如无，则空</p>
                        </div>
                    </div>

                    <div class="form-group"><!--/*2020-08-16新增*/-->
                        <label class="col-sm-2 control-label">来源 <span class="error-message">&nbsp;</span></label>
                        <div class="col-sm-10">
                            <input type="text" name="doc_source" id="documentSource" placeholder="文档来源" class="form-control" maxlength="100">
                            <p style="color: #999;font-size: 12px;">如无，则空</p>
                        </div>
                    </div>

                    <div class="form-group"><!--/*2020-08-31新增*/-->
                        <label class="col-sm-2 control-label">编号 <span class="error-message">&nbsp;</span></label>
                        <div class="col-sm-10">
                            <input type="text" name="doc_number" id="documentNumber" placeholder="文档编号" class="form-control" maxlength="100">
                            <p style="color: #999;font-size: 12px;">如无，则空</p>
                        </div>
                    </div>

                    <div class="form-group"><!--/*2020-08-19新增*/-->
                        <label class="col-sm-2 control-label">标签 <span class="error-message">&nbsp;</span></label>
                        <div class="col-sm-10" id="labels_container">
                            <input type="text" name="doc_labels" id="documentLabels" placeholder="文档标签" class="form-control" maxlength="100">
                            <p style="color: #999;font-size: 12px;">最多允许添加10个标签，多个标签请用“,”分割</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="starDoc" class="col-sm-2 control-label">是否星标 <span class="error-message">&nbsp;</span></label>
                        <div class="controls col-sm-10" id="doc_star_container">
                            <div class="switch switch-small" data-on="primary" data-off="info">
                                <input type="checkbox" id="starDoc" name="doc_is_star" data-size="small">
                            </div>
                        </div>
                    </div>

                    <div class="form-group"><!--/*2020-08-30新增；注：new_html_edit_template与markdown_edit_template同步更新*/-->
                        <label for="isDoc" class="col-sm-2 control-label">是否公文 <span class="error-message">&nbsp;</span></label>
                        <div class="controls col-sm-10" id="doc_is_doc_container">
                            <div class="switch switch-small" data-on="primary" data-off="info">
                                <input type="checkbox" id="isDoc" name="doc_is_doc" data-size="small">
                            </div>
                        </div>
                    </div>

                    <div class="form-group"><!--/*2020-08-30新增；*/-->
                        <label for="isResume" class="col-sm-2 control-label">是否简历 <span class="error-message">&nbsp;</span></label>
                        <div class="controls col-sm-10" id="doc_is_resume_container">
                            <div class="switch switch-small" data-on="primary" data-off="info">
                                <input type="checkbox" id="isResume" name="doc_is_resume" data-size="small">
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                    <div class="col-lg-6">
                        <label>
                            <input type="radio" name="is_open" value="1"> 展开<span class="text">(在阅读时会自动展开节点)</span>
                        </label>
                        </div>
                        <div class="col-lg-6">
                        <label>
                        <input type="radio" name="is_open" value="0" checked> 关闭<span class="text">(在阅读时会关闭节点)</span>
                        </label>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span id="add-error-message" class="error-message"></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" id="btnSaveDocument" data-loading-text="保存中...">立即保存</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!--附件上传-->
<div class="modal fade" id="uploadAttachModal" tabindex="-1" role="dialog" aria-labelledby="uploadAttachModalLabel">
    <div class="modal-dialog" role="document">
        <form method="post" id="uploadAttachModalForm" class="form-horizontal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">上传附件</h4>
                </div>
                <div class="modal-body">
                    <div class="attach-drop-panel">
                        <div class="upload-container" id="filePicker">
                                <i class="fa fa-upload" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="attach-list" id="attachList">
                        <template v-for="item in lists">
                            <div class="attach-item" :id="item.attachment_id">
                                <template v-if="item.state == 'wait'">
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                            <span class="sr-only">0% Complete (success)</span>
                                        </div>
                                    </div>
                                </template>
                                <template v-else-if="item.state == 'error'">
                                    <span class="error-message">${item.message}</span>
                                    <button type="button" class="btn btn-sm close" @click="removeAttach(item.attachment_id)">
                                        <i class="fa fa-remove" aria-hidden="true"></i>
                                    </button>
                                </template>
                                <template v-else>
                                    <a :href="item.http_path" target="_blank" :title="item.file_name">${item.file_name}</a>
                                    <span class="text">(${ formatBytes(item.file_size) })</span>
                                    <span class="error-message">${item.message}</span>
                                    <button type="button" class="btn btn-sm close" @click="removeAttach(item.attachment_id)">
                                        <i class="fa fa-remove" aria-hidden="true"></i>
                                    </button>
                                    <div class="clearfix"></div>
                                </template>
                            </div>
                        </template>
                    </div>
                </div>
                <div class="modal-footer">
                    <span id="add-error-message" class="error-message"></span>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" id="btnUploadAttachFile" data-dismiss="modal">确定</button>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="documentHistoryModal" tabindex="-1" role="dialog" aria-labelledby="documentHistoryModalModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">文档历史记录</h4>
            </div>
            <div class="modal-body text-center" id="historyList">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<script src="{{cdnjs "/static/vuejs/vue.min.js"}}" type="text/javascript"></script>

{{template "widgets/quick_links.tpl" .}}
<script src="{{cdnjs "/static/webuploader/webuploader.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/jstree/3.3.4/jstree.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/katex/katex.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/to-markdown/dist/to-markdown.js"}}" type="text/javascript"></script>

<script src="{{cdnjs "/static/layer/layer.js"}}" type="text/javascript" ></script>
<script src="{{cdnjs "/static/js/jquery.form.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/editor.md/lib/highlight/highlight.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/js/array.js" "version"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/js/editor.js"}}" type="text/javascript"></script>

<script src="{{cdnjs "/static/bootstrap/plugins/tagsinput/bootstrap-tagsinput.min.js"}}" type="text/javascript"></script>
<script src="{{cdnjs "/static/bootstrap/plugins/bootstrap-switch/js/bootstrap-switch.min.js"}}" type="text/javascript"></script>

<script src="{{cdnjs "/static/tinymce/js/tinymce/tinymce.min.js"}}" type="text/javascript"></script>

<script src="{{cdnjs "/static/js/tinymce.js"}}" type="text/javascript"></script>

{{template "document/setting_to_markdown_editor.tpl" .}}
<script type="text/javascript">
    $(function () {
        hljs.configure({   // optionally configure hljs
            languages: ['javascript', 'ruby', 'python']
        });
        $(".editor-code").on("dblclick",function () {
            var code = $(this).html();
            $("#createCodeToolbarModal").find("textarea").val(code);
            $("#createCodeToolbarModal").modal("show");
        }).on("click",function (e) {
            e.preventDefault();
            e.stopPropagation();
            console.log($(this).parents(".editor-wrapper").html())
            $(this).parents(".editor-wrapper").addClass("editor-wrapper-selected");
        });

        $("#attachInfo,#btnUploadFile").on("click",function () {
            $("#uploadAttachModal").modal("show");
        });


        /**
         * 文件上传
         */
        $("#uploadAttachModal").on("shown.bs.modal",function () {
            if(window.uploader === null){
                try {
                    window.uploader = WebUploader.create({
                        auto: true,
                        dnd : true,
                        swf: '{{.BaseUrl}}/static/webuploader/Uploader.swf',
                        server: '{{urlfor "DocumentController.Upload"}}',
                        formData : { "identify" : {{.Model.Identify}},"doc_id" :  window.selectNode.id },
                        pick: "#filePicker",
                        fileVal : "editormd-file-file",
                        compress : false,
                        fileSingleSizeLimit: {{.UploadFileSize}}
                    }).on("beforeFileQueued",function (file) {
                        this.options.formData.doc_id = window.selectNode.id;
                    }).on( 'fileQueued', function( file ) {
                        var item = {
                            state : "wait",
                            attachment_id : file.id,
                            file_size : file.size,
                            file_name : file.name,
                            message : "正在上传"
                        };
                        window.vueApp.lists.push(item);

                    }).on("uploadError",function (file,reason) {
                        for(var i in window.vueApp.lists){
                            var item = window.vueApp.lists[i];
                            if(item.attachment_id == file.id){
                                item.state = "error";
                                item.message = "上传失败:" + reason;
                            }
                        }

                    }).on("uploadSuccess",function (file, res) {
                        for(var index in window.vueApp.lists){
                            var item = window.vueApp.lists[index];
                            if(item.attachment_id === file.id){
                                if(res.errcode === 0) {
                                    window.vueApp.lists.splice(index, 1, res.attach);

                                }else{
                                    item.message = res.message;
                                    item.state = "error";
                                }
                            }
                        }

                    }).on("uploadProgress",function (file, percentage) {
                        var $li = $( '#'+file.id ),
                                $percent = $li.find('.progress .progress-bar');

                        $percent.css( 'width', percentage * 100 + '%' );
                    }).on("error", function (type) {
                        if(type === "F_EXCEED_SIZE"){
                            layer.msg("文件超过了限定大小");
                        }
                        console.log(type);
                    });
                }catch(e){
                    console.log(e);
                }
            }
        });
    });

    $('input[name="doc_labels"]').tagsinput({
        confirmKeys: [13,44],
        maxTags: 10,
        trimValue: true,
        cancelConfirmKeysOnEmpty : false
    });
    $("#starDoc").bootstrapSwitch();
    $("#isDoc").bootstrapSwitch();
    $("#isResume").bootstrapSwitch();

    function change_to_markdown_editor(){
        $("#bookEditForm").ajaxForm({
            success : function (res) {
                // 返回编辑
                window.location.href = {{urlfor "DocumentController.Edit" ":key" .Model.Identify ":id" ""}}
            }
        });
        $("#bookEditForm").submit();
    }

    function beforeCreateDocument(){
    	// 提交前触发
        $node = window.selectNode
        $node["origin_url"] = $("input[name='doc_origin_url']").val();  // 2020-08-16 增加
        $node["release_date"] = $("input[name='doc_release_date']").val();
        $node["source"] = $("input[name='doc_source']").val();
        $node["number"] = $("input[name='doc_number']").val();  // 一般是公文的 发文字号
        $node["labels"] =  $("input[name='doc_labels']").val();  // 2020-08-19 增加

        if ($("input[name='doc_is_star']").is(":checked")) {
            // 存在
            $node["is_star"] =  1 // 是否星标
        } else {
            // 不存在
            $node["is_star"] =  0
        }

        if ($("input[name='doc_is_doc']").is(":checked")) {
            // 存在
            $node["is_doc"] =  1 // 是否公文
        } else {
            // 不存在
            $node["is_doc"] =  0
        }

        if ($("input[name='doc_is_resume']").is(":checked")) {
            // 存在
            $node["is_resume"] =  1 // 是否简历
        } else {
            // 不存在
            $node["is_resume"] =  0
        }

        // $("input[name='doc_source']").val($node["source"])
        window.modified_node = $node  // 修改后使得结果立即可见
    }
</script>
</body>
</html>