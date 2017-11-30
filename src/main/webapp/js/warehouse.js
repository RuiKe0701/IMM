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

    //调拨单
    $("#Requisition").click(function () {
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrders.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });

    //商品库存余额
    $("#Goods-inventory-balance").click(function () {
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrders.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });

    //商品收发明细表
    $("#Goods-receipt-details").click(function () {
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrders.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });

    //商品收发汇总表
    $("#Send-and-receive-goods-summary").click(function () {
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrders.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

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
