package team.ruike.imm.entity;

import java.util.List;

/**
 * @author 闫琛昊
 * @version 2.0
 *单位信息
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
    /**
     * 是否已删除
     */
    private Integer units_state;

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

    public List<Merchandise> getMerchandise() {
        return merchandise;
    }

    public void setMerchandise(List<Merchandise> merchandise) {
        this.merchandise = merchandise;
    }

    public List<SalesInformation> getSalesInformation() {
        return salesInformation;
    }

    public void setSalesInformation(List<SalesInformation> salesInformation) {
        this.salesInformation = salesInformation;
    }

    public List<ProcurementInformation> getProcurementInformation() {
        return procurementInformation;
    }

    public void setProcurementInformation(List<ProcurementInformation> procurementInformation) {
        this.procurementInformation = procurementInformation;
    }

    public Integer getUnits_state() {
        return units_state;
    }

    public void setUnits_state(Integer units_state) {
        this.units_state = units_state;
    }
}
