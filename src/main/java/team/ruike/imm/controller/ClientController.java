package team.ruike.imm.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Client;
import team.ruike.imm.entity.User;
import team.ruike.imm.service.ClientService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
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
//        for (Client client : clients) {
//            System.out.println(client.getClientName());
//        }
        request.setAttribute("clients",clients);
        return "page/material/customer-list-1";
    }
    @RequestMapping(value = "/k.do")
    public void a(Client client){
        for (Object o : client.getKk()) {
            System.out.println(o);
        }
//        client.setClientState(1);\
        int i=clientService.updateAdd(client.getKk());
        System.out.println(i);
    }

    @RequestMapping(value = "/updatesClient.do")
    public  String updates(Model model, Client client){
        int i=clientService.updateClient(client);
        if (i>0){
            return "crr";
        }
        return "update";
    }


    @RequestMapping(value = "/insertClient.do")
    public  String indexs(Model model, Client client){
        int i=clientService.insertClient(client);
        if (i>0){
            return "crr";
        }
        return "update";
    }
}
