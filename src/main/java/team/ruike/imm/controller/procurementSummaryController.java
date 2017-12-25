package team.ruike.imm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by HP on 2017/12/25.
 */
@Controller
@RequestMapping(value = "procurementSummary")
public class procurementSummaryController {
    @RequestMapping(value = "login.do")
    public String login(){
        return "page/purchase/procurementSummary";
    }
}
