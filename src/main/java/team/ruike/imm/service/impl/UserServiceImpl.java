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
        User u=new User();
        List<User> list=null;
        list=userDao.selectUser(user);
        if (list.size()>0 && list!=null ){
            if(list.get(0).getUserName().equals(user.getUserName())&&list.get(0).getUserPassword().equals(user.getUserPassword())){
                return  list.get(0);
            }
            u.setUserName("无");
        }
        u.setUserName("无");
        return u;
    }

    public List<User> userList(User user) {
        return userDao.selectUser(user);
    }

    int pageSize=2;//设置每页显示数据数
    /**
     * 分页查询进入SQL语句
     * @return
     */
    public List<User> pagerUser(Integer currentPage) {
        User user=new User();
        user.setCurrentPage(currentPage);
        //设置每页显示数据数
        user.setPageSize(pageSize);
        if (currentPage>0){
        //根据输入的页数查询
        user.setCurrentPage((user.getCurrentPage()-1)*pageSize);
        return userDao.selectUser(user);
        }
        return userDao.selectUser(user);
    }
    /**
     * 分页信息进入Pager类
     * @return
     */
    public Pager<User> getPager(Integer currentPage){
        //查询全部信息
        List<User> userList=userDao.selectUser(null);
        //接收分页数据
        Pager<User> pager=new Pager<User>(currentPage,pageSize,userList);
        return pager;
    }

    public int insertAdd(List<User> users) {
        return userDao.insertAdd(users);
    }

    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    public int insertUser(User user) {
        return userDao.insertUser(user);
    }
}
