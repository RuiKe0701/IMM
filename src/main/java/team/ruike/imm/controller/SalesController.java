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

import java.util.ArrayList;
import java.util.List;

/**
 * By GuoXu
 * 郭旭
 */
@Controller
@RequestMapping("sales")
public class SalesController {
    @Autowired
    SalesService salesService;

    @Autowired
    ClientService clientService;

    @Autowired
    EmployeeService employeeService;

    @Autowired
    MerchandiseService merchandiseService;

    @Autowired
    SalesInformationService salesInformationService;

    /**
     * 跳转到销货订单
     * @param model
     * @return
     */
    @RequestMapping("/loginsalesOrders.do")
    public String loginsalesOrders(Model model){
        List<Client> clientList = clientService.selecrClient(null);
        List<Employee> employeeList = employeeService.selectEmployee(null);
        List<Merchandise> merchandiseList = merchandiseService.selectMerchandise(null);
        String id=salesService.salesId();
        model.addAttribute("salesId",id);
        model.addAttribute("clientss",clientList);
        model.addAttribute("employeess",employeeList);
        model.addAttribute("merchandisess",merchandiseList);
        return "page/Sales/salesOrders";
    }


    @RequestMapping(value = "ajaxMerchand.do",produces="text/html;charset=UTF-8")
    @ResponseBody
    public Object ajaxMerchand(Merchandise merchandise){
        Merchandise merchandises=merchandiseService.selectOne(merchandise);
        return JSON.toJSONString(merchandises);
    }

    @RequestMapping("saveSaveInformationList.do")
    public void saveProcurementInformationList(String saveInformationList,String saveList,String sss,Integer ss){
        System.out.println(saveList);
        System.out.println(sss);
        System.out.println(ss);
        System.out.println("ssss");
        ArrayList<Sales> sa =  JSON.parseObject(saveList, new TypeReference<ArrayList<Sales>>(){});
        Sales s=sa.get(0);
        int i = salesService.insertSales(s);
        System.out.println(i);
        ArrayList<SalesInformation> salesInformations =  JSON.parseObject(saveInformationList, new TypeReference<ArrayList<SalesInformation>>(){});
        salesInformationService.insertAll(salesInformations);
    }

}
