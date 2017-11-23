package team.runke.imm.entity;

import java.util.List;

/**
 * @author 闫琛昊
 * @version 1.0
 *销售状态
 */
public class SalesStatus {
    /**
     * 销售编号
     */
    private Integer salesStatusId;
    /**
     * 销售名称
     */
    private String salesStatusName;

    /**
     * 商品信息表
     */
    private List<Merchandise> merchandise;

    public Integer getSalesStatusId() {
        return salesStatusId;
    }

    public void setSalesStatusId(Integer salesStatusId) {
        this.salesStatusId = salesStatusId;
    }

    public String getSalesStatusName() {
        return salesStatusName;
    }

    public void setSalesStatusName(String salesStatusName) {
        this.salesStatusName = salesStatusName;
    }
}
