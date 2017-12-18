package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ruike.imm.entity.*;
import team.ruike.imm.service.MerchandiseService;
import team.ruike.imm.service.PurchaseOrderInformationService;
import team.ruike.imm.service.PurchaseOrderService;
import team.ruike.imm.service.SupplierService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by HP on 2017/12/14.
 */
@Controller
@RequestMapping(value = "/purchaseOrder")
public class PurchaseOrderController {
    @Autowired
    MerchandiseService merchandiseService;
    @Autowired
    SupplierService supplierService;
    @Autowired
    PurchaseOrderService purchaseOrderService;
    @Autowired
    PurchaseOrderInformationService purchaseOrderInformationService;
    //加载购货单页面
    @RequestMapping(value = "loginPurchase.do")
    public String loginPurchase(Model model){
        List<Supplier> list = supplierService.selectSuplier(null);
        List<Merchandise> merchandises=merchandiseService.selectAll(null);
        String id=purchaseOrderService.purchaseId();
        model.addAttribute("purId",id);
        model.addAttribute("merchandises",merchandises);
        model.addAttribute("supps", list);
        return "page/purchase/purchase";
    }
    @RequestMapping(value = "savePurchaseOrder.do")
    @ResponseBody
    public  void  savePurchaseOrder(String purchaseorderList,String purchaseList){
        System.out.println(purchaseorderList);
        System.out.println("---------------------------------------");
        System.out.println(purchaseList);

        ArrayList<PurchaseOrder> purchaseOrders =  JSON.parseObject(purchaseorderList, new TypeReference<ArrayList<PurchaseOrder>>(){});
        List<PurchaseOrderInformation> purchaseOrderInformations =  JSON.parseObject(purchaseList, new TypeReference<ArrayList<PurchaseOrderInformation>>(){});
        PurchaseOrder order=purchaseOrders.get(0);

        int i= purchaseOrderService.savePurchaseOrder(order);
       purchaseOrderInformationService.batchInsertPurchaseOrder(purchaseOrderInformations);

    }

}
