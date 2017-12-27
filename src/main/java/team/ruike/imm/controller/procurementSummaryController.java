package team.ruike.imm.controller;

import org.apache.commons.collections.BagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.entity.Procurement;
import team.ruike.imm.entity.ProcurementInformation;
import team.ruike.imm.entity.Supplier;
import team.ruike.imm.service.MerchandiseService;
import team.ruike.imm.service.ProcurementInformationService;
import team.ruike.imm.service.SupplierService;

import java.util.List;

/**
 * Created by HP on 2017/12/25.
 */
@Controller
@RequestMapping(value = "procurementSummary")
public class procurementSummaryController {
    @Autowired
    ProcurementInformationService procurementInformationService;
    @Autowired
    SupplierService supplierService;
    @Autowired
    MerchandiseService merchandiseService;
    @RequestMapping(value = "login.do")
    public String login(Model model, ProcurementInformation procurementInformation, Merchandise merchandise) {
           if(merchandise!=null){
               if(merchandiseService.selectAll(merchandise)!=null){
                Merchandise m= merchandiseService.selectAll(merchandise).get(0);
                procurementInformation.setMerchandiseId(m.getMerchandiseId());
               }
           }
        List<ProcurementInformation> procurementInformationList = procurementInformationService.selectProcurementByProcurementId(procurementInformation);
        List<Supplier> suppliers= supplierService.selectSuplier(null);
        model.addAttribute("procurementInformationList", procurementInformationList);
        model.addAttribute("suppliers",suppliers);
        return "page/purchase/procurementSummary";
    }
}
