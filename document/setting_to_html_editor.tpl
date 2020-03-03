<form method="post" id="bookEditForm" action="{{urlfor "BookController.SaveBook"}}" style="display:none">
    <input type="hidden" name="identify" value="{{.Model.Identify}}">
    <div class="form-group">
        <label>标题</label>
        <input type="text" class="form-control" name="book_name" id="bookName" placeholder="项目名称" value="{{.Model.BookName}}">
    </div>
    <div class="form-group">
        <label>标识</label>
        <input type="text" class="form-control" value="{{urlfor "DocumentController.Index" ":key" .Model.Identify}}" placeholder="项目唯一标识" disabled>
        <p class="text">项目标识用来标记项目的唯一性，不可修改。</p>
    </div>
    <div class="form-group">
        <label>项目空间</label>
        <select class="js-data-example-ajax form-control" multiple="multiple" name="itemId">
            <option value="{{.Model.ItemId}}" selected="selected">{{.Model.ItemName}}</option>
        </select>
    </div>
    <div class="form-group">
        <label>历史记录数量</label>
        <input type="text" class="form-control" name="history_count" value="{{.Model.HistoryCount}}" placeholder="历史记录数量">
        <p class="text">当开启文档历史时,该值会限制每个文档保存的历史数量</p>
    </div>
    <div class="form-group">
        <label>公司标识</label>
        <input type="text" class="form-control" name="publisher" value="{{.Model.Publisher}}" placeholder="公司名称">
        <p class="text">导出文档PDF文档时显示的页脚</p>
    </div>
    <div class="form-group">
        <label>描述</label>
        <textarea rows="3" class="form-control" name="description" style="height: 90px" placeholder="项目描述">{{.Model.Description}}</textarea>
        <p class="text">描述信息不超过500个字符,支持Markdown语法</p>
    </div>
    <div class="form-group">
        <label>标签</label>
        <input type="text" class="form-control" name="label" placeholder="项目标签" value="{{.Model.Label}}">
        <p class="text">最多允许添加10个标签，多个标签请用“,”分割</p>
    </div>
    <div class="form-group">
        <label>编辑器</label>
        <div class="radio">
            <label class="radio-inline">
                <input type="radio" name="editor" value="markdown"> Markdown编辑器
            </label>
            <label class="radio-inline">
                <input type="radio" checked name="editor" value="html"> Html编辑器
            </label>
        </div>
    </div>
    {{if eq .Model.PrivatelyOwned 1}}
    <div class="form-group">
        <label>访问令牌</label>
        <div class="row">
            <div class="col-sm-10">
                <input type="text" name="token" id="token" class="form-control" placeholder="访问令牌" readonly value="{{.Model.PrivateToken}}">
            </div>
            <div class="col-sm-2">
                <button type="button" class="btn btn-success btn-sm" id="createToken" data-loading-text="生成" data-action="create">生成</button>
                <button type="button" class="btn btn-danger btn-sm" id="deleteToken" data-loading-text="删除" data-action="delete">删除</button>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label>访问密码</label>
        <input type="text" name="bPassword" id="bPassword" class="form-control" placeholder="访问密码" value="{{.Model.BookPassword}}">
        <p class="text">没有访问权限访问项目时需要提供的密码</p>
    </div>
    {{end}}

    <div class="form-group">
        <label for="autoRelease">自动发布</label>
        <div class="controls">
            <div class="switch switch-small" data-on="primary" data-off="info">
                <input type="checkbox" id="autoRelease" name="auto_release"{{if .Model.AutoRelease }} checked{{end}} data-size="small">
            </div>
            <p class="text">开启后，每次保存会自动发布到最新版本</p>
        </div>
    </div>
    <div class="form-group">
        <label for="autoRelease">开启导出</label>
        <div class="controls">
            <div class="switch switch-small" data-on="primary" data-off="info">
                <input type="checkbox" id="isDownload" name="is_download"{{if .Model.IsDownload }} checked{{end}} data-size="small" placeholder="开启导出">
            </div>
            <p class="text">开启导出前请先配置导出程序，并在配置文件中同时开启导出功能</p>

        </div>
    </div>
    <div class="form-group">
        <label for="autoRelease">开启分享</label>
        <div class="controls">
            <div class="switch switch-small" data-on="primary" data-off="info">
                <input type="checkbox" id="enableShare" name="enable_share"{{if .Model.IsEnableShare }} checked{{end}} data-size="small" placeholder="开启分享">
            </div>
            <p class="text">分享只对公开项目生效，私有项目不支持分享</p>
        </div>
    </div>
    <div class="form-group">
        <label for="autoRelease">设置第一篇文档为默认首页</label>
        <div class="controls">
            <div class="switch switch-small" data-on="primary" data-off="info">
                <input type="checkbox" id="isUseFirstDocument" name="is_use_first_document"{{if .Model.IsUseFirstDocument }} checked{{end}} data-size="small" placeholder="设置第一篇文档为默认首页">
            </div>
        </div>
    </div>
    <div class="form-group">
        <label for="autoRelease">自动保存</label>
        <div class="controls">
            <div class="switch switch-small" data-on="primary" data-off="info">
                <input type="checkbox" id="autoSave" name="auto_save"{{if .Model.AutoSave }} checked{{end}} data-size="small" placeholder="自动保存">
            </div>
            <p class="text">开启后每隔30秒会自动保存</p>
        </div>
    </div>
    <div class="form-group">
        <button type="submit" id="btnSaveBookInfo" class="btn btn-success" data-loading-text="保存中...">保存修改</button>
        <button type="submit" id="btnSaveBookInfoAndEdit" class="btn btn-info" data-loading-text="保存中...">
            <span id="flag_return_button">返回编辑</span>
        </button>
        <span id="form-error-message" class="error-message"></span>
    </div>
</form>