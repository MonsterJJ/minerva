<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <!-- 使多核心浏览器默认使用极速内核打开 -->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <!-- 防止抽取网站内容 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 强制IE使用最高兼容模式 -->
    <title>商品</title>
    <link rel="stylesheet" href="/css/style.css">
    <link href="http://cdn.bootcss.com/material-design-icons/2.0.0/iconfont/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="/js/IdCard-Validate.js"></script>
    <script src="/js/bundle.js"></script>
</head>
<body class="bgfff">

<div class="newCus form-list" id="newCus">
    <div class="ct ct_step01">
        <form action="" class="form-horizontal" id="legalPersonEntityForm">
            <input type="hidden" name="shoppingUserId" id="shoppingUserId"
                   value="${shoppingEntity.shoppingId?default("")}">
            <div class="l-row">
				<span class="row-title">
					<i class="text-danger">*</i>商品编号：
				</span>

                <div class="col w300">
                    <input type="text" class="form-control" placeholder="" id="shoppingId"
                           name="shoppingId" <#if shoppingEntity??> readonly
                           value="${shoppingEntity.shoppingId?default("")}" </#if>>
                </div>
            </div>
            <div class="l-row">
                <span class="row-title">
                <i class="text-danger">*</i>商品名称：
                </span>
                <div class="col w300">
                    <input type="text" class="form-control" placeholder="" id="shoppingName" name="shoppingName"
                           value="${shoppingEntity.shoppingName?default("")}">
                </div>
            </div>

            <div class="l-row">
                <span class="row-title">
                <i class="text-danger">*</i>商品链接：
                </span>
                <div class="col w300">
                    <input type="text" class="form-control" placeholder="" id="shoppingUrl" name="shoppingUrl"
                           <#if legalPersonEntity??>readonly
                           value="${shoppingEntity.shoppingUrl?default("")}"</#if>/>
                </div>
            </div>
            <div class="l-row">
                    <span class="row-title">
                    <i class="text-danger">*</i>商品图片链接：
                    </span>

                <div class="col w300">
                    <input class="form-control" type="text" placeholder="" id="shoppingImageUrl"
                           name="shoppingImageUrl"
                    <#if legalPersonEntity??> readonly
                           value="${shoppingEntity.shoppingImageUrl?default("")}"</#if>/>
                </div>
            </div>
            <div class="l-row">
                    <span class="row-title">
                    <i class="text-danger">*</i>备注：
                    </span>

                <div class="col w300">
                    <input type="text" class="form-control" placeholder="" id="remark" name="remark"
                           value="${shoppingEntity.remark?default("")}">
                </div>
            </div>
        <#--<div class="l-row">-->
        <#--<span class="row-title">-->
        <#--<i class="text-danger">*</i>婚姻状况：-->
        <#--</span>-->

        <#--<div class="col w300">-->
        <#--<select name="marriage" id="marriage">-->
        <#--<option value="">请选择婚姻状况</option>-->
        <#--<option value="1">已婚</option>-->
        <#--<option value="2">未婚</option>-->
        <#--<option value="3">离异</option>-->
        <#--<option value="9">其他</option>-->
        <#--</select>-->
        <#--</div>-->
        <#--</div>-->

            <div class="l-row mt20">
                <span class="row-title"></span>
                <button id="submitBtn" class="btn btn-l btn-default disabled-info"
                        style="position:relative;top:20px;left:150px">提交
                </button>
            </div>
        </form>
    </div>
    <script>

        $(function () {

            $("#submitBtn").click(function () {
                var shoppingId = $("#shoppingId").val();
                var name = $("#shoppingName").val();
                var url = $("#shoppingUrl").val();
                var imageUrl = $("#shoppingImageUrl").val();
                var remark = $("#remark").val();

                if (!shoppingId) {
                    parent.layer.msg("商品编号不能为空");
                    return;
                }

                if (!name) {
                    parent.layer.msg("商品名称不能为空");
                    return;
                }

                if (!url) {
                    parent.layer.msg("商品名称不能为空");
                    return;
                }

                if (!imageUrl) {
                    parent.layer.msg("商品图片链接不能为空");
                    return;
                }

                $.post("/shopping/new", $("#legalPersonEntityForm").serialize(), function (json) {
                    if (json.status == "success") {
                        parent.flushPage();
                        parent.layer.closeAll();
                    } else {
                        parent.message.warn(json.message);
                    }
                }, "json");
            });
        })

    </script>
</body>
</html>