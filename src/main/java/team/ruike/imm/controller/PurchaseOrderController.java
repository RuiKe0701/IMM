package team.ruike.imm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by HP on 2017/12/14.
 */
@Controller
@RequestMapping(value = "/purchaseOrder")
public class PurchaseOrderController {

    //加载购货单页面
    @RequestMapping(value = "loginPurchase.do")
    public String loginPurchase(Model model){
        return "";
    }
}
