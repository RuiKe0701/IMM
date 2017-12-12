package team.ruike.imm.dao;

import team.ruike.imm.entity.Procurement;

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
    List<Procurement> selectAll(Procurement procurement);
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
    /**
     * 分页
     * @return
     */
    public List<Procurement> PagerProcurement(Procurement procurement);
}
