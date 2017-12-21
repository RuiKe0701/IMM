package team.ruike.imm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by HP on 2017/12/21.
 */
@Controller
@RequestMapping(value = "purchaseDetails")
public class purchaseDetailsController {
    //跳转采购明细页面
    @RequestMapping(value = "login.do")
    public String login(){
        return "page/purchase/purchaseDetails";
    }
}
