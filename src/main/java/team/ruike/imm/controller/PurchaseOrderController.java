package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.entity.Supplier;
import team.ruike.imm.service.MerchandiseService;
import team.ruike.imm.service.SupplierService;

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
    //加载购货单页面
    @RequestMapping(value = "loginPurchase.do")
    public String loginPurchase(Model model){
        List<Supplier> list = supplierService.selectSuplier(null);
        List<Merchandise> merchandises=merchandiseService.selectAll(null);
        model.addAttribute("merchandises",merchandises);
        model.addAttribute("supps", list);
        return "page/purchase/purchase";
    }
}
