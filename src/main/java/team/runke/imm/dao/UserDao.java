package team.runke.imm.dao;

import team.runke.imm.entity.User;

import java.util.List;

/**
 * @author 索志文
 * @version 1.0
 */
public interface UserDao {
    /**
     * 指定条件查询用户信息
     * @param user 用户信息
     * @return
     */
    public List<User> selecrUser(User user);

    /**
     * 指定条件修改用户信息
     * @param user
     * @return
     */
    public int updateUser(User user);

    /**
     * 添加用户信息
     * @param user
     * @return
     */
    public int insertUser(User user);
}
