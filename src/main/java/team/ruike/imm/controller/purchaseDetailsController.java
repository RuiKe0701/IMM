package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.ProcurementInformation;
import team.ruike.imm.entity.PurchaseOrderInformation;
import team.ruike.imm.service.ProcurementInformationService;
import team.ruike.imm.service.PurchaseOrderInformationService;

import java.util.List;

/**
 * Created by HP on 2017/12/21.
 */
@Controller
@RequestMapping(value = "purchaseDetails")
public class purchaseDetailsController {
    @Autowired
    ProcurementInformationService procurementInformationService;
    //跳转采购明细页面
    @RequestMapping(value = "login.do")
    public String login(Model model,ProcurementInformation procurementInformation){
        List<ProcurementInformation> procurementInformations=procurementInformationService.selectAllProcureMent(procurementInformation);
        System.out.println(procurementInformations.size());
        System.out.println(procurementInformation.getStartTime());
        System.out.println(procurementInformation.getEndTime());
        System.out.println(procurementInformation.getProcurementId());

        model.addAttribute("procurementInformations",procurementInformations);
        return "page/purchase/purchaseDetails";
    }
}
