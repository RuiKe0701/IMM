package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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

    /**
     * 登录验证
     * @param user
     * @param session
     * @return
     */
    @RequestMapping(value="/login.do")
    public  String login(User user,HttpSession session){
            User u=userService.selectUser(user);
            if (u.getUserName()!=null){
            session.setAttribute("userName",u.getEmployee().getEmployeeName());
            return "index";
            }
            session.setAttribute("hint","请输入正确的用户名和密码");
            return "login";
    }

    @RequestMapping(value = "/page.do")
    public  String page(User user){//分页显示用户信息
       List<User> pages= userService.PagerUser(user);
        for (User u : pages) {
            System.out.println(u.getUserName());
        }
        return null;
    }



    /**
     * 退出到登录页面
     * @return
     */
    @RequestMapping(value = "/retreat.do")
    public String retreat(){
        return "login";
    }
}
