package team.ruike.imm.controller;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Units;
import team.ruike.imm.service.ProductTypeService;
import team.ruike.imm.service.UnitsService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/unitsandtype")
public class UnitsAndType {


    @Autowired
    UnitsService unitsService;

    @Autowired
    ProductTypeService productTypeService;

    @RequestMapping(value="/units.do")
    public  String units(Units units,HttpServletRequest request){
        List<Units> unitsList = unitsService.selectUnits(units);
        request.setAttribute("units",unitsList);
        return "page/material/unitsAndType";
    }
}
