package team.ruike.imm.dao;

import team.ruike.imm.entity.User;
import team.ruike.imm.instrument.Pager;

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
    public List<User> selectUser(User user);

    /**
     * 分页
     * @return
     */
    public List<User> PagerUser(User user);

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
