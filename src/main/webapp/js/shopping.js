$(function () {
    $(".menu-item").mousemove(function () {
        $(this).children(".sub-nav-wrap").show();
    }).mouseout(function () {
        $(this).children(".sub-nav-wrap").hide();
    });
    $("#userName").mousemove(function () {
        $("#user_info").show();
    }).mouseout(function () {
        $("#user_info").hide();
    });


    $("#purchase").click(function () {
        $("#iff").attr("src","/purchases/loginPurchaseOrder.do");
            $("#tabManage").remove();
            $("li").removeClass("l-selected");
            $("div").removeClass("l-tab-links-item-close");
            $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>购货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");

            $("#ons").css("display","none");
            $("#showiframe").css("display","block");
    });

    $("#purchase2").click(function () {
        $("#tabManage").remove();
        $("#iff").attr("src","/purchaseOrder/loginPurchase.do");
    });
    $("#purchase3").click(function () {
        $("#tabManage").remove();
        $("#iff").attr("src","/purchases/showPurchaseSales.do");
    });
    $("#purchase4").click(function () {
        document.getElementById("iff").src="page/purchase/replenishment.html";
    });
    $("#purchase5").click(function () {
        document.getElementById("iff").src="page/purchase/purchaseDetails.html";
    });
    $("#purchase6").click(function () {
        document.getElementById("iff").src="page/purchase/procurementSummary.html";
    });
    $("#purchase7").click(function () {
        document.getElementById("iff").src="page/purchase/purchasePayment.html";
    });

    $("body").on("click","#aaa",function(){
        $(this).parent().remove();
    });
    aaa();
});

function  aaa() {
    $("#filter-submit").click(function () {
        $(".no-query").remove();
        $(".ui-print").css("display","block");
    });
}
