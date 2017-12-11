package team.ruike.imm.dao.gx;

import team.ruike.imm.entity.Sales;

import java.util.List;

/**
 * @author 闫琛昊
 * @version 1.0
 *销售订单
 */
public interface SalesDao {
    /**
     * 指定条件查询销售订单
     * @param sales 销售订单
     * @return
     */
    public List<Sales> selectSales(Sales sales);

    /**
     * 指定条件修改销售订单
     * @param sales 销售订单
     * @return
     */
    public int updateSales(Sales sales);

    /**
     * 新增销售订单
     * @param sales 销售订单
     * @return
     */
    public int insertSales(Sales sales);

    /**
     * 分页
     * @return
     */
    public List<Sales> PagerSales(Sales sales);
}
