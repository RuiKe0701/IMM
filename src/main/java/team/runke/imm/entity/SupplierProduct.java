package team.runke.imm.entity;
import java.math.BigDecimal;
public class SupplierProduct {
    private int supplierProductId;
    private int merchandiseId;
    private int supplierId;
    private BigDecimal supplierProductPrice;

    public int getSupplierProductId() {
        return supplierProductId;
    }

    public void setSupplierProductId(int supplierProductId) {
        this.supplierProductId = supplierProductId;
    }

    public int getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(int merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public BigDecimal getSupplierProductPrice() {
        return supplierProductPrice;
    }

    public void setSupplierProductPrice(BigDecimal supplierProductPrice) {
        this.supplierProductPrice = supplierProductPrice;
    }
}
