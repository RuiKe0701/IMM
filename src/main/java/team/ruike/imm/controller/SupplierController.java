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

@Controller
@RequestMapping(value = "supplier")
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

//    /**
//     * 修改为不合作客户
//     * @param noncooperationClient
//     * @param printWriter
//     */
//    @RequestMapping("/noncooperationClient.do")
//    public void noncooperationClient(String noncooperationClient,PrintWriter printWriter){
//        int i=0;
//        ArrayList<Client> clientArrayList =  JSON.parseObject(noncooperationClient, new TypeReference<ArrayList<Client>>(){});
//        for (Client client : clientArrayList) {
//            i= clientService.noncooperation(client.getKk());
//        }
//        if(i>0){
//            Client c=new Client();
//            c.setClientState(1);
//            List<Client> clients=clientService.selecrClient(c);
//            //返回值
//            String jsonString = JSON.toJSONString(clients);
//            printWriter.write(jsonString);
//        }
//        printWriter.flush();
//        printWriter.close();
//    }
//    /**
//     * 修改为合作客户
//     * @param cooperativeClients
//     * @param printWriter
//     */
//    @RequestMapping("/cooperativeClient.do")
//    public void cooperativeClient(String cooperativeClients,PrintWriter printWriter){
//        int i=0;
//        if (cooperativeClients.length()>0 ){
//            ArrayList<Client> clientArrayList =  JSON.parseObject(cooperativeClients, new TypeReference<ArrayList<Client>>(){});
//            for (Client client : clientArrayList) {
//                i= clientService.cooperative(client.getKk());
//            }
//            if(i>0){
//                Client c=new Client();
//                c.setClientState(0);
//                List<Client> clients=clientService.selecrClient(c);
//                //返回值
//                String jsonString = JSON.toJSONString(clients);
//                printWriter.write(jsonString);
//            }
//        }
//        printWriter.flush();
//        printWriter.close();
//    }
//
//
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
//    /**
//     * 查询终止合作的用户
//     * @param client
//     * @param printWriter
//     */
//    @RequestMapping(value = "/clientCooperation.do")
//    public void clientCooperation(Client client,PrintWriter printWriter){
//        List<Client> clients=client(client);
//        if (clients.size()>0){
//            String jsonString = JSON.toJSONString(clients);
//            printWriter.write(jsonString);
//        }else {
//            String jsonString = JSON.toJSONString(0);
//            printWriter.write(jsonString);
//        }
//        printWriter.flush();
//        printWriter.close();
//    }
//
//    /**
//     * 获取要修改的用户信息
//     * @param client
//     * @param printWriter
//     */
//    @RequestMapping(value = "/clientId.do")
//    public void clientId(Client client,PrintWriter printWriter){
//        List<Client> clients=client(client);
//        if (clients.size()>0){
//            String jsonString = JSON.toJSONString(clients);
//            printWriter.write(jsonString);
//        }else {
//            String jsonString = JSON.toJSONString(0);
//            printWriter.write(jsonString);
//        }
//        printWriter.flush();
//        printWriter.close();
//    }
//
//    /**
//     * 修改用户信息
//     * @param clientList
//     * @param printWriter
//     */
//    @RequestMapping(value = "/updatesClient.do")
//    public  void updatesClient(String clientList,PrintWriter printWriter){
//        int i=0;
//        ArrayList<Client> clientArrayList =  JSON.parseObject(clientList, new TypeReference<ArrayList<Client>>(){});
//        for (Client client : clientArrayList) {
//            i = clientService.updateClient(client);
//        }
//        if(i>0) {
//            List<Client> clients=null;
//            Client c=new Client();
//            c.setClientState(0);
//            clients = client(c);
//            if (clients.size() > 0) {
//                String jsonString = JSON.toJSONString(clients);
//                printWriter.write(jsonString);
//            } else {
//                String jsonString = JSON.toJSONString(0);
//                printWriter.write(jsonString);
//            }
//        }else {
//            String jsonString = JSON.toJSONString(0);
//            printWriter.write(jsonString);
//        }
//        printWriter.flush();
//        printWriter.close();
//    }
//
//
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
