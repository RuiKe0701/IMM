$(function () {
    //修改为不合作客户
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
                var noncooperationClient = JSON.stringify(clientList);
                $.ajax({
                    type: "post",
                    url: "/client/noncooperationClient.do",
                    data: {
                        "noncooperationClient": noncooperationClient
                    },
                    dataType: "json",
                    success: function (data) {
                        if(data!=0){
                            for(i in data){
                                $("#"+data[i].clientId).remove();
                            }
                        }
                        alert("修改合作关系成功")
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
                $("#closeAdd").click();
                alert("添加成功")
                var str = "";
                if(data!=0){
                    var da = eval(data);
                    $("#tbod").html("");
                    $.each(da,function (i, item) {
                        str+="<tr id="+item.clientId+" class='clients'>" +
                            "                <td><input name=\"client.kk\" class=\"k\"  runat=\"server\" type=\"checkbox\" value="+item.clientId+" /></td>\n" +
                            "                <td id=\"clientId\" style=\"display: none\">"+item.clientId+"</td>\n" +
                            "                <td id=\"clientName\">"+item.clientName+"</td>\n" +
                            "                <td id=\"clientPersonInCharge\">"+item.clientPersonInCharge+"</td>\n" +
                            "                <td id=\"clientPost\">"+item.clientPost+"</td>\n" +
                            "                <td id=\"clientPhone\">"+item.clientPhone+"</td>\n" +
                            "                <td id=\"clientMobilePhone\">"+item.clientMobilePhone+"</td>\n" +
                            "                <td id=\"clientFax\">"+item.clientFax+"</td>\n" +
                            "                <td id=\"clientAddress\">"+item.clientAddress+"</td>\n" +
                            "                <td id=\"clientFactoryAddress\">"+item.clientFactoryAddress+"</td>\n" +
                            "                <td  id=\"clientState\">"+item.state+"</td>\n"+
                            "                <td  >\n" +
                            "                    <button type=\"button\" onclick=\"gainclient("+item.clientId+")\"id=\""+item.clientId+"\" data-target=\"#update\" name=\"updateClient\"   class=\"btn btn-info btn-sm\" data-toggle=\"modal\"  ><span class=\"up\">修改</span></button>\n" +
                            "                </td>\n" +
                            "            </tr>";
                    })
                    $("#tbod").append(str);
                }
                $("#addname").val("");
                $("#addpersonInCharge").val("");
                $("#addpost").val("");
                $("#addphone").val("");
                $("#addmobilePhone").val("");
                $("#addfax").val("");
               $("#addaddress").val("");
                $("#addfactoryAddress").val("");
                $("#addstate").val("");
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
                $("#closeUpdate").click();
                var str = "";
                if(data!=0){
                    var da = eval(data);
                    $("#tbod").html("");
                    $.each(da,function (i, item) {
                        str+="<tr id="+item.clientId+" class='clients'>" +
                            "                <td><input name=\"client.kk\" class=\"k\"  runat=\"server\" type=\"checkbox\" value="+item.clientId+" /></td>\n" +
                            "                <td id=\"clientId\" style=\"display: none\">"+item.clientId+"</td>\n" +
                            "                <td id=\"clientName\">"+item.clientName+"</td>\n" +
                            "                <td id=\"clientPersonInCharge\">"+item.clientPersonInCharge+"</td>\n" +
                            "                <td id=\"clientPost\">"+item.clientPost+"</td>\n" +
                            "                <td id=\"clientPhone\">"+item.clientPhone+"</td>\n" +
                            "                <td id=\"clientMobilePhone\">"+item.clientMobilePhone+"</td>\n" +
                            "                <td id=\"clientFax\">"+item.clientFax+"</td>\n" +
                            "                <td id=\"clientAddress\">"+item.clientAddress+"</td>\n" +
                            "                <td id=\"clientFactoryAddress\">"+item.clientFactoryAddress+"</td>\n" +
                            "                <td  id=\"clientState\">"+item.state+"</td>\n"+
                            "                <td  >\n" +
                            "                    <button type=\"button\" onclick=\"gainclient("+item.clientId+")\"id=\""+item.clientId+"\" data-target=\"#update\" name=\"updateClient\"   class=\"btn btn-info btn-sm\" data-toggle=\"modal\"  ><span class=\"up\">修改</span></button>\n" +
                            "                </td>\n" +
                            "            </tr>";
                    })
                    $("#tbod").append(str);
                }
                $("#updatename").val("");
                $("#updatepersonInCharge").val("");
                $("#updatepost").val("");
                $("#updatephone").val("");
                $("#updatemobilePhone").val("");
                $("#updatefax").val("");
                $("#updateaddress").val("");
                $("#updatefactoryAddress").val("");
                $("#updatestate").val("");
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    })
    //查看终止合作的
    $("#termination").click(function () {
        var clientState=this.name;
        document.getElementById("btn-disable").setAttribute("disabled",true);
        $("#btn-enable").attr("disabled",false);
        $.ajax({
            type:"post",
            url:"/client/clientCooperation.do?clientState="+clientState,
            dataType: "json",
            success: function (data) {
                var str = "";
                if(data!=0){
                    var da = eval(data);
                    $("#tbod").html("");
                    $.each(da,function (i, item) {
                        str+="<tr id="+item.clientId+" class='clients'>" +
                            "                <td><input name=\"client.kk\" class=\"k\"  runat=\"server\" type=\"checkbox\" value="+item.clientId+" /></td>\n" +
                            "                <td id=\"clientId\" style=\"display: none\">"+item.clientId+"</td>\n" +
                            "                <td id=\"clientName\">"+item.clientName+"</td>\n" +
                            "                <td id=\"clientPersonInCharge\">"+item.clientPersonInCharge+"</td>\n" +
                            "                <td id=\"clientPost\">"+item.clientPost+"</td>\n" +
                            "                <td id=\"clientPhone\">"+item.clientPhone+"</td>\n" +
                            "                <td id=\"clientMobilePhone\">"+item.clientMobilePhone+"</td>\n" +
                            "                <td id=\"clientFax\">"+item.clientFax+"</td>\n" +
                            "                <td id=\"clientAddress\">"+item.clientAddress+"</td>\n" +
                            "                <td id=\"clientFactoryAddress\">"+item.clientFactoryAddress+"</td>\n" +
                            "                <td  id=\"clientState\">"+item.state+"</td>\n"+
                            "                <td  >\n" +
                            "                    <button type=\"button\" onclick=\"gainclient("+item.clientId+")\"id=\""+item.clientId+"\" data-target=\"#update\" name=\"updateClient\"   class=\"btn btn-info btn-sm\" data-toggle=\"modal\"  ><span class=\"up\">修改</span></button>\n" +
                            "                </td>\n" +
                            "            </tr>";
                    })
                    $("#tbod").append(str);
                }else {
                    alert("失败")
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    })

    //        查看在合作
    $("#cooperation").click(function () {
        var clientState=this.name;
        document.getElementById("btn-enable").setAttribute("disabled",true);
        $("#btn-disable").attr("disabled",false);
        $.ajax({
            type:"post",
            url:"/client/clientCooperation.do?clientState="+clientState,
            dataType: "json",
            success: function (data) {
                var str = "";
                if(data!=0){
                    var da = eval(data);
                    $("#tbod").html("");
                    $.each(da,function (i, item) {
                        str+="<tr id="+item.clientId+" class='clients'>" +
                            "                <td><input name=\"client.kk\" class=\"k\"  runat=\"server\" type=\"checkbox\" value="+item.clientId+" /></td>\n" +
                            "                <td id=\"clientId\" style=\"display: none\">"+item.clientId+"</td>\n" +
                            "                <td id=\"clientName\">"+item.clientName+"</td>\n" +
                            "                <td id=\"clientPersonInCharge\">"+item.clientPersonInCharge+"</td>\n" +
                            "                <td id=\"clientPost\">"+item.clientPost+"</td>\n" +
                            "                <td id=\"clientPhone\">"+item.clientPhone+"</td>\n" +
                            "                <td id=\"clientMobilePhone\">"+item.clientMobilePhone+"</td>\n" +
                            "                <td id=\"clientFax\">"+item.clientFax+"</td>\n" +
                            "                <td id=\"clientAddress\">"+item.clientAddress+"</td>\n" +
                            "                <td id=\"clientFactoryAddress\">"+item.clientFactoryAddress+"</td>\n" +
                            "                <td  id=\"clientState\">"+item.state+"</td>\n"+
                            "                <td  >\n" +
                            "                    <button type=\"button\" onclick=\"gainclient("+item.clientId+")\"id=\""+item.clientId+"\" data-target=\"#update\" name=\"updateClient\"   class=\"btn btn-info btn-sm\" data-toggle=\"modal\"  ><span class=\"up\">修改</span></button>\n" +
                            "                </td>\n" +
                            "            </tr>";
                    })
                    $("#tbod").append(str);
                }else {
                    alert("失败")
                }
            },
            error: function () {
                alert("系统异常，请稍后重试！");
            }
        })
    })
})
//获取要修改的信息
function gainclient(val){
    $.ajax({
        type: "post",
        url: "/client/clientId.do?clientId="+val,
        dataType: "json",
        success: function (data) {
            if(data!=0){
                $.each(data, function(i,item){
                    $("#updateid").val(item.clientId)
                    $("#updatename").val(item.clientName)
                    $("#updatepersonInCharge").val(item.clientPersonInCharge)
                    $("#updatepost").val(item.clientPost)
                    $("#updateaddress").val(item.clientAddress)
                    $("#updatefactoryAddress").val(item.clientFactoryAddress)
                    $("#updatemobilePhone").val(item.clientMobilePhone)
                    $("#updatephone").val(item.clientPhone)
                    $("#updatefax").val(item.clientFax)
                });
            }
        },
        error: function () {
            alert("系统异常，请稍后重试！");
        }
    })
}