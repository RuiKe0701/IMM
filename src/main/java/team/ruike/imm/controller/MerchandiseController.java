package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.entity.ProductType;
import team.ruike.imm.entity.Units;
import team.ruike.imm.service.MerchandiseService;
import team.ruike.imm.service.ProductTypeService;
import team.ruike.imm.service.UnitsService;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
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

    @RequestMapping(value = "/smerchandise.do")
    public String select(Merchandise merchandise, HttpSession session){
        List<Merchandise> merchandises = merchandiseService.selectMerchandise(merchandise);
        List<Units> unitses = unitsService.selectUnits(null);
        List<ProductType> productTypes = productTypeService.selectProductType(null);
        session.setAttribute("merc", merchandises);
        session.setAttribute("unis",unitses);
        session.setAttribute("prod",productTypes);
        return "page/warehouse/goods-balance";
    }
    @RequestMapping(value = "/merchandiseId.do")
    public void updatemerchandiseId(Merchandise merchandise,Units units,ProductType productType, PrintWriter printWriter){
        List<Merchandise> merchandises = merchandiseService.selectMerchandise(merchandise);

        if(merchandises.size()>0){
            Merchandise m = merchandises.get(0);
            String json= JSON.toJSONString(m);
            printWriter.write(json);
            printWriter.flush();
            printWriter.close();
        }else{
            String json=JSON.toJSONString(0);
            printWriter.write(json);
            printWriter.flush();
            printWriter.close();
        }
    }
    @RequestMapping(value = "/dmerchandise.do")
    public String delete(Merchandise merchandise,HttpSession session){
        int i =merchandiseService.updateMerchandise(merchandise);
        if(i>0){
            return "page/warehouse/goods-balance" ;
        }
        return null;
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
    //倪嗣承ajax根据id获取信息
    @RequestMapping(value = "ajaxMerchand.do")
    @ResponseBody
    public void ajaxMerchand(@RequestParam(value = "id",required = false) Integer id){
        System.out.println("11111111111111111111111111111111111111111111111");
        System.out.println(id);
        //JSON.toJSON();
    }
}
