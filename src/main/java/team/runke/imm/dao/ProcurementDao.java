package team.runke.imm.dao;

import team.runke.imm.entity.Procurement;
import team.runke.imm.entity.User;

import java.util.List;
/**
 * @author 索志文
 * @version 1.0
 */
public interface ProcurementDao {
    /**
     * 指定条件查询采购订单
     * @param procurement 采购订单
     * @return
     */
    public List<Procurement> selecrProcurement(Procurement procurement);

    /**
     * 指定条件修改采购订单
     * @param procurement
     * @return
     */
    public int updateProcurement(Procurement procurement);

    /**
     * 添加采购订单
     * @param procurement
     * @return
     */
    public int insertProcurement(Procurement procurement);
}
