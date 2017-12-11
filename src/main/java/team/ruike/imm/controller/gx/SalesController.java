package team.ruike.imm.controller.gx;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Client;
import team.ruike.imm.entity.Employee;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.service.gx.MerchandiseService;
import team.ruike.imm.service.szw.EmployeeService;
import team.ruike.imm.service.gx.SalesService;
import team.ruike.imm.service.szw.ClientService;

import java.util.List;

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


    @RequestMapping("/loginsalesOrders.do")
    public String loginsalesOrders(Model model){
        List<Client> clientList = clientService.selecrClient(null);
        List<Employee> employeeList = employeeService.selectEmployee(null);
        List<Merchandise> merchandiseList = merchandiseService.selectMerchandise(null);
        model.addAttribute("clientss",clientList);
        model.addAttribute("employeess",employeeList);
        model.addAttribute("merchandisess",merchandiseList);
        return "page/Sales/salesOrders";
    }

    @RequestMapping("/loginsalesOrdersForAbout.do")
    public String loginsalesOrdersForAbout(Model model){
        return "page/Sales/invPu";
    }


}
