package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.*;
import team.ruike.imm.service.*;

import java.util.List;

/**
 *销售汇总表（按商品)
 * By-Guoxu
 */
@Controller
@RequestMapping("commodity")
public class commodityController {
    @Autowired
    SalesService salesService;

    @Autowired
    ClientService clientService;

    @Autowired
    EmployeeService employeeService;

    @Autowired
    MerchandiseService merchandiseService;

    @Autowired
    ProductTypeService productTypeService;

    @RequestMapping("/loginCommodity.do")
    public String logindetailOrders(Model model){
        List<Client> clientList = clientService.selecrClient(null);
        List<Employee> employeeList = employeeService.selectEmployee(null);
        List<Merchandise> merchandiseList = merchandiseService.selectMerchandise(null);
        List<ProductType> productTypeList = productTypeService.selectProductType(null);
        for (ProductType productType : productTypeList) {
            System.out.println(productType.getProductTypeName());
        }
        List<Sales> salesList = salesService.selectSales(null);
        model.addAttribute("clientss",clientList);
        model.addAttribute("employeess",employeeList);
        model.addAttribute("merchandisess",merchandiseList);
        model.addAttribute("productTypess",productTypeList);
        model.addAttribute("saless",salesList);
        return "page/Sales/sales-summary";
    }
}
