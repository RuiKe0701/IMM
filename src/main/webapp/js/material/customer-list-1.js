$(document).ready(function() {
    //修改客户是否联系
    $("#btn-disable").click(function () {
        var clientList = new Array();
        $(".clients").each(function (index, date) {
            var checkbox = $(date).find(".k");
            if(checkbox.is(':checked')){
                //选中了
                var id = $(date).find(".k").val();
                var object = new Object();
                object.kk = id;
                clientList.push(object);
                var stuattendancelists = JSON.stringify(clientList);
                $.ajax({
                    type: "post",
                    url: "/client/k.do",
                    data: {
                        "stuattendancelists": stuattendancelists
                    },
                    dataType: "json",
                    success: function (data) {
                        alert("成功了")
                        for(i in data){
                            $("#"+data[i].clientId).remove();
                        }
                    },
                    error: function () {
                        alert("系统异常，请稍后重试！");
                    }
                })
            }
        });
    })



})