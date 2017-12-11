package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.entity.ProductType;
import team.ruike.imm.entity.Units;
import team.ruike.imm.service.gx.MerchandiseService;
import team.ruike.imm.service.ProductTypeService;
import team.ruike.imm.service.UnitsService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("merchandise")
public class MerchandiseController {
    @Autowired
    MerchandiseService merchandiseService;
    @Autowired
    UnitsService unitsService;
    @Autowired
    ProductTypeService productTypeService;

    @RequestMapping(value = "selectMerchandise.do")
    public String selectMerchandises(Merchandise merchandise, HttpSession session){
        List<Merchandise> merchandises = merchandiseService.selectMerchandise(merchandise);
        if(merchandise!=null){
            session.setAttribute("m",merchandises);
            return "sMerchandise";
        }
        return "login";
    }
    @RequestMapping(value = "iMerchandise.do")
    public String insertMerchandise(Merchandise merchandise,HttpSession session){
        System.out.println(merchandise.getSalesStatus());
        int i =merchandiseService.insertMerchandise(merchandise);
        if(i>0){
            return "success";
        }
        return "fail";
    }
    @RequestMapping(value = "insertMerchandises.do")
    public String insertMerchandise(HttpSession session){
        List<Units> u = unitsService.selectUnits(null);
        List<ProductType> t = productTypeService.selectProductType(null);
        if(u!=null && t!=null) {
            session.setAttribute("u",u);
            session.setAttribute("type",t);
            return "iMerchandise";
        }
        return "nothing";
    }
    @RequestMapping(value = "suMerchandise.do")
    public String suMerchandise(Merchandise merchandise,HttpSession session){
        List<Merchandise> merchandises=merchandiseService.selectMerchandise(merchandise);
        if(merchandises!=null){
            session.setAttribute("m",merchandises);
            return "uMerchandise";
        }
        return null;
    }
    @RequestMapping(value = "aa.do")
    public String updateMerchandise(Merchandise merchandise, Model model){
        int m=merchandiseService.updateMerchandise(merchandise);
        if(m>0){
            return "success";
        }
        return "fail";
    }
    @RequestMapping(value = "updateMerchandises.do")
    public String updateMerchandises(Merchandise mer,HttpSession session){
        session.setAttribute("m",mer);
        List<Units> u = unitsService.selectUnits(null);
        List<ProductType> t = productTypeService.selectProductType(null);
        if(u!=null && t!=null) {
            session.setAttribute("u", u);
            session.setAttribute("type", t);
            return "um";
        }
        return null;
    }
}
