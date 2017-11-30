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

    /**
     * 分页
     * @param user
     * @return
     */
    public List<User> pagerUser(User user) {
        user.setPageSize(2); //设置每页显示数据数
        user.setCurrentPage((3-1)*2);  //设置第几页 （页数-1*显示数据数）
        return userDao.PagerUser(user);
    }
    /**
     * 分页信息
     * @return
     */
    public Pager<User> getPager(int currentPage, int pageSize, List<User> users){
        Pager<User> pager=new Pager<User>(currentPage,pageSize,users);
        return pager;
    }

    public int updateUser(User user) {
        return userDao.updateUser(user);
    }

    public int insertUser(User user) {
        return userDao.insertUser(user);
    }
}
