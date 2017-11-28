package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Client;
import team.ruike.imm.entity.User;
import team.ruike.imm.service.ClientService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ClientController {
    @Autowired
    ClientService clientService;

    @RequestMapping(value="/selectClient.do")
    public  String login(Client client, Model model, HttpSession session){
        System.out.println(client.getClientName()+"/+");
        try {
            if (client.getClientName()!=null){
                List<Client> clientList=clientService.selecrClient(client);
                if (clientList.size()>0){
                    for (Client client1 : clientList) {
                        System.out.println(client1.getClientName());
                    }
                    session.setAttribute("client",clientList);
                    System.out.println("1");
                    return "crr";
                }else {
                    System.out.println("2");
                    return "indexa";
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("3");
        return "indexa";

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



    @RequestMapping(value = "/select.do")
    public String select(){
        return "indexa";
    }

    @RequestMapping(value = "/update.do")
    public String update(){
        return "update";
    }

    @RequestMapping(value = "/insert.do")
    public String insert(){
        return "insert";
    }
}
