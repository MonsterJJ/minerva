<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit"><!-- 使多核心浏览器默认使用极速内核打开 -->
    <meta http-equiv="Cache-Control" content="no-siteapp"/><!-- 防止抽取网站内容 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- 强制IE使用最高兼容模式 -->
    <title>商品</title>
    <link href="http://cdn.bootcss.com/material-design-icons/2.0.0/iconfont/style.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/style_customer.css">
    <script src="/js/bundle.js"></script>
    <script src="/js/layer/layer.js"></script>
    <script type="text/javascript" src="/js/datatables/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/js/datatables/jquery.dataTables.init.js"></script>
    <script type="text/javascript" src="/js/jquery.pagination.js"></script>
</head>
<body class="pd20">
<div class="filter" style="height:40px;width:820px;">
    <div class="pull-right mt20 btn-add">
        <button class="btn btn-primary new-cus" onClick="newShopping()">新建商品</button>
    </div>
</div>
<div class="table-con">
    <div class="table-edit hide">
        <button class="btn btn-default" onClick="editShopping()"><i class="mt">&#xE254;</i>编辑</button>

        <button class="btn btn-default" onClick="deleteShopping()"><i class="mt">&#xE872;</i>删除</button>

        <span class="pull-right form-title close">
            <i class="mt">close</i>
        </span>
    </div>
    <table class="table table-main had-icon" id="dataTable">
        <thead>
        <tr>
            <th>商品编码</th>
            <th>商品名称</th>
            <th>商品链接</th>
            <th>商品图片链接</th>
            <th>备注</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        </tr>
        </tbody>
    </table>
</div>
<script>

    // 定义变量
    var shoppingID;

    ZZUI.tableEdit.init('.table-main', function ($ele, index) {
        shoppingID = array[index].shoppingId;
    });


    $(function () {
        initDataTable();
        $('table').wrap('<div class="table-box"></div>');
        $('.table-box').append('<div class="nodata nodata-table"><div class="con"><i></i><p>没有找到符合条件的数据</p></div></div>');

        $('#dataTable').dtColumnManager({
            "listTargetID": "column-edit-01", "hideInList": []
        });

        //列表查询
        $("#searchBtn").click(function () {
            $("#dataTable").refreshData();
        });
    });

    //刷新页面
    function flushPage() {
        $("#dataTable").refreshData();
    }

    var array = [];
    //datatable初始化
    function initDataTable() {
        $('#dataTable').comDataTable({
            "aaSorting": [
                [0, "desc"] // 经销商编号排序
            ],
            "sAjaxSource": "/shopping/list",
            "fnServerData": function (sSource, aoData, fnCallback) {
                var postData = aoData.concat($('#searchForm').serializeArray());
                $.post(sSource, postData, function (response) {
                    if (response.status == "success") {
                        if (response.data.iTotalRecords == 0) {
                            $('.nodata').addClass('show');
                        } else {
                            $('.nodata').removeClass('show')
                        }
                        fnCallback(response.data);
                        array = response.data.aaData;
                    } else {
                        // 展示错误信息
                        message.warn(response.message);
                    }
                }, "json");
            },
            "aoColumns": [
                {"sName": "shoppingId", "mDataProp": "shoppingId", "bSortable": false},
                {"sName": "shoppingName", "mDataProp": "shoppingName", "bSortable": false},
                {"sName": "shoppingUrl", "mDataProp": "shoppingUrl", "bSortable": false},
                {"sName": "shoppingImageUrl", "mDataProp": "shoppingImageUrl", "bSortable": false},
                {"sName": "remark", "mDataProp": "remark", "bSortable": false}
            ]
        });
    }

    function newShopping() {
        parent.layer.open({
            type: 2,
            shift: null,
            title: '新建商品',
            area: ['600px', '45%'],
            content: "/shopping/save/index"
        });
    }
    
    function editShopping() {
            parent.layer.open({
                type: 2,
                shift: null,
                title: '编辑联系人',
                area: ['550px', '45%'],
                content: "/shopping/edit/index/" + shoppingID
            });
    }
    
    function deleteShopping() {
        parent.layer.open({
            type: 2,
            shift: null,
            title: '删除商品',
            area: ['450px', '260px'],
            content: "/shopping/delete/index/" + shoppingID
        });
    }

</script>
</body>
</html>