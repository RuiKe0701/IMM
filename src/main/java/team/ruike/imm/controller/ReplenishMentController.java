package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.entity.ProcurementInformation;
import team.ruike.imm.entity.ProductType;
import team.ruike.imm.entity.SalesInformation;
import team.ruike.imm.service.MerchandiseService;
import team.ruike.imm.service.ProcurementInformationService;
import team.ruike.imm.service.ProductTypeService;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HP on 2017/12/18.
 */
@Controller
@RequestMapping(value = "replenishMent")
public class ReplenishMentController {
    @Autowired
    ProductTypeService productTypeService;
    @Autowired
    MerchandiseService merchandiseService;
    @Autowired
    ProcurementInformationService procurementInformationService;
    @RequestMapping(value = "login.do")
    //跳转智能补货页面
    public  String loginReplenishMent(Model model,Merchandise merchandise){
        System.out.println(merchandise.getProductTypeId());
        System.out.println(merchandise.getMerchandiseName());
       List<ProductType> productTypeLists= productTypeService.selectProductType(null);
       List<Merchandise> merchandises=merchandiseService.selectRelenish(merchandise);
       List<ProcurementInformation> procurementInformations=procurementInformationService.selectReplenish();
        model.addAttribute("productTypeLists",productTypeLists);
        model.addAttribute("merchandises",merchandises);
        model.addAttribute("procurementInformations",procurementInformations);
        return "page/purchase/replenishMent";
    }
    @RequestMapping(value = "generateOrders.do")
    @ResponseBody
    public void generateOrders(String salesInformationList, HttpSession session, PrintWriter printWriter){
        ArrayList<SalesInformation> salesInformationArrayList =  JSON.parseObject(salesInformationList, new TypeReference<ArrayList<SalesInformation>>(){});
        session.setAttribute("salesInformationArrayList",salesInformationArrayList);
        String jsonString = JSON.toJSONString("2");
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
}
