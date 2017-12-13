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
 * By-GuoXu
 */
@Controller
@RequestMapping("salesForThis")
public class InvPuController {

    @Autowired
    SalesService salesService;

    @Autowired
    ClientService clientService;

    @Autowired
    ProcurementService procurementService;

    @Autowired
    EmployeeService employeeService;

    @Autowired
    MerchandiseService merchandiseService;

    @Autowired
    ProcurementInformationService procurementInformationService;

    @Autowired
    SalesInformationService salesInformationService;


    /**
     * 跳转到销货单
     * @param model
     * @return
     */
    @RequestMapping("/loginsalesOrdersForAbout.do")
    public String loginsalesOrdersForAbout(Model model){
        List<Client> clientList = clientService.selecrClient(null);
        List<Employee> employeeList = employeeService.selectEmployee(null);
        List<Merchandise> merchandiseList = merchandiseService.selectMerchandise(null);
        String id=procurementService.purchaseId();
        model.addAttribute("purId",id);
        model.addAttribute("clientss",clientList);
        model.addAttribute("employeess",employeeList);
        model.addAttribute("merchandisess",merchandiseList);
        return "page/Sales/invPu";
    }


}
