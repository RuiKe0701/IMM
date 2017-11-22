package team.runke.imm.entity;
import java.math.BigDecimal;
public class SalesInformation {
    private int siId;
    private String salesId;
    private int merchandiseId;
    private int siVolume;
    private int unitsId;
    private BigDecimal siActualPrice;

    public int getSiId() {
        return siId;
    }

    public void setSiId(int siId) {
        this.siId = siId;
    }

    public String getSalesId() {
        return salesId;
    }

    public void setSalesId(String salesId) {
        this.salesId = salesId;
    }

    public int getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(int merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public int getSiVolume() {
        return siVolume;
    }

    public void setSiVolume(int siVolume) {
        this.siVolume = siVolume;
    }

    public int getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(int unitsId) {
        this.unitsId = unitsId;
    }

    public BigDecimal getSiActualPrice() {
        return siActualPrice;
    }

    public void setSiActualPrice(BigDecimal siActualPrice) {
        this.siActualPrice = siActualPrice;
    }
}
