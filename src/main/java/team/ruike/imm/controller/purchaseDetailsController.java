package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Procurement;
import team.ruike.imm.entity.ProcurementInformation;
import team.ruike.imm.entity.PurchaseOrderInformation;
import team.ruike.imm.service.ProcurementInformationService;
import team.ruike.imm.service.ProcurementService;
import team.ruike.imm.service.PurchaseOrderInformationService;
import team.ruike.imm.utility.Page;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HP on 2017/12/21.
 */
@Controller
@RequestMapping(value = "purchaseDetails")
public class purchaseDetailsController {
    @Autowired
    ProcurementInformationService procurementInformationService;
    @Autowired
    ProcurementService procurementService;
    //跳转采购明细页面
    @RequestMapping(value = "login.do")
    public String login(Model model,ProcurementInformation procurementInformation, Page page){
        int startPage=page.getStart();
        if(startPage==0){
            startPage=page.getStart();
        }else {
            startPage=(page.getStart()-1)*7;
        }
        PageHelper.offsetPage(startPage,7);
        List<ProcurementInformation> procurementInformations=procurementInformationService.selectAllProcureMent(procurementInformation);
        int total = (int) new PageInfo<ProcurementInformation>(procurementInformations).getTotal();
        int len=0;
        if(total%7!=0){
            len=(total/5)+1;
        }else {
            len=total/5;
        }
        page.caculateLast(total);
        model.addAttribute("procurementInformations",procurementInformations);
        model.addAttribute("len",len);
        model.addAttribute("totalPage",total);
        return "page/purchase/purchaseDetails";
    }
    //批量修改
    @RequestMapping(value = "generateProcurement.do")
    public void  generateProcurement(String procureList,String prochreInfoList,PrintWriter printWriter){
        ArrayList<Procurement> procurements =  JSON.parseObject(procureList, new TypeReference<ArrayList<Procurement>>(){});
        ArrayList<ProcurementInformation> procurementInfos =  JSON.parseObject(prochreInfoList, new TypeReference<ArrayList<ProcurementInformation>>(){});
        int i=procurementService.generateUpdateProcurement(procurements);
        i+=procurementInformationService.generateUpdateProcurementInfo(procurementInfos);
        String jsonString = JSON.toJSONString(i);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
}
