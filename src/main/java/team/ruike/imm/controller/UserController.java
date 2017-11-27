package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

    @RequestMapping("/sd.do")
    public String dd(){
        return "index";
    }

    @RequestMapping(value="/login.do")
    public  String login(User user, Model model, HttpSession session){
        System.out.println(user.getUserName());
        try {
            if (user!=null){
                List<User> userList=userService.selectUser(user);
                if (userList!=null){
                    session.setAttribute("user",userList);
                    System.out.println("1");
                    return "crr";
                }else {
                    System.out.println("2");
                    return "index";
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("3");
        return "index";

    }
}
