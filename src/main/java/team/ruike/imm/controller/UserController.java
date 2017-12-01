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
            return "redirect:/user/page.do";
    }

    @RequestMapping(value = "/page.do")
    public  String page(User user,Model model){//分页显示用户信息
//    public  String page(Model model){//分页显示用户信息
       List<User> pages= userService.pagerUser(user);
       int i=((3-1)*2);

        List<User> userList=userService.userList(null);
        Pager<User> pagerss=userService.getPager(i,2,userList);
        ;
     int TotalRecord=pagerss.getTotalRecord();
     int TotalPage=pagerss.getTotalPage();
        System.out.println("TotalRecord:"+TotalRecord+"。TotalPage："+TotalPage);
       if(pages!=null){
           model.addAttribute("pages",pages);
           for (User u : pages) {
               System.out.println(u.getUserName());
           }
       }

        return "adsa";
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
