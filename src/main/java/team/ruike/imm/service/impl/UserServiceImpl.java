package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.UserDao;
import team.ruike.imm.entity.User;
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

    public List<User> selectUser(User user) {
        System.out.println(user.getUserName()+"/UserServiceImpl");
        List<User> users=userDao.selectUser(user);
        return users;
    }
}
