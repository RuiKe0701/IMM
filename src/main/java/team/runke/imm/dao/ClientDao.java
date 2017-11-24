package team.runke.imm.dao;

import team.runke.imm.entity.Client;

import java.util.List;
/**
 * @author 索志文
 * @version 1.0
 */
public interface ClientDao {
    /**
     * 指定条件查询客户信息
     * @param client 客户信息
     * @return
     */
    public List<Client> selecrClient(Client client);

    /**
     * 指定条件修改客户信息
     * @param client
     * @return
     */
    public int updateClient(Client client);

    /**
     * 添加客户信息
     * @param client
     * @return
     */
    public int insertClient(Client client);
}
