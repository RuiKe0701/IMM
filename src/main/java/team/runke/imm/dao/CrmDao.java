package team.runke.imm.dao;

import team.runke.imm.entity.Crm;

import java.util.List;
/**
 * @author 索志文
 * @version 1.0
 */
public interface CrmDao {
    /**
     * 指定条件查询客户关系维护记录信息
     * @param client 客户关系维护记录信息
     * @return
     */
    public List<Crm> selecrCrm(Crm client);

    /**
     *指定条件修改客户关系维护记录
     * @param client
     * @return
     */
    public int updateCrm(Crm client);

    /**
     *增加客户关系维护记录
     * @param client
     * @return
     */
    public int insertCrm(Crm client);
}
