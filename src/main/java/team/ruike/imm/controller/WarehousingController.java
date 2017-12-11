package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Warehousing;
import team.ruike.imm.service.WarehousingService;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class WarehousingController {

    @Autowired
    WarehousingService warehousingService;


    @RequestMapping(value = "/warehousing.do")
    public String select(Warehousing warehousing, Model model,HttpSession session){
        try{
            if(warehousing.getWarehousingId()!=null){
                    List<Warehousing> warehousingList=warehousingService.selectWarehousing(warehousing);
                    if(warehousingList!=null){
                        for (Warehousing w1 :warehousingList){
                            System.out.println(w1.getUser().getUserName());
                        }
                        session.setAttribute("ware",warehousingList);
                        return "crr";
                    }else{
                        return "indexa";
                }
            }
        }catch (Exception e){
            e.printStackTrace();
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
