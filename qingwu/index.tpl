<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>{{.SITE_NAME}} - Test Powered by QingwuWIKI</title>     <!--Qingwu Add-->     <link href="/static/images/favicon.ico" mce_href="favicon.ico" rel="icon" type="image/x-icon">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta name="author" content="Minho" />
    <meta name="site" content="https://www.iminho.me" />
    <meta name="description" content="{{.site_description}}">
    <!-- Bootstrap -->
    <link href="{{cdncss "/static/bootstrap/css/bootstrap.min.css"}}" rel="stylesheet">
    <link href="{{cdncss "/static/font-awesome/css/font-awesome.min.css"}}" rel="stylesheet">

    <link href="{{cdncss "/static/css/main.css"}}" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="/static/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="/static/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- bower:css -->
    <link rel="stylesheet" href="/static/qingwu/bower_components/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" href="/static/qingwu/bower_components/codemirror/lib/codemirror.css" />
    <link rel="stylesheet" href="/static/qingwu/bower_components/hotbox/hotbox.css" />
    <link rel="stylesheet" href="/static/qingwu/bower_components/kityminder-core/dist/kityminder.core.css" />
    <link rel="stylesheet" href="/static/qingwu/bower_components/color-picker/dist/color-picker.min.css" />
    <!-- endbower -->

    <link rel="stylesheet" href="/static/qingwu/kityminder.editor.min.css">
    <style>
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
        }
        h1.editor-title {
            background: #393F4F;
            color: white;
            margin: 0;
            height: 40px;
            font-size: 14px;
            line-height: 40px;
            font-family: 'Hiragino Sans GB', 'Arial', 'Microsoft Yahei';
            font-weight: normal;
            padding: 0 20px;
        }
        div.minder-editor-container {
            position: absolute;
            top: 53px;
            bottom: 0;
            left: 0;
            right: 0;
        }
    </style>
</head>
<body ng-app="kityminderElem" ng-controller="MainController">
    {{template "widgets/header.tpl" .}}
    <kityminder-editor on-init="initEditor(editor, minder)" data-theme="fresh-green"></kityminder-editor>
    <iframe name="frameFile" style="display:none;"></iframe>

</body>
<script src="{{cdnjs "/static/jquery/1.12.4/jquery.min.js"}}" type="text/javascript"></script>
{{template "widgets/quick_links.tpl" .}}
<!-- bower:js -->
<script src="/static/qingwu/bower_components/jquery/dist/jquery.js"></script>
<script src="/static/qingwu/bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script src="/static/qingwu/bower_components/angular/angular.js"></script>
<script src="/static/qingwu/bower_components/angular-bootstrap/ui-bootstrap-tpls.js"></script>
<script src="/static/qingwu/bower_components/codemirror/lib/codemirror.js"></script>
<script src="/static/qingwu/bower_components/codemirror/mode/xml/xml.js"></script>
<script src="/static/qingwu/bower_components/codemirror/mode/javascript/javascript.js"></script>
<script src="/static/qingwu/bower_components/codemirror/mode/css/css.js"></script>
<script src="/static/qingwu/bower_components/codemirror/mode/htmlmixed/htmlmixed.js"></script>
<script src="/static/qingwu/bower_components/codemirror/mode/markdown/markdown.js"></script>
<script src="/static/qingwu/bower_components/codemirror/addon/mode/overlay.js"></script>
<script src="/static/qingwu/bower_components/codemirror/mode/gfm/gfm.js"></script>
<script src="/static/qingwu/bower_components/angular-ui-codemirror/ui-codemirror.js"></script>
<script src="/static/qingwu/bower_components/marked/lib/marked.js"></script>
<script src="/static/qingwu/bower_components/kity/dist/kity.min.js"></script>
<script src="/static/qingwu/bower_components/hotbox/hotbox.js"></script>
<script src="/static/qingwu/bower_components/json-diff/json-diff.js"></script>
<script src="/static/qingwu/bower_components/kityminder-core/dist/kityminder.core.min.js"></script>
<script src="/static/qingwu/bower_components/color-picker/dist/color-picker.min.js"></script>
<!-- endbower -->

<script src="/static/qingwu/kityminder.editor.min.js"></script>
<script src="/static/qingwu/qingwu_minder.js"></script>

<script>
    var content = "";
    angular.module('kityminderElem', ['kityminderEditor'])
        .controller('MainController', function($scope) {
            $scope.initEditor = function(editor, minder) {
                window.editor = editor;
                window.minder = minder;
                editor.minder.importData('json', content).then(function(data){
                    console.log(data);
                });
            };
        });
    function readJSON(result){
        //回调函数名称(indexDemo)，需要与 src 中一致，而且要与文件地址中名一致。jsonp格式 名称({})
        //不然无法获取到对应的文件
        content = JSON.stringify(result);
    }

</script>
<script type="text/javascript" src="/uploads/qingwu/{{.JSON_NAME}}.json?callback=readJSON"></script>
</html>