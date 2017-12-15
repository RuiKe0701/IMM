package team.ruike.imm.entity;

/**
 * Created by HP on 2017/12/15.
 */
public class PurchaseOrderInformation {
    /**
     * 采购编号
     */
    private Integer poiId;

    /**
     * 采购订单编号
     */
    private String purchaseOrderId;
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
    private double piTotalPrice;
    private String piRemarks;

    public Integer getPoiId() {
        return poiId;
    }

    public void setPoiId(Integer poiId) {
        this.poiId = poiId;
    }

    public String getPurchaseOrderId() {
        return purchaseOrderId;
    }

    public void setPurchaseOrderId(String purchaseOrderId) {
        this.purchaseOrderId = purchaseOrderId;
    }

    public double getPiTotalPrice() {
        return piTotalPrice;
    }

    public void setPiTotalPrice(double piTotalPrice) {
        this.piTotalPrice = piTotalPrice;
    }

    public String getPiRemarks() {
        return piRemarks;
    }

    public void setPiRemarks(String piRemarks) {
        this.piRemarks = piRemarks;
    }

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
