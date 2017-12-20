package team.ruike.imm.service;

import team.ruike.imm.entity.ProcurementInformation;

import java.util.List;

/**
 * 闫琛昊
 */
public interface ProcurementInformationService {
    /**
     * 按指定条件查询采购订单详情
     * @param procurementInformation
     * @return
     */
    public List<ProcurementInformation> selectProcurementInformation(ProcurementInformation procurementInformation);
    void  insertAll(List<ProcurementInformation> procurementInformations);
    /**
     * 按指定条件修改采购订单详情
     * @param procurementInformation
     * @return
     */
    public int updateProcurementInformation(ProcurementInformation procurementInformation);

    /**
     * 新增采购订单详情
     * @param procurementInformation
     * @return
     */
    public int insertProcurementInformation(ProcurementInformation procurementInformation);
    //查询采购订单还未入库的订单
    List<ProcurementInformation> selectReplenish();
}
