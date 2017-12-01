package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.UserDao;
import team.ruike.imm.entity.User;
import team.ruike.imm.instrument.Pager;
import team.ruike.imm.service.UserService;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author  @author 索志文
 * 测试
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;


    public UserDao getUserDao() {
        return userDao;
    }
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    /**
     *
     * @param user
     * @return
     */
    public User selectUser(User user) {
        List<User> list=null;
        if(user.getUserName()==null || user.getUserName()=="" || user.getUserPassword()==null || user.getUserPassword()==""){
            return new User();
        }
        list=userDao.selectUser(user);
        if (list.size()>0&&list.size()<=1){
            return  list.get(0);
        }
        return new User();
    }

    public List<User> userList(User user) {
        return userDao.selectUser(user);
    }

    int pageSize=2;//设置每页显示数据数
    int  currentPage=1;  //默认显示第一页
    /**
     * 分页查询进入SQL语句
     * @param user
     * @return
     */
    public List<User> pagerUser(User user) {
        //设置每页显示数据数
        user.setPageSize(pageSize);
        //判断入参页数
        if(user.getCurrentPage()==1){
            user.setCurrentPage(currentPage);
            return userDao.PagerUser(user);
        }
        //根据输入的页数查询
        user.setCurrentPage((user.getCurrentPage()-1)*pageSize);
        return userDao.PagerUser(user);
    }
    /**
     * 分页信息进入Pager类
     * @return
     */
    public Pager<User> getPager(int currentPage){
        //查询全部信息
        List<User> userList=userDao.selectUser(null);
        //接收分页数据
        Pager<User> pager=null;
        if(currentPage==1){
            //入参分页条件
           pager=new Pager<User>(this.currentPage,pageSize,userList);
            return pager;
        }
        //计算第当前页数的值
        int page=(currentPage-1)*pageSize;
        //入参分页条件
        pager=new Pager<User>(page,pageSize,userList);
        return pager;
    }

    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    public int insertUser(User user) {
        return userDao.insertUser(user);
    }
}
