package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Client;
import team.ruike.imm.entity.User;
import team.ruike.imm.service.ClientService;

import javax.servlet.http.HttpSession;
import java.util.List;
@RequestMapping(value = "/client")
@Controller
public class ClientController {
    @Autowired
    ClientService clientService;
    //展示全部数据
    @RequestMapping(value="/clientAll.do")
    public  String clientAll(){

        return "page/material/customer-list-1";
    }
    @RequestMapping(value = "/page.do")
    public  String page(Client client){//分页显示用户信息
        List<Client> pages= clientService.pagerClient(client);
        for (Client c : pages) {
            System.out.println(c.getClientName());
        }
        return null;
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
