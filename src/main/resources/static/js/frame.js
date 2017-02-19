$(function(){
    $('.nav li').live("click",function() {
        $('.nav li').removeClass('active');
        $(this).addClass('active');
    });
    $('.sec-nav li').live("click",function() {
        $('.sec-nav li').removeClass('active');
        $(this).addClass('active');
    });
});

/**
 *
 * @param parentMenuUrl
 * @param cinchildMenuUrlfo
 */
function checkParentStyle(parentMenuUrl,childMenuUrl){
    $(".nav li").removeClass("active").each(function(){
        if($(this).children().eq(0).attr("data-url") == parentMenuUrl){
            $(this).addClass("active");

            //alert($(this).children().eq(0).attr("data"));//父级菜单编号
            listChildrenMenu($(this).children().eq(0).attr("data"), childMenuUrl);
        }
    });
};

// 单独页面隐藏二级导航
function hideSubNav(){
    $(".wrapper").addClass("single");
}

//显示二级菜单
function showSubNav(){
    $(".wrapper").removeClass("single");
}



//自页面面包屑导航处理
function menuReturns(){
    //一级菜单的url
    var menu=$(".nav .active").children("a").attr("data-url");
    //一级菜单
    var menuName=$(".nav .active").children("a").attr("name");
    //获取一级菜单下的第一个二级菜单地址
    var firstUrl=$(".sec-nav .active").children("li").eq(0).children("a").attr("href");
    //二级菜单的地址
    var requestUrl=$(".sec-nav .active").children("a").attr("href");
    //二级菜单名称
    var name=$(".sec-nav .active").children("a").attr("name");
    window.frames["mainFrame"].$("#menu").attr("data",menu+"_"+firstUrl);
    window.frames["mainFrame"].$("#menu").text(menuName);
    window.frames["mainFrame"].$("#url").attr("data",menu+"_"+requestUrl);
    window.frames["mainFrame"].$("#url").text(name);
}
