package team.ruike.imm.controller;


import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import team.ruike.imm.entity.Employee;
import team.ruike.imm.entity.User;
import team.ruike.imm.entity.Warehousing;
import team.ruike.imm.service.EmployeeService;
import team.ruike.imm.service.UserService;
import team.ruike.imm.service.WarehousingService;

import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("warehousing")
public class WarehousingController {

    @Autowired
    WarehousingService warehousingService;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    UserService userService;

    //查询全部
    @RequestMapping(value = "warehousing.do")
    public String warehousing(Warehousing warehousing, Employee employee, User user, HttpSession session)
    {
        List<Warehousing> warehousingList = warehousingService.selectWarehousing(warehousing);
        List<Employee> employeeList = employeeService.selectEmployee(employee);
        //List<User> userList = userService.selectUser(user);
        session.setAttribute("ware", warehousingList);
        session.setAttribute("emp",employeeList);
        //session.setAttribute("user",userList);
        return "page/warehouse/warehousing";
    }

    /**
     * 被选中的入库记录信息
     */
    @RequestMapping(value = "/warehousingId.do")
    public void updatemerchandiseId(Warehousing warehousing, PrintWriter printWriter){
        List<Warehousing> warehousings = warehousingService.selectWarehousing(warehousing);

        if(warehousings.size()>0){
            Warehousing m = warehousings.get(0);
            String json= JSON.toJSONString(m);
            printWriter.write(json);
            printWriter.flush();
            printWriter.close();
        }else{
            String json=JSON.toJSONString(0);
            printWriter.write(json);
            printWriter.flush();
            printWriter.close();
        }
    }
    /* 删除商品信息
   */
    @RequestMapping(value = "/deleteWarehousing.do")
    public void  deleteMerchandise(Warehousing warehousing,PrintWriter printWriter){
        int i =0;
        warehousing.setWarehousingState(1);
        i=warehousingService.updateWarehousing(warehousing);
        if(i>0){
            Warehousing s=new Warehousing();
            s.setWarehousingState(1);
            List<Warehousing> mm =warehousingService.selectWarehousing(s);
            //返回值
            String jsonString = JSON.toJSONString(mm);
            printWriter.write(jsonString);
            printWriter.flush();
            printWriter.close();
        }

        String jsonString = JSON.toJSONString(0);
        printWriter.write(jsonString);
        printWriter.flush();
        printWriter.close();
    }
}
