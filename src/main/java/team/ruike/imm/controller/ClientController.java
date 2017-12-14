package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import jdk.nashorn.internal.ir.annotations.Ignore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Client;
import team.ruike.imm.entity.User;
import team.ruike.imm.service.ClientService;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
@RequestMapping(value = "/client")
@Controller
public class ClientController {


    @Autowired
    ClientService clientService;
    //展示全部数据
    @RequestMapping(value="/clientAll.do")
    public  String clientAll(HttpServletRequest request){
      List<Client> clients=clientService.selecrClient(null);
        request.setAttribute("clients",clients);
        return "page/material/customer-list-1";
    }

    /**
     * 修改为不合作客户
     * @param noncooperationClient
     * @param printWriter
     */
    @RequestMapping("/noncooperationClient.do")
    public void noncooperationClient(String noncooperationClient,PrintWriter printWriter){
        int i=0;
            ArrayList<Client> clientArrayList =  JSON.parseObject(noncooperationClient, new TypeReference<ArrayList<Client>>(){});
            for (Client client : clientArrayList) {
                i= clientService.noncooperation(client.getKk());
            }
            if(i>0){
                Client c=new Client();
                c.setClientState(1);
                List<Client> clients=clientService.selecrClient(c);
                //返回值
                String jsonString = JSON.toJSONString(clients);
                printWriter.write(jsonString);
        }
        printWriter.flush();
        printWriter.close();
    }
    /**
     * 修改为合作客户
     * @param cooperativeClients
     * @param printWriter
     */
    @RequestMapping("/cooperativeClient.do")
    public void cooperativeClient(String cooperativeClients,PrintWriter printWriter){
        int i=0;
        if (cooperativeClients.length()>0 ){
            ArrayList<Client> clientArrayList =  JSON.parseObject(cooperativeClients, new TypeReference<ArrayList<Client>>(){});
            for (Client client : clientArrayList) {
                i= clientService.cooperative(client.getKk());
            }
            if(i>0){
                Client c=new Client();
                c.setClientState(0);
                List<Client> clients=clientService.selecrClient(c);
                //返回值
                String jsonString = JSON.toJSONString(clients);
                printWriter.write(jsonString);
            }
        }
        printWriter.flush();
        printWriter.close();
    }



    public List<Client> client(Client client){
        List<Client> clients=clientService.selecrClient(client);
        List<Client> sa=new ArrayList<Client>();
        for (Client client1 : clients) {
            if (client1.getClientState()==1){
                client1.setState("已终止");
            }else if(client1.getClientState()==0){
                client1.setState("合作中");
            }
            sa.add(client1);
        }
        return sa;
    }
    /**
     * 查询终止合作的用户
     * @param client
     * @param printWriter
     */
    @RequestMapping(value = "/clientCooperation.do")
    public void clientCooperation(Client client,PrintWriter printWriter){
        List<Client> clients=client(client);
        if (clients.size()>0){
            String jsonString = JSON.toJSONString(clients);
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
     * @param client
     * @param printWriter
     */
    @RequestMapping(value = "/clientId.do")
    public void clientId(Client client,PrintWriter printWriter){
        List<Client> clients=client(client);
        if (clients.size()>0){
            String jsonString = JSON.toJSONString(clients);
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
     * @param clientList
     * @param printWriter
     */
    @RequestMapping(value = "/updatesClient.do")
    public  void updatesClient(String clientList,PrintWriter printWriter){
        int i=0;
        ArrayList<Client> clientArrayList =  JSON.parseObject(clientList, new TypeReference<ArrayList<Client>>(){});
        for (Client client : clientArrayList) {
            i = clientService.updateClient(client);
        }
        if(i>0) {
            List<Client> clients=null;
            Client c=new Client();
            c.setClientState(0);
            clients = client(c);
            if (clients.size() > 0) {
                String jsonString = JSON.toJSONString(clients);
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
     * 添加用户信息
     * @return
     */
    @RequestMapping("/addClient.do")
    public void addClient(String clientList,PrintWriter printWriter){
        int i=0;
        System.out.println(clientList.length());
        ArrayList<Client> clientArrayList =  JSON.parseObject(clientList, new TypeReference<ArrayList<Client>>(){});
        for (Client client : clientArrayList) {
            i = clientService.insertClient(client);
        }
        if(i>0) {
            Client client = new Client();
            client.setClientState(0);
            List<Client> clients = client(client);
            if (clients.size() > 0) {
                String jsonString = JSON.toJSONString(clients);
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
