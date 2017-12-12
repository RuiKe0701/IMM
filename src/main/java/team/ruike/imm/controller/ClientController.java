package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
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
     * 获取要修改的用户信息
     * @param client
     * @param printWriter
     */
    @RequestMapping(value = "/clientId.do")
    public void clientId(Client client,PrintWriter printWriter){
        List<Client> clients=clientService.selecrClient(client);
        if (clients.size()>0){
            String jsonString = JSON.toJSONString(clients);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }else {
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }

    /**
     * 修改客户是否合作
     * @param stuattendancelists
     * @param printWriter
     */
    @RequestMapping("/k.do")
    public void Doaddatdrecore(String stuattendancelists,PrintWriter printWriter){
        int i=0;
        if (stuattendancelists.length()>0 ){
            ArrayList<Client> clientArrayList =  JSON.parseObject(stuattendancelists, new TypeReference<ArrayList<Client>>(){});

            for (Client client : clientArrayList) {
                i= clientService.updateAdd(client.getKk());
            }
            if(i>0){
                Client c=new Client();
                c.setClientState(1);
                List<Client> clients=clientService.selecrClient(c);
                System.out.println(clients.size());
                //返回值
                String jsonString = JSON.toJSONString(clients);
                printWriter.write(jsonString);
                printWriter.flush();
                printWriter.close();
            }
        }
        String jsonString = JSON.toJSONString(1);
        printWriter.write(jsonString);
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
        if(i>0){
            List<Client> clients=clientService.selecrClient(null);
            //返回值
            String jsonString = JSON.toJSONString(clients);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
        //返回值
        String jsonString = JSON.toJSONString(0);
        printWriter.write(jsonString);
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
        if(i>0){
            //返回值
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }
}
