//日期格式化
Date.prototype.format = function(format) {
    var date = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S+": this.getMilliseconds()
    };
    if (/(y+)/i.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));
    }
    for (var k in date) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));
        }
    }
    return format;
}


//获取 yyyy-MM-dd
var timeYMD = function(aDate)
{
    if(null == aDate)
    {
        return "";
    }
    else
    {
        return new Date(aDate).format("yyyy-MM-dd");
    }
};

//时间格式化
var timeFmt = function(aDate)
{
    if(null == aDate)
    {
        return "";
    }
    else
    {
        return new Date(aDate).format("yyyy-MM-dd hh:mm:ss");
    }
};


//时间校验
var timeNormal = function(aDate)
{
    if(null == aDate)
    {
        return "";
    }
    else
    {
        return aDate.substr(0,aDate.length - 2);
    }
};

//获取 MM-dd
var timeMD = function (aDate) {
    if (null == aDate) {
        return "";
    }
    else {
        return aDate.substr(5, 5);
    }
};
// 保留两位小数
function to2bits(flt){
    if(parseFloat(flt) == flt){
        return Math.round(flt * 100) / 100;
    }else{
        return 0;
    }
}

// 校验银行卡号规则
function bankIdValidate(bankId) {
    var regex = /^[0-9]{8,30}$/;
    if (regex.test(bankId)) {
        return true;
    }
    return false;
}