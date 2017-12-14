package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ruike.imm.entity.*;
import team.ruike.imm.service.*;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
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
    @Autowired
    SalesInformationService salesInformationService;
    //加载购货订单数据，返回购货订单页面
    @RequestMapping("/loginPurchaseOrder.do")
    public String loginPurchaseOrder(Model model) {
        List<Supplier> list = supplierService.selectSuplier(null);
        List<Merchandise> merchandises=merchandiseService.selectMerchandise(null);
        String id=procurementService.purchaseId("GHDD");
        model.addAttribute("purId",id);
        model.addAttribute("merchandises",merchandises);
        model.addAttribute("supps", list);
        return "page/purchase/purchaseOrder";
    }
    @RequestMapping(value = "saveSupplierorProcureMent")
    public  String saveSupplierorProcureMent(Procurement procurement){
        return "page/purchase/purchaseOrder";
    }
    //显示一个商品信息
    @RequestMapping(value = "ajaxMerchand.do",produces="text/html;charset=UTF-8")
    @ResponseBody
    public Object ajaxMerchand(Merchandise merchandise){
        Merchandise merchandises=merchandiseService.selectOne(merchandise);
        return JSON.toJSONString(merchandises);
    }
    //批量添加购货订单
    @RequestMapping(value = "saveProcurementInformationList.do",produces="text/html;charset=UTF-8")
    @ResponseBody
    public void saveProcurementInformationList(String procurementInformationList, String procurementList, PrintWriter printWriter){
        ArrayList<Procurement> pr =  JSON.parseObject(procurementList, new TypeReference<ArrayList<Procurement>>(){});
        Procurement p=pr.get(0);
        int i=procurementService.insertProcurement(p);
        ArrayList<ProcurementInformation> procurementInformations =  JSON.parseObject(procurementInformationList, new TypeReference<ArrayList<ProcurementInformation>>(){});
        procurementInformationService.insertAll(procurementInformations);
        String jsonString = JSON.toJSONString(i);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    //显示已销订购
    @RequestMapping(value = "showPurchaseSales.do")
    public  String showPurchaseSales(Model model,HttpSession session){
        List<SalesInformation> salesInformations= salesInformationService.selectSalesInformation(null);
        List<Merchandise> merchands=merchandiseService.selectMerchandise(null);
        model.addAttribute("salesInformations",salesInformations);
        session.setAttribute("merchands",merchands);
        return "page/purchase/purchaseSales";
    }
    //接收已销订单传值
    @RequestMapping(value = "generateOrders.do")
    @ResponseBody
    public void generateOrders(String procurementInformationList,String salesInformationList, HttpSession session,PrintWriter printWriter){
        ArrayList<SalesInformation> salesInformationArrayList =  JSON.parseObject(salesInformationList, new TypeReference<ArrayList<SalesInformation>>(){});
        ArrayList<ProcurementInformation> procurementInformations =  JSON.parseObject(procurementInformationList, new TypeReference<ArrayList<ProcurementInformation>>(){});
        session.setAttribute("salesInformationArrayList",salesInformationArrayList);
        session.setAttribute("procurementInformations",procurementInformations);
        String jsonString = JSON.toJSONString("1");
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    //跳转到购货单页面
    @RequestMapping(value = "purchaseOrderLoginParam.do")
    public String purchaseOrderLoginParam(){
        return"";
    }
}
