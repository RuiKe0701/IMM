package team.ruike.imm.controller;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.User;
import team.ruike.imm.instrument.Pager;
import team.ruike.imm.service.UserService;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
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
            if (u.getUserName()!="无"){
            session.setAttribute("userName",u.getEmployee().getEmployeeName());
            return "index";
            }
            session.setAttribute("hint","请输入正确的用户名和密码");
//            return "adsa";
        return "redirect:/client/clientAll.do";
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

    /**
     * 批量添加
     * @return
     */
    @RequestMapping("/doinsetadt.do")
    public void Doaddatdrecore(String stuattendancelists,PrintWriter printWriter){
        System.out.println(stuattendancelists);
        ArrayList<User> userArrayList =  JSON.parseObject(stuattendancelists, new TypeReference<ArrayList<User>>(){});
        for (User user : userArrayList) {
            System.out.println(user.getUserName());
            System.out.println(user.getUserPassword());
        }
      int i= userService.insertAdd(userArrayList);
        if(i>0){
            //返回值
            String jsonString = JSON.toJSONString(0);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }
    }



}
