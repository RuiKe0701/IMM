package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.ProcurementInformation;
import team.ruike.imm.service.ProcurementInformationService;

import java.util.List;

/**
 * Created by HP on 2017/12/26.
 */
@Controller
@RequestMapping(value = "purchasePayment")
public class purchasePaymentController {
    @Autowired
    ProcurementInformationService procurementInformationService;
    //跳转采购付款一览表
    @RequestMapping(value = "login.do")
    public String purchasePaymentLogin(ProcurementInformation procurementInformation, Model model){
       List<ProcurementInformation> procurementInformations= procurementInformationService.selectAllProcureMent(procurementInformation);
       model.addAttribute("procurementInformations",procurementInformations);
        return "page/purchase/purchasePayment";
    }
}
