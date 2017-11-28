package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.User;
import team.ruike.imm.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
public class UserController {

    @Autowired
    UserService userService;
    @RequestMapping(value="/login.do")
    public  String login(User user, Model model, HttpSession session){
        try {
            if (user.getUserName()!=null ){
                List<User> userList=userService.selectUser(user);
                if (userList.size()>0){
                    for (User user1 : userList) {
                        System.out.println(user1.getUserName());
                    }
                    session.setAttribute("user",userList.get(0).getUserName());
                    System.out.println("1");
                    return "index";
                }else {
                    System.out.println("2");
                    return "login";
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return "login";
    }
}
