package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.entity.ProductType;
import team.ruike.imm.entity.SalesStatus;
import team.ruike.imm.entity.Units;
import team.ruike.imm.service.MerchandiseService;
import team.ruike.imm.service.ProductTypeService;
import team.ruike.imm.service.SalesStatusService;
import team.ruike.imm.service.UnitsService;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
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
    @Autowired
    SalesStatusService salesStatusService;

    /**
     * 查询商品信息
     */
    @RequestMapping(value = "/smerchandise.do")
    public String select(Merchandise merchandise, HttpSession session){
        List<Merchandise> merchandises = merchandiseService.selectMerchandise(merchandise);
        List<Units> unitses = unitsService.selectUnits(null);
        List<ProductType> productTypes = productTypeService.selectProductType(null);
        List<SalesStatus> salesStatuses=salesStatusService.selectSalesStatus(null);
        session.setAttribute("merc", merchandises);
        session.setAttribute("unis",unitses);
        session.setAttribute("prod",productTypes);
        session.setAttribute("sale",salesStatuses);
        return "page/warehouse/goods-balance";
    }
    //按商品名关键字查询
    @RequestMapping(value = "ajaxMerchand.do",produces="text/html;charset=UTF-8")
            @ResponseBody
            public Object ajaxMerchand(Merchandise merchandise){
            Merchandise merchandises=merchandiseService.selectOne(merchandise);
            return JSON.toJSONString(merchandises);
            }
    //按商品类型查询
    @RequestMapping(value = "/selectType.do")
    public void selectType(Merchandise merchandise,PrintWriter printWriter){
        List<Merchandise> merchandises = merchandiseService.selectMerchandise(merchandise);
        System.out.println(merchandise.getMerchandiseName());
        if(merchandises.size()>0){
            String json = JSON.toJSONString(merchandises);
            printWriter.write(json);
            printWriter.flush();
            printWriter.close();
        }
    }
    //按单位查询
    //@RequestMapping(value = "/merchandiseUnits.do")
    //按销售状态查询
    //@RequestMapping(value = "/merchandiseState.do")
    /**
     * 查询被选中即将修改的商品的信息
     */
    @RequestMapping(value = "/merchandiseId.do")
    public void updatemerchandiseId(Merchandise merchandise,PrintWriter printWriter){
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

    /**
     * 修改被选中的商品的信息
     */
    @RequestMapping(value = "/updateMerchandise.do")
    public void  updateMerchandise(String merchandises,PrintWriter printWriter){
        int i =0;
        ArrayList<Merchandise>merchandiseList=JSON.parseObject(merchandises,new TypeReference<ArrayList<Merchandise>>(){});
        for(Merchandise m :merchandiseList){
            i=merchandiseService.updateMerchandise(m);
        }
        if(i>0){
            List<Merchandise> merchandise =merchandiseService.selectMerchandise(null);
            //返回值
            String jsonString = JSON.toJSONString(merchandise);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
        //返回值
        String jsonString=JSON.toJSONString(0);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
    /* 删除商品信息
     */
    @RequestMapping(value = "/deleteMerchandise.do")
    public void  deleteMerchandise(Merchandise merchandises,PrintWriter printWriter){
        int i =0;
        merchandises.setMerchandiseState(1);
            i=merchandiseService.updateMerchandise(merchandises);
        if(i>0){
            Merchandise s=new Merchandise();
            s.setMerchandiseState(1);
            List<Merchandise> mm =merchandiseService.selectMerchandise(s);
            //返回值
            String jsonString = JSON.toJSONString(mm);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }

        String jsonString = JSON.toJSONString(0);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
//    @RequestMapping(value = "/dmerchandise.do")
//    public String delete(Merchandise merchandise){
//        int i =merchandiseService.updateMerchandise(merchandise);
//        if(i>0){
//            return "page/warehouse/goods-balance" ;
//        }
//        return null;
//    }
//    @RequestMapping(value = "iMerchandise.do")
//    public String insertMerchandise(Merchandise merchandise){
//        System.out.println(merchandise.getSalesStatus());
//        int i =merchandiseService.insertMerchandise(merchandise);
//        if(i>0){
//            return null;
//        }
//        return null;
//    }
//    @RequestMapping(value = "insertMerchandises.do")
//    public String insertMerchandise(HttpSession session){
//        List<Units> u = unitsService.selectUnits(null);
//        List<ProductType> t = productTypeService.selectProductType(null);
//        if(u!=null && t!=null) {
//            session.setAttribute("u",u);
//            session.setAttribute("type",t);
//            return null;
//        }
//        return null;
//    }
//    @RequestMapping(value = "suMerchandise.do")
//    public String suMerchandise(Merchandise merchandise,HttpSession session){
//        List<Merchandise> merchandises=merchandiseService.selectMerchandise(merchandise);
//        if(merchandises!=null){
//            session.setAttribute("m",merchandises);
//            return null;
//        }
//        return null;
//    }
//    @RequestMapping(value = "aa.do")
//    public String updateMerchandise(Merchandise merchandise){
//        int m=merchandiseService.updateMerchandise(merchandise);
//        if(m>0){
//            return null;
//        }
//        return null;
//    }
//    @RequestMapping(value = "updateMerchandises.do")
//    public String updateMerchandises(Merchandise mer,HttpSession session){
//        session.setAttribute("m",mer);
//        List<Units> u = unitsService.selectUnits(null);
//        List<ProductType> t = productTypeService.selectProductType(null);
//        if(u!=null && t!=null) {
//            session.setAttribute("u", u);
//            session.setAttribute("type", t);
//            return null;
//        }
//        return null;
//    }
}
