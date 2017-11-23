package team.runke.imm.entity;

import java.util.List;

/**
 * @author 闫琛昊
 * @version 1.0
 *
 */
public class Units {
    /**
     * 单位编号
     */
    private int unitsId;
    /**
     * 单位名称
     */
    private String unitsName;
    /**
     * 商品信息表
     */
    private List<Merchandise> merchandise;
    /**
     * 销售订单详情表
     */
    private List<SalesInformation> salesInformation;
    /**
     * 采购订单详情表
     */
    private List<ProcurementInformation> procurementInformation;
    public int getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(int unitsId) {
        this.unitsId = unitsId;
    }

    public String getUnitsName() {
        return unitsName;
    }

    public void setUnitsName(String unitsName) {
        this.unitsName = unitsName;
    }
}
