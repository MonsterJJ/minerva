
function loadCity() {
    $("#city").empty();
    if ($("#province").val()) {
        var ret = $.ajax({
            url : "/area/list/"+$("#province").val(),
            type : "post",
            async : false,
            cache : false
        }).responseText;

        var json = eval("(" + ret + ")");
        if (json.status == "success") {
            var list = json.data;
            $("#city").empty();
            for ( var i = 0; i < list.length; i++) {
                var rec = list[i];
                var selected = rec.id == city ? "selected" : "";
                $("#city").append(
                        "<option "+selected+" value='"+rec.id+"'>"
                        + rec.areaName + "</option>");
            }
        }
        $("#area").empty();
        if ($("#city").val()) {
            loadArea();
        }
    }
}

function loadArea() {
    var ret = $.ajax({
        url : "/area/list/"+$("#city").val(),
        type : "post",
        async : false,
        cache : false
    }).responseText;

    var json = eval("(" + ret + ")");
    if (json.status == "success") {
        var list = json.data;
        $("#area").empty();
        for ( var i = 0; i < list.length; i++) {
            var rec = list[i];
            var selected = rec.id == area ? "selected" : "";
            $("#area").append(
                    "<option "+selected+" value='"+rec.id+"'>" + rec.areaName
                    + "</option>");
        }
    }
}