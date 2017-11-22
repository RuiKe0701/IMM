package team.runke.imm.entity;
import java.math.BigDecimal;
public class ProcurementInformation {
    private int piId;
    private String procurementId;
    private int merchandiseId;
    private BigDecimal piActualPrice;
    private int piVolume;
    private int unitsId;

    public int getPiId() {
        return piId;
    }

    public void setPiId(int piId) {
        this.piId = piId;
    }

    public String getProcurementId() {
        return procurementId;
    }

    public void setProcurementId(String procurementId) {
        this.procurementId = procurementId;
    }

    public int getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(int merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public BigDecimal getPiActualPrice() {
        return piActualPrice;
    }

    public void setPiActualPrice(BigDecimal piActualPrice) {
        this.piActualPrice = piActualPrice;
    }

    public int getPiVolume() {
        return piVolume;
    }

    public void setPiVolume(int piVolume) {
        this.piVolume = piVolume;
    }

    public int getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(int unitsId) {
        this.unitsId = unitsId;
    }
}
