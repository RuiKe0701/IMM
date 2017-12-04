package team.ruike.imm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.User;
import team.ruike.imm.instrument.Pager;
import team.ruike.imm.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping(value = "/user")
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
            return "redirect:/user/page.do?currentPage=0";
    }

    @RequestMapping(value = "/page.do")
    public  String page(Integer currentPage,Model model){//分页显示用户信息

       //分页显示用户信息
       List<User> pages= userService.pagerUser(currentPage);
        Pager<User> pagerss=null;
        if (pages.size()!=0){
            model.addAttribute("pages",pages);
            if(currentPage==0){
                pagerss=userService.getPager(1);
            }else {
                pagerss=userService.getPager(currentPage);
            }
            model.addAttribute("pagesList",pagerss);
            return "adsa";
        }
        return "aaaa";
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
