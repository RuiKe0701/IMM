package team.runke.imm.entity;
/**
 * @author 闫琛昊
 * @version 2.0
 *销售订单详情
 */
public class SalesInformation {
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
    private Merchandise merchandise;
    /**
     * 销售数量
     */
    private Integer siVolume;
    /**
     * 单位
     */
    private Units units;
    /**
     * 售价
     */
    private double siActualPrice;
    /**
     * 是否已删除
     */
    private Integer siState;
    /**
     * 销售订单
     */
    private Sales sales;

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

    public Merchandise getMerchandise() {
        return merchandise;
    }

    public void setMerchandise(Merchandise merchandise) {
        this.merchandise = merchandise;
    }

    public Integer getSiVolume() {
        return siVolume;
    }

    public void setSiVolume(Integer siVolume) {
        this.siVolume = siVolume;
    }

    public Units getUnits() {
        return units;
    }

    public void setUnits(Units units) {
        this.units = units;
    }

    public double getSiActualPrice() {
        return siActualPrice;
    }

    public void setSiActualPrice(double siActualPrice) {
        this.siActualPrice = siActualPrice;
    }
}
