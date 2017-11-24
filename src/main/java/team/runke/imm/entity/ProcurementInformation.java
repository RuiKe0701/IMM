package team.runke.imm.entity;

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
     * 采购单号
     */
    private Procurement procurementId;
    /**
     * 商品编号
     */
    private Merchandise merchandiseId;
    /**
     * 采购价格
     */
    private double piActualPrice;
    /**
     * 采购数量
     */
    private Integer piVolume;
    /**
     * 单位
     */
    private Units unitsId;
    /**
     * 是否已删除
     */
    private Integer piState;

    public Integer getPiState() {
        return piState;
    }

    public void setPiState(Integer piState) {
        this.piState = piState;
    }

    public Integer getPiId() {
        return piId;
    }

    public void setPiId(Integer piId) {
        this.piId = piId;
    }

    public Procurement getProcurementId() {
        return procurementId;
    }

    public void setProcurementId(Procurement procurementId) {
        this.procurementId = procurementId;
    }

    public Merchandise getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(Merchandise merchandiseId) {
        this.merchandiseId = merchandiseId;
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

    public Units getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(Units unitsId) {
        this.unitsId = unitsId;
    }
}
