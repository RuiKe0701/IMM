package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.User;
import team.ruike.imm.service.UserService;

import javax.annotation.Resource;

@Controller
public class test {
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

    @Autowired
    UserService userService;
    @RequestMapping(value = "/updates.do")
    public  String updates(Model model, User user){
        int i=userService.updateUser(user);
        if (i>0){
            return "crr";
        }
        return "update";
    }


    @RequestMapping(value = "/indexs.do")
    public  String indexs(Model model, User user){
        int i=userService.insertUser(user);
        if (i>0){
            return "crr";
        }
        return "update";
    }
}
