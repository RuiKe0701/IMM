package team.ruike.imm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *商品明细表
 * By-Guoxu
 */
@Controller
@RequestMapping("detail")
public class DetailsController {
    @RequestMapping("/logindetailOrders.do")
    public String logindetailOrders(Model model){

        return "page/Sales/sales-detail";
    }
}
