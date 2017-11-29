package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.service.SalesService;

@Controller
@RequestMapping("sales")
public class SalesController {
    @Autowired
    SalesService salesService;

    @RequestMapping("/loginsalesOrders.do")
    public String loginsalesOrders(Model model){
        return "page/Sales/salesOrders";
    }
}
