$(function () {
    $("#customer").click(function () {
        i++;
        if(i==2){
            $("#tabManage").remove();
            document.getElementById("iff").src="page/purchase/purchaseOrder.html";
        }
    });
}