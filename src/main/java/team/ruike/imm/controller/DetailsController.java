package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Client;
import team.ruike.imm.entity.Employee;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.service.*;

import java.util.List;

/**
 *商品明细表
 * By-Guoxu
 */
@Controller
@RequestMapping("detail")
public class DetailsController {
    @Autowired
    SalesService salesService;

    @Autowired
    ClientService clientService;

    @Autowired
    EmployeeService employeeService;

    @Autowired
    MerchandiseService merchandiseService;

    @RequestMapping("/logindetailOrders.do")
    public String logindetailOrders(Model model){
        List<Client> clientList = clientService.selecrClient(null);
        List<Employee> employeeList = employeeService.selectEmployee(null);
        List<Merchandise> merchandiseList = merchandiseService.selectMerchandise(null);
        for (Merchandise merchandise : merchandiseList) {
            System.out.println(merchandise.getMerchandiseName());
        }
        String id=salesService.salesId();
        model.addAttribute("salesId",id);
        model.addAttribute("clientss",clientList);
        model.addAttribute("employeess",employeeList);
        model.addAttribute("merchandisess",merchandiseList);
        return "page/Sales/sales-detail";
    }
}
