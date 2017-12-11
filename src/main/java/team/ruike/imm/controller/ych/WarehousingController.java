package team.ruike.imm.controller.ych;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Warehousing;
import team.ruike.imm.service.ych.WarehousingService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * 闫琛昊
 */
@Controller
@RequestMapping("warehousing")
public class WarehousingController {
    @Autowired
    WarehousingService warehousingService;


    @RequestMapping(value = "/swarehousing.do")
    public String select(HttpSession session){
                    List<Warehousing> warehousingList=warehousingService.selectWarehousing(null);
                    if(warehousingList!=null) {
                        for (Warehousing w1 : warehousingList) {
                            System.out.println(w1.getUser().getUserName());
                        }
                        session.setAttribute("ware", warehousingList);
                        return "page/warehouse/goods-balance";
                    }
        return "indexa";
    }

    @RequestMapping(value = "/updatess.do")
    public String updates(Model model ,Warehousing warehousing){
        int i =warehousingService.updateWarehousing(warehousing);
        if(i>0){
            return "crr";
        }
        return "update";
    }
    @RequestMapping(value = "/aa.do")
    public String inserts(Model model,Warehousing warehousing){
        System.out.println(warehousing.getWarehousingState());
        Date date=new Date();
//        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
//        df.format(new Date());// new Date()为获取当前系统时间
        warehousing.setWarehousingDate(new Date());
//        System.out.println(warehousing.getWarehousingDate()+"/CONTROLLER");
        int i = warehousingService.insertWarehousing(warehousing);
        if(i>0){
            return "crr";
        }
        return "insert";
    }
}
