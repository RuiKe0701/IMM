package team.ruike.imm.controller.ych;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.service.ych.MerchandiseService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 闫琛昊
 */
@Controller
@RequestMapping("merchandise")
public class MerchandiseController {
    @Autowired
    MerchandiseService merchandiseService;

    /**
     * 查询数据
     * @param merchandise
     * @param session
     * @return
     */
    @RequestMapping(value = "/smerchandise.do")
    public String select(Merchandise merchandise, HttpSession session){
        List<Merchandise> merchandises = merchandiseService.selectMerchandise(merchandise);
        session.setAttribute("merc", merchandises);
        return "page/warehouse/goods-balance";
    }
    @RequestMapping(value = "/umerchandise.do")
    public String update(Merchandise merchandise, HttpSession session){
        int i =merchandiseService.updateMerchandise(merchandise);
        if(i>0){
            return "page/warehouse/goods-balance" ;
        }
        return "error";
    }
}
