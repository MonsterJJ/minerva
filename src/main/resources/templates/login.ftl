<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit"><!-- 使多核心浏览器默认使用极速内核打开 -->
    <meta http-equiv="Cache-Control" content="no-siteapp"/><!-- 防止抽取网站内容 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- 强制IE使用最高兼容模式 -->
    <title>系统</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="//cdn.bootcss.com/material-design-icons/2.0.0/iconfont/style.min.css" rel="stylesheet">
    <script src="/js/bundle.js"></script>
    <script src="/js/layer/layer.js"></script>
</head>
<body>
<div class="login-wrapper">
    <div class="panel">
        <div class="title">
            系 统 登 录
        </div>
        <div class="body">
            <form id="loginForm" method="post" action="/login">
                <div class="con input-icon-42 user">
                    <input type="text" class="form-control" placeholder="用户名" id="userName" name="userName"
                           onfocus="addFocus(this)" onblur="verifyLogin();">
                    <i></i>
                </div>
                <div class="con input-icon-42 pwd">
                    <input type="password" class="form-control" placeholder="密码" id="userPassword" name="userPassword"
                           onfocus="addFocus(this)" onblur="verifyLogin();">
                    <i></i>
                </div>
                <a href="javascript:doAdminLogin();" class="btn btn-block btn-primary">
                    确定
                </a>
            </form>
        </div>
    </div>
    <p class="copy-right">
        ©2017 *** 版权所有
    </p>
</div>
<script>
    document.onkeydown = function (event) {
        if (!(navigator.userAgent.indexOf("MSIE") > 0)) {
            e = event ? event : (window.event ? window.event : null);
            if (e.keyCode == 13) {
                doAdminLogin();
            }
        }
    };

    // 登录操作
    function doAdminLogin() {
        var account = $("#userName").val();
        var password = $("#userPassword").val();
        var code = $("#code").val();

        if (!verifyLogin()) {
            return;
        }
        $("#loginForm").submit();
    }

    // 验证登录信息
    function verifyLogin() {
        var account = $("#userName").val();
        var password = $("#userPassword").val();
        if (!account) {
            $('.user').error('请输入用户名');
            return false;
        } else {
            $('.user').normal();
        }
        if (!password) {
            $('.pwd').error('请输入密码');
            return false;
        } else {
            $('.pwd').normal();
        }

        return true;
    }

    function addFocus(obj) {
        $(obj).parent().normal();
    }
    function addBlur(obj) {
        if (!$(obj).val()) {
            $(obj).parent().error('请输入' + obj.placeholder);
        }
    }

    //建议浏览器
    window.onload = function () {
        var userAgent = navigator.userAgent;
        if (userAgent.indexOf('Firefox') < 0 && userAgent.indexOf('Chrome') < 0) {
            var hint = document.createElement('div');
            hint.setAttribute('class', 'bg-warning browser-check-alert');
            hint.innerHTML = "为了更好的使用系统，请使用<a href='http://www.firefox.com.cn/' target='_blank'> 火狐浏览器 </a>或<a href='http://www.google.cn/chrome/browser/desktop/index.html' target='_blank'> 谷歌浏览器 </a><i class='mt remove' id='hintClose'>close</i>";
            document.body.appendChild(hint);
            document.getElementById('hintClose').onclick = function () {
                this.parentElement.remove();
            }
        }
    };

    <#if login_error_message>
    layer.msg('${login_error_message}', {icon: 2});
    </#if>
</script>
</body>
</html>