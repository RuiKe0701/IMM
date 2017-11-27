package team.ruike.imm.service;

import team.ruike.imm.entity.User;

import java.util.List;

/**
 * @author 索志文
 * 测试
 */
public interface UserService {
    /**
     * 查询指定条件的用户信息
     * @param user
     * @return
     */
    public List<User> selectUser(User user);
}
