//常用项配置和汉化
$.fn.comDataTable=function (init){
    var oInit={
        "bDestroy":true,
        "sDom": 'rt<"bottom"lip>', // 元素布局
        "bPaginate":true, //翻页功能
        "bLengthChange":true, //改变每页显示数据数量
        "bFilter": false, //过滤功能
        "bSort": true, //排序功能
        "bInfo":true,//页脚信息
        "bAutoWidth":false,//自动宽度
        "bStateSave": false,//保存条件等状态在cookie里
        "fnStateLoadParams": function (oSettings, oData) {
            oData.iStart="0"; // 不读取查询页数相关cookie
        } ,
        "oLanguage": {
            "sLengthMenu": "每页显示 _MENU_ 行",
            "sZeroRecords": "请选择条件后，按查询按钮开始查询",
            "sProcessing": "正在查询...",
            "sInfo": "当前第 _START_ - _END_ 行　共计 _TOTAL_ 行",
            "sInfoEmpty": "没有符合条件的记录",
            "sInfoFiltered": "(从 _MAX_ 条记录中过滤)",
            "sSearch": "搜索：",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "上一页",
                "sNext": "下一页",
                "sLast": "尾页"
            }
        },
        "sPaginationType": "full_numbers",
        "aLengthMenu": [[10, 20, 30, 50], [10, 20, 30, 50]],
        "bProcessing": true,
        "bServerSide": true
    };


    $.extend(true,oInit,init);
    $(this).dataTable(oInit);

};
//刷新数据
$.fn.refreshData=function(){
    $('.table-edit .close').click();
    var oTable = $(this).dataTable();
    oTable.fnPageChange("first");
};
//控制dataTable列的显示和隐藏
$.fn.dtColumnManager=function(init){
    var oTable = $(this).dataTable();
    var tableId = $(this).attr("id");
    var  showid=init.listTargetID;
    var hideInList=init.hideInList;
    var colList='';
    var settings=oTable.fnSettings().aoColumns;
    $(settings).each(function(index,element){
        if($.inArray(index,hideInList)==-1){
            colList+='<li>';
            if(element.bVisible)
                colList+='<input id="colum_'+index+'" type="checkbox" checked="checked" onclick="fnShowHide(\''+tableId+'\','+index+')"/>';
            else
                colList+='<input  id="colum_'+index+'" type="checkbox" onclick="fnShowHide(\''+tableId+'\','+index+')"/>';
            colList+='<label for="colum_'+index+'">'+element.sTitle+"</label>";
            colList+='</li>';
        }
    });
    if($('#'+showid)){
        $('#'+showid).append(colList);
    }
};
//dataTable列的显示和隐藏切换实现
var fnShowHide = function (tableId, iCol ) {
    var oTable = $('#'+tableId).dataTable();
    var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
    oTable.fnSetColumnVis( iCol, bVis ? false : true );
};