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

import java.io.PrintWriter;
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
    public void saveSaveInformationList(String saveInformationList, String saveList, PrintWriter printWriter){
        System.out.println(saveList);
        System.out.println(saveInformationList);
        System.out.println("ssssss");
        ArrayList<Sales> sa = JSON.parseObject(saveList, new TypeReference<ArrayList<Sales>>(){});
        Sales s=sa.get(0);
        System.out.println("+++++++++++++++");
        System.out.println(s.getClientId());
        System.out.println(s.getSalesDate());
        System.out.println(s.getEmployeeId());
        System.out.println(s.getSalesId());
        Integer i = salesService.insertSales(s);

        System.out.println("++++++++++++++++++++++++++++++++++++++++");
        ArrayList<SalesInformation> salesInformations =  JSON.parseObject(saveInformationList, new TypeReference<ArrayList<SalesInformation>>(){});

        for (SalesInformation salesInformation : salesInformations) {
            System.out.println("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
            System.out.println(salesInformation.getSiActualPrice()+"+++"+salesInformation.getSiTotalPrice()+"+++"+salesInformation.getMerchandiseId());
        }
        System.out.println(i);

        salesInformationService.insertAll(salesInformations);
        if(i>0){
            String str=JSON.toJSONString(1);
            printWriter.write(str);
            printWriter.flush();
            printWriter.close();
        }else {
            String str=JSON.toJSONString(0);
            printWriter.write(str);
            printWriter.flush();
            printWriter.close();
        }

    }
    @RequestMapping("sssssssss.do")
    public void saveSaveInformationLists(String saveInformationList,String saveList){
        System.out.println(saveList);
        System.out.println(saveInformationList);
        System.out.println("ss");
        ArrayList<Sales> sa = JSON.parseObject(saveList, new TypeReference<ArrayList<Sales>>(){});
        Sales s=sa.get(0);
        System.out.println("+++++++++++++++");

        ArrayList<SalesInformation> salesInformations =  JSON.parseObject(saveInformationList, new TypeReference<ArrayList<SalesInformation>>(){});
        System.out.println("++++++++++++++++++++++++++++++++++++++++");
        for (SalesInformation salesInformation : salesInformations) {
            System.out.println("SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
            System.out.println(salesInformation.getSiActualPrice()+"+++"+salesInformation.getSiTotalPrice()+"+++"+salesInformation.getMerchandiseId());
        }


        salesInformationService.insertAll(salesInformations);
        int i = salesService.insertSales(s);
        System.out.println(i);

    }
}
