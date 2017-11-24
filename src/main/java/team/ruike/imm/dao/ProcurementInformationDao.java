package team.ruike.imm.dao;

import team.ruike.imm.entity.ProcurementInformation;

import java.util.List;
/**
 * @author 索志文
 * @version 1.0
 */
public interface ProcurementInformationDao {
    /**
     * 指定条件查询采购订单详情
     * @param procurementInformation 采购订单详情
     * @return
     */
    public List<ProcurementInformation> selecrProcurementInformation(ProcurementInformation procurementInformation);

    /**
     * 指定条件修改采购订单详情
     * @param procurementInformation 采购订单详情
     * @return
     */
    public int updateProcurementInformation(ProcurementInformation procurementInformation);

    /**
     * 添加采购订单详情
     * @param procurementInformation
     * @return
     */
    public int insertProcurementInformation(ProcurementInformation procurementInformation);
}
