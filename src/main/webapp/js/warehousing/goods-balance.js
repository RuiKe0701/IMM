$(function () {
    //修改客户是否合作
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
                        alert("修改合作关系成功")
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

    //添加用户信息
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
                alert("添加成功")
                window.location.reload();
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    })


    //修改用户信息
    $("#updates").click(function () {
        var clients = new Array();
        var object =new Object();
        object.clientId= $("#updateid").val();
        object.clientName= $("#updatename").val();
        object.clientPersonInCharge= $("#updatepersonInCharge").val();
        object.clientPost= $("#updatepost").val();
        object.clientAddress= $("#updateaddress").val();
        object.clientFactoryAddress= $("#updatefactoryAddress").val();
        object.clientMobilePhone= $("#updatemobilePhone").val();
        object.clientPhone= $("#updatephone").val();
        object.clientFax= $("#updatefax").val();
        clients.push(object);
        var clientList = JSON.stringify(clients);
        $.ajax({
            type: "post",
            url: "/client/updatesClient.do",
            data: {
                "clientList": clientList
            },
            dataType: "json",
            success: function (data) {
                if(data!=0){
                    alert("修改用户信息成功")
                    window.location.reload();
                }else {
                    alert("修改用户信息失败")
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    })
})
//获取要修改的信息
function updatemerchandise(val){
    alert(val)
    $.ajax({
        type: "post",
        url: "/merchandise/merchandiseId.do?merchandiseId="+val,
        dataType: "json",
        success: function (data) {
            if(data!=0){
                $.each(data, function(i,item){
                    $("#updatemerchandiseId").val(item.merchandiseId)
                    $("#updatemerchandiseName").val(item.merchandiseName)
                    $("#updatemerchandiseSpecification").val(item.merchandiseSpecification)
                    $("#updateproductTypeId").val(item.productType.productTypeName)
                    $("#updateunitsId").val(item.units.unitsName)
                    $("#updatemerchandisePlaceOfOsrigin").val(item.merchandisePlaceOfOrigin)
                    $("#updatemerchandiseActualQuntity").val(item.merchandiseActualQuntity)
                    $("#updatemerchandiseSalsePrice").val(item.merchandiseSalsePrice)
                    $("#updatesalesStatusId").val(item.salesStatus.salesStatusName)
                });
            }
        },
        error: function () {
            alert("系统异常，请稍后重试！");
        }
    })
}