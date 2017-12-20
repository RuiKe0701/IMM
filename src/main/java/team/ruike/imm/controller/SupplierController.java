package team.ruike.imm.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Supplier;
import team.ruike.imm.service.SupplierService;
import team.ruike.imm.utility.Pages;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@RequestMapping(value = "supplier")
@Controller
public class SupplierController {
    @Autowired
    SupplierService supplierService;
    //展示合作客户数据
    @RequestMapping(value="/cooperative.do")
    public  String cooperative(HttpServletRequest request,Integer currentPage,Supplier supplier){
        supplier.setSupplierState(0);
        if (currentPage==null ){
            supplier.setCurrentPage(1);
            currentPage=1;
        }else {
            supplier.setCurrentPage(currentPage);
        }
        List<Supplier> supplies=supplierService.pagerSuplier(supplier);
        request.setAttribute("supplies",supplies);
        Pages<Supplier> pages=supplierService.getPager(supplier,currentPage);
        request.setAttribute("pages",pages);
        int i=0;
        request.setAttribute("i",i);
        return "page/material/vendor-list-2";
    }

    /**
     * 展示不合作的客户
     * @param request
     * @param currentPage
     * @param supplier
     * @return
     */
    @RequestMapping(value="/noncooperation.do")
    public  String noncooperation(HttpServletRequest request,Integer currentPage,Supplier supplier){
        supplier.setSupplierState(1);
        if (currentPage==null ){
            supplier.setCurrentPage(1);
            currentPage=1;
        }else {
            supplier.setCurrentPage(currentPage);
        }
        List<Supplier> supplies=supplierService.pagerSuplier(supplier);
        request.setAttribute("ss",supplies);
        Pages<Supplier> pages=supplierService.getPager(supplier,currentPage);
        request.setAttribute("pp",pages);
        int i=1;
        request.setAttribute("i",i);
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
//        i= clientService.noncooperation(clientArrayList);
//        if(i>0){
//            String jsonString = JSON.toJSONString(1);
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
//        ArrayList<Client> clientArrayList =  JSON.parseObject(cooperativeClients, new TypeReference<ArrayList<Client>>(){});
//        i= clientService.cooperative(clientArrayList);
//        if(i>0){
//            //返回值
//            String jsonString = JSON.toJSONString(1);
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
//        List<Client> clients=clientService.selecrClient(client);
//        if (clients.size()>0){
//            String jsonString = JSON.toJSONString(clients);
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
//            String jsonString = JSON.toJSONString(1);
//            printWriter.write(jsonString);
//        }
//        printWriter.flush();
//        printWriter.close();
//    }
//
//
//    /**
//     * 添加用户信息
//     * @return
//     */
//    @RequestMapping("/addClient.do")
//    public void addClient(String clientList,PrintWriter printWriter){
//        int i=0;
//        ArrayList<Client> clientArrayList =  JSON.parseObject(clientList, new TypeReference<ArrayList<Client>>(){});
//        for (Client client : clientArrayList) {
//            i = clientService.insertClient(client);
//        }
//        if(i>0) {
//            String jsonString = JSON.toJSONString(1);
//            printWriter.write(jsonString);
//        }
//        printWriter.flush();
//        printWriter.close();
//    }
}
