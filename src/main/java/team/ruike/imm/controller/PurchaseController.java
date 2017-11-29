package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Supplier;
import team.ruike.imm.service.SupplierService;
import team.ruike.imm.service.UserService;

import java.util.List;

/**
 * Created by HP on 2017/11/29.
 */
@Controller
@RequestMapping("purchase")
public class PurchaseController {
    @Autowired
    SupplierService supplierService;

    @RequestMapping("/loginPurchaseOrder.do")
    public String loginPurchaseOrder(Model model){
       // List<Supplier> suppliers= supplierService.selectSuplier(null);
        //model.addAttribute("suppliers",suppliers);
        return "page/purchase/purchaseOrder";
    }
}
