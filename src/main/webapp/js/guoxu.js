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

    $("#sales").click(function () {
            $("#tabManage").remove();
            $("li").removeClass("l-selected");
            $("div").removeClass("l-tab-links-item-close");
           // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
            $("#iff").attr("src", "/sales/loginsalesOrders.do");

            $("#ons").css("display", "none");
            $("#showiframe").css("display", "block");

    });

    $("#salesForAbout").click(function () {
        alert("asddf");
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
       // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/salesForThis/loginsalesOrdersForAbout.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });

    $("#Original-document").click(function () {
        alert("asd");
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrdersForAbout.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });


    $("#Sales-details").click(function () {
        alert("asd");
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrdersForAbout.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });

    $("#Sales-summary-commodity").click(function () {
        alert("asd");
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrdersForAbout.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });

    $("#Sales-summary-client").click(function () {
        alert("asd");
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrdersForAbout.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });

    $("#Sales-summary-salesperson").click(function () {
        alert("asd");
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrdersForAbout.do");

        $("#ons").css("display", "none");
        $("#showiframe").css("display", "block");

    });

    $("#Sales-ranking").click(function () {
        alert("asd");
        $("#tabManage").remove();
        $("li").removeClass("l-selected");
        $("div").removeClass("l-tab-links-item-close");
        // $("#iframs").before().append("<li tabid=\"purchase-purchaseOrder\" class=\"l-selected\"><a>销货订单</a><div class=\"l-tab-links-item-left\"></div><div class=\"l-tab-links-item-right\"></div><div id='aaa' class=\"l-tab-links-item-close\"></div></li> <li id=\"tabManage\"></li>");
        $("#iff").attr("src", "/sales/loginsalesOrdersForAbout.do");

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
