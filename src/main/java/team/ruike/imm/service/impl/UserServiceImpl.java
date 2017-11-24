package team.ruike.imm.service.impl;

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
    @Resource
    UserDao userDao;


    public UserDao getUserDao() {
        return userDao;
    }
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public List<User> selecrUser(User user) {
        return userDao.selecrUser(user);
    }
}
