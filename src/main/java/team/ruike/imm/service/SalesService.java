package team.ruike.imm.service;

import team.ruike.imm.entity.Sales;

import java.util.List;

public interface SalesService {
    /**
     * 按指定条件查询销售订单
     * @param sales
     * @return
     */
    List<Sales> selectSales(Sales sales);

    /**
     * 按指定条件修改销售订单
     * @param sales
     * @return
     */
    public int updateSales(Sales sales);

    /**
     * 新增销售订单
     * @param sales
     * @return
     */
    public int insertSales(Sales sales);

    String salesId();
}
