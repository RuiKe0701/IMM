package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Supplier;
import team.ruike.imm.service.SupplierService;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@RequestMapping(value = "supplier")
@Controller
public class SupplierController {
    @Autowired
    SupplierService supplierService;
    //展示全部供应商
    @RequestMapping(value="/supplierAll.do")
    public  String  SupplierAll(HttpServletRequest request){
        List<Supplier> suppliers=supplierService.selectSuplier(null);
        request.setAttribute("suppliers",suppliers);
        return "page/material/vendor-list-2";
    }

    /**
     * 修改为不合作客户
     * @param noncooperationSupplierList
     * @param printWriter
     */
    @RequestMapping("/noncooperationSupplier.do")
    public void noncooperationSupplier(String noncooperationSupplierList,PrintWriter printWriter){
        int i=0;
        ArrayList<Supplier>supplierArrayList =  JSON.parseObject(noncooperationSupplierList, new TypeReference<ArrayList<Supplier>>(){});
        for (Supplier s : supplierArrayList) {
            i= supplierService.noncooperation(s.getBulkChanges());
        }
        if(i>0){
            Supplier ss=new Supplier();
            ss.setSupplierState(1);
            List<Supplier> supplier=supplier(ss);
            //返回值
            String jsonString = JSON.toJSONString(supplier);
            printWriter.write(jsonString);
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
        }
        printWriter.flush();
        printWriter.close();
    }
    /**
     * 修改为合作客户
     * @param cooperativeSupplier
     * @param printWriter
     */
    @RequestMapping("/cooperativeSupplier.do")
    public void cooperativeSupplier(String cooperativeSupplier,PrintWriter printWriter){
        int i=0;
            ArrayList<Supplier> supplierArrayList =  JSON.parseObject(cooperativeSupplier, new TypeReference<ArrayList<Supplier>>(){});
            for (Supplier s : supplierArrayList) {
                i= supplierService.cooperative(s.getBulkChanges());
            }
            if(i>0){
                Supplier ss=new Supplier();
                ss.setSupplierState(0);
                List<Supplier> supplier=supplier(ss);
                //返回值
                String jsonString = JSON.toJSONString(supplier);
                printWriter.write(jsonString);
            }
        printWriter.flush();
        printWriter.close();
    }

    /**
     * 工具方法
     * @param supplier
     * @return
     */
    public List<Supplier> supplier(Supplier supplier){
        List<Supplier> suppliers=supplierService.selectSuplier(supplier);
        List<Supplier> sa=new ArrayList<Supplier>();
        for (Supplier supp : suppliers) {
            if (supp.getSupplierState()==1){
                supp.setState("已终止");
            }else if(supp.getSupplierState()==0){
                supp.setState("合作中");
            }
            sa.add(supp);
        }
        return sa;
    }
    /**
     * 查询终止合作的用户
     * @param supplier
     * @param printWriter
     */
    @RequestMapping(value = "/supplierCooperation.do")
    public void supplierCooperation(Supplier supplier,PrintWriter printWriter){
        List<Supplier> supp=supplier(supplier);
        if (supp.size()>0){
            String jsonString = JSON.toJSONString(supp);
            printWriter.write(jsonString);
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
        }
        printWriter.flush();
        printWriter.close();
    }

    /**
     * 获取要修改的用户信息
     * @param supplier
     * @param printWriter
     */
    @RequestMapping(value = "/supplierId.do")
    public void supplierId(Supplier supplier,PrintWriter printWriter){
        List<Supplier> suppliers=supplier(supplier);
        if (suppliers.size()>0){
            String jsonString = JSON.toJSONString(suppliers);
            printWriter.write(jsonString);
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
        }
        printWriter.flush();
        printWriter.close();
    }

    /**
     * 修改用户信息
     * @param supplierList
     * @param printWriter
     */
    @RequestMapping(value = "/updateSupplier.do")
    public  void updateSupplier(String supplierList,PrintWriter printWriter){
        int i=0;
        ArrayList<Supplier> supplierArrayList =  JSON.parseObject(supplierList, new TypeReference<ArrayList<Supplier>>(){});
        for (Supplier supplier : supplierArrayList) {
            i = supplierService.updateSupplier(supplier);
        }
        if(i>0) {
            List<Supplier> supplier=null;
            Supplier s=new Supplier();
            s.setSupplierState(0);
            supplier = supplier(s);
            if (supplier.size() > 0) {
                String jsonString = JSON.toJSONString(supplier);
                printWriter.write(jsonString);
            } else {
                String jsonString = JSON.toJSONString(0);
                printWriter.write(jsonString);
            }
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
        }
        printWriter.flush();
        printWriter.close();
    }


    /**
     * 添加供应商信息
     * @return
     */
    @RequestMapping("/addsupplier.do")
    public void addsupplier(String supplierList,PrintWriter printWriter){
        int i=0;
        ArrayList<Supplier> supplierArrayList =  JSON.parseObject(supplierList, new TypeReference<ArrayList<Supplier>>(){});
        i = supplierService.insertSuplier(supplierArrayList.get(0));
        if(i>0) {
            Supplier s = new Supplier();
            s.setSupplierState(0);
            List<Supplier> suppliers =supplier(s);
            if (suppliers.size() > 0) {
                String jsonString = JSON.toJSONString(suppliers);
                printWriter.write(jsonString);
            } else {
                String jsonString = JSON.toJSONString(0);
                printWriter.write(jsonString);
            }
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
        }
        printWriter.flush();
        printWriter.close();
    }
}
