$(function () {
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

    $("#insert").click(function () {
        var clients = new Array();
        var object =new Object();
        object.clientName= $("#addname").val();
        object.clientPersonInCharge= $("#addpersonInCharge").val();
        object.clientPost= $("#addpost").val();
        object.clientPhone= $("#addphone").val();
        object.clientMobilePhone= $("#addmobilePhone").val();
        object.clientFax= $("#addfax").val();
        object.clientAddress= $("#addaddress").val();
        object.clientFactoryAddress= $("#addfactoryAddress").val();
        object.clientState= $("#addstate").val();
        clients.push(object);
        var clientList = JSON.stringify(clients);
        $.ajax({
            type: "post",
            url: "/client/addClient.do",
            data: {
                "clientList": clientList
            },
            dataType: "json",
            success: function (data) {
                alert("成功了")
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    })

})