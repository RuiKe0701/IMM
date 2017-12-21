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
import org.jeecgframework.poi.excel.entity.ExportParams;
import org.jeecgframework.poi.excel.entity.params.ExcelExportEntity;
import org.jeecgframework.poi.excel.entity.vo.MapExcelConstants;
import org.jeecgframework.poi.excel.entity.vo.NormalExcelConstants;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.*;

import org.springframework.ui.ModelMap;

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
    public  void  savePurchaseOrder(String purchaseorderList,String purchaseList,PrintWriter printWriter){
        ArrayList<PurchaseOrder> purchaseOrders =  JSON.parseObject(purchaseorderList, new TypeReference<ArrayList<PurchaseOrder>>(){});
        List<PurchaseOrderInformation> purchaseOrderInformations =  JSON.parseObject(purchaseList, new TypeReference<ArrayList<PurchaseOrderInformation>>(){});
        PurchaseOrder order=purchaseOrders.get(0);
        int i= purchaseOrderService.savePurchaseOrder(order);
       purchaseOrderInformationService.batchInsertPurchaseOrder(purchaseOrderInformations);
        String jsonString = JSON.toJSONString("1");
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();

    }
    @RequestMapping("/MapExportExcel.do")
    @ResponseBody
    public String exportMerchantProfitQuery(ModelMap modelMap,String procurementInformationList,String procurementList,  HttpServletRequest request) {
        System.out.println("进入方法");
        ArrayList<ProcurementInformation> parseObject =  JSON.parseObject(procurementInformationList, new TypeReference<ArrayList<ProcurementInformation>>(){});
        List<ExcelExportEntity> entityList = new ArrayList<ExcelExportEntity>();
        entityList.add(new ExcelExportEntity("用户ID", "id", 35));
        entityList.add(new ExcelExportEntity("用户名", "name", 15));
        entityList.add(new ExcelExportEntity("用户年龄", "age", 15));
        List<Map<String, String>> dataResult = getData();
        modelMap.put(MapExcelConstants.ENTITY_LIST, entityList);
        modelMap.put(MapExcelConstants.MAP_LIST, parseObject);
        modelMap.put(MapExcelConstants.FILE_NAME, "商户利润");
        Date now = new Date();
        modelMap.put(NormalExcelConstants.PARAMS, new ExportParams("商户利润详情", "创建时间" + now.toLocaleString(), "商户"));
        return MapExcelConstants.JEECG_MAP_EXCEL_VIEW;
    }
    private List<Map<String, String>> getData() {
        List<Map<String, String>> dataResult = new ArrayList<Map<String, String>>();
        Map<String, String> u1 = new LinkedHashMap<String, String>();
        u1.put("id", "1");
        u1.put("name", "cyf");
        u1.put("age", "21");

        Map<String, String> u2 = new LinkedHashMap<String, String>();
        u2.put("id", "2");
        u2.put("name", "cy");
        u2.put("age", "22");
        dataResult.add(u1);
        dataResult.add(u2);
        return dataResult;
    }


}
