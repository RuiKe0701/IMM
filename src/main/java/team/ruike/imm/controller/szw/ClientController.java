package team.ruike.imm.controller.szw;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Client;
import team.ruike.imm.entity.User;
import team.ruike.imm.service.szw.ClientService;

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
    @RequestMapping(value = "/clientId.do")
    public void clientId(Client client,PrintWriter printWriter){
        List<Client> clients=clientService.selecrClient(client);
        for (Client client1 : clients) {
            System.out.println(client1.getClientId());
        }
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
     * 修改是否删除客户
     * @param stuattendancelists
     * @param printWriter
     */
    @RequestMapping("/k.do")
    public void Doaddatdrecore(String stuattendancelists,PrintWriter printWriter){
        int i=0;
        if (stuattendancelists.length()>0 ){
            ArrayList<Client> clientArrayList =  JSON.parseObject(stuattendancelists, new TypeReference<ArrayList<Client>>(){});

            for (Client client : clientArrayList) {
                System.out.println(client.getKk().size());
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
    @RequestMapping(value = "/bug.do")
    public String bug(){

        return "asdas";
    }

    @RequestMapping(value = "/updatesClient.do")
    public  String updates(Model model, Client client){
        int i=clientService.updateClient(client);
        if (i>0){
            return "crr";
        }
        return "update";
    }
    /**
     * 添加
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
