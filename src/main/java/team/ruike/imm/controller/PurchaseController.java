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
import team.ruike.imm.service.ProcurementInformationService;
import team.ruike.imm.service.ProcurementService;
import team.ruike.imm.service.SupplierService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by HP on 2017/11/29.
 */

@Controller
@RequestMapping(value = "/purchases")
public class PurchaseController {
    @Autowired
    SupplierService supplierService;
    @Autowired
    ProcurementService procurementService;
    @Autowired
    MerchandiseService merchandiseService;
    @Autowired
    ProcurementInformationService procurementInformationService;
    @RequestMapping("/loginPurchaseOrder.do")
    public String loginPurchaseOrder(Model model) {
        List<Supplier> list = supplierService.selectSuplier(null);
        List<Merchandise> merchandises=merchandiseService.selectMerchandise(null);
        String id=procurementService.purchaseId();
        model.addAttribute("purId",id);
        model.addAttribute("merchandises",merchandises);
        model.addAttribute("supps", list);
        return "page/purchase/purchaseOrder";
    }
    @RequestMapping(value = "saveSupplierorProcureMent")
    public  String saveSupplierorProcureMent(Procurement procurement){
        return "page/purchase/purchaseOrder";
    }
    @RequestMapping(value = "ajaxMerchand.do",produces="text/html;charset=UTF-8")
    @ResponseBody
    public Object ajaxMerchand(Merchandise merchandise){
        Merchandise merchandises=merchandiseService.selectOne(merchandise);
        return JSON.toJSONString(merchandises);
    }
    @RequestMapping(value = "saveProcurementInformationList.do",produces="text/html;charset=UTF-8")
    public void saveProcurementInformationList(String procurementInformationList,String procurementList){
        ArrayList<Procurement> pr =  JSON.parseObject(procurementList, new TypeReference<ArrayList<Procurement>>(){});
        Procurement p=pr.get(0);
        int i=procurementService.insertProcurement(p);
        System.out.println(i);
        ArrayList<ProcurementInformation> procurementInformations =  JSON.parseObject(procurementInformationList, new TypeReference<ArrayList<ProcurementInformation>>(){});
       procurementInformationService.insertAll(procurementInformations);
    }
}
