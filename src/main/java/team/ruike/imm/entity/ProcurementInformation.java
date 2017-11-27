package team.ruike.imm.entity;

/**
 * @author 索志文
 * @version 2.0
 * 采购订单详情
 */
public class ProcurementInformation {
    /**
     * 采购编号
     */
    private Integer piId;
    /**
     * 采购订单编号
     */
    private Integer procurementId;
    /**
     * 商品编号
     */
    private Integer merchandiseId;

    /**
     * 采购价格
     */
    private double piActualPrice;
    /**
     * 采购数量
     */
    private Integer piVolume;

    /**
     * 单位编号
     */
    private Integer unitsId;

    /**
     * 售价
     */
    private double siActualPrice;
    /**
     * 是否已删除
     */
    private Integer piState;
    /**
     * 单位信息
     */
    private Units units;
    /**
     * 商品信息
     */
    private Merchandise merchandise;
    /**
     * 采购订单信息
     */
    private Procurement procurement;

    public Integer getPiId() {
        return piId;
    }

    public void setPiId(Integer piId) {
        this.piId = piId;
    }

    public Integer getProcurementId() {
        return procurementId;
    }

    public void setProcurementId(Integer procurementId) {
        this.procurementId = procurementId;
    }

    public Procurement getProcurement() {
        return procurement;
    }

    public void setProcurement(Procurement procurement) {
        this.procurement = procurement;
    }

    public Integer getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(Integer merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public Merchandise getMerchandise() {
        return merchandise;
    }

    public void setMerchandise(Merchandise merchandise) {
        this.merchandise = merchandise;
    }

    public double getPiActualPrice() {
        return piActualPrice;
    }

    public void setPiActualPrice(double piActualPrice) {
        this.piActualPrice = piActualPrice;
    }

    public Integer getPiVolume() {
        return piVolume;
    }

    public void setPiVolume(Integer piVolume) {
        this.piVolume = piVolume;
    }

    public Units getUnits() {
        return units;
    }

    public void setUnits(Units units) {
        this.units = units;
    }

    public Integer getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(Integer unitsId) {
        this.unitsId = unitsId;
    }

    public Integer getPiState() {
        return piState;
    }

    public void setPiState(Integer piState) {
        this.piState = piState;
    }

    public double getSiActualPrice() {
        return siActualPrice;
    }

    public void setSiActualPrice(double siActualPrice) {
        this.siActualPrice = siActualPrice;
    }
}