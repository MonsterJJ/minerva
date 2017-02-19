<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit"><!-- 使多核心浏览器默认使用极速内核打开 -->
    <meta http-equiv="Cache-Control" content="no-siteapp" /><!-- 防止抽取网站内容 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- 强制IE使用最高兼容模式 -->
    <title>删除商品</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="http://cdn.bootcss.com/material-design-icons/2.0.0/iconfont/style.min.css" rel="stylesheet">
    <script src="/js/bundle.js"></script>
</head>
<body  class="bgfff pop-window-panel">
<div class="changeCur form-list" id="changeCur">
    <div class="w360 text-center"><p class="margin0">
        是否删除商品名称为（<#if shoppingEntity??>${shoppingEntity.shoppingName?default("")}</#if>）的商品？
    </p>
        <div class="l-row text-center mt20">
            <button class="btn btn-l btn-default" onClick="layerParentCloseAll()">取消</button>
            <button class="btn btn-l btn-primary ml10" onclick="shoppingDelete();">确定</button>
        </div>
    </div>
    <script>

        function shoppingDelete(){
            $.post("/shopping/delete/${shoppingEntity.shoppingId?default("")}", {}, function (json) {
                if (json.status == "success") {
                    parent.message.success(json.message);
                    parent.flushPage();
                    parent.layer.closeAll();
                } else {
                    parent.message.warn(json.message);
                }
            }, "json")

        }

    </script>
</body>
</html>