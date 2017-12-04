package team.ruike.imm.entity;

import team.ruike.imm.instrument.PagerParameter;

import java.awt.print.Paper;
import java.io.Serializable;

/**
 * @author 闫琛昊
 * @version 2.0
 *销售订单详情
 */
public class SalesInformation extends PagerParameter implements Serializable{
    /**
     * 销售编号
     */
    private Integer siId;
    /**
     * 订单编号
     */
    private String salesId;
    /**
     * 药品编号
     */
    private Integer merchandiseId;
    /**
     * 销售数量
     */
    private Integer siVolume;
    /**
     * 单位
     */
    private Integer unitsId;
    /**
     * 售价
     */
    private double siActualPrice;
    /**
     * 是否已删除
     */
    private Integer siState;
    /**
     * 销售订单表
     */
    private Sales sales;
    /**
     * 销售订单详情
     */
    private Merchandise merchandise;
    /**
     * 单位
     */
    private Units units;

    public Integer getSiId() {
        return siId;
    }

    public void setSiId(Integer siId) {
        this.siId = siId;
    }

    public String getSalesId() {
        return salesId;
    }

    public void setSalesId(String salesId) {
        this.salesId = salesId;
    }

    public Integer getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(Integer merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public Integer getSiVolume() {
        return siVolume;
    }

    public void setSiVolume(Integer siVolume) {
        this.siVolume = siVolume;
    }

    public Integer getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(Integer unitsId) {
        this.unitsId = unitsId;
    }

    public double getSiActualPrice() {
        return siActualPrice;
    }

    public void setSiActualPrice(double siActualPrice) {
        this.siActualPrice = siActualPrice;
    }

    public Integer getSiState() {
        return siState;
    }

    public void setSiState(Integer siState) {
        this.siState = siState;
    }

    public Sales getSales() {
        return sales;
    }

    public void setSales(Sales sales) {
        this.sales = sales;
    }

    public Merchandise getMerchandise() {
        return merchandise;
    }

    public void setMerchandise(Merchandise merchandise) {
        this.merchandise = merchandise;
    }

    public Units getUnits() {
        return units;
    }

    public void setUnits(Units units) {
        this.units = units;
    }
}
