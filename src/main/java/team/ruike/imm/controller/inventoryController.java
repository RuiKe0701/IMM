package team.ruike.imm.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.entity.ProductType;
import team.ruike.imm.entity.SalesStatus;
import team.ruike.imm.entity.Units;
import team.ruike.imm.service.MerchandiseService;
import team.ruike.imm.service.ProductTypeService;
import team.ruike.imm.service.SalesStatusService;
import team.ruike.imm.service.UnitsService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

//盘点
@Controller
@RequestMapping("inventory")
public class inventoryController {
    @Autowired
    MerchandiseService merchandiseService;
    @Autowired
    UnitsService unitsService;
    @Autowired
    ProductTypeService productTypeService;
    @Autowired
    SalesStatusService salesStatusService;

    //查询仓库全部商品信息
    @RequestMapping(value = "/inventorys.do")
    public String select(HttpServletRequest request) {
        List<Merchandise> merchandiseList = merchandiseService.selectMerchandise(null);
        List<Units> unitsList = unitsService.selectUnits(null);
        List<ProductType> productTypesList = productTypeService.selectProductType(null);
        List<SalesStatus> salesStatusList = salesStatusService.selectSalesStatus(null);
        request.setAttribute("m",merchandiseList);
        request.setAttribute("u",unitsList);
        request.setAttribute("p",productTypesList);
        request.setAttribute("s",salesStatusList);
        return "page/warehouse/invTf-1";
    }
}
