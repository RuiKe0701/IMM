package team.runke.imm.entity;
/**
 * @author 闫琛昊
 * @version 1.0
 *
 */
public class SupplierProduct {
    /**
     * 编号
     */
    private int supplierProductId;
    /**
     * 商品编号
     */
    private Merchandise merchandise;
    /**
     * 供应商编号
     */
    private Supplier supplier;
    /**
     * 供应商报价
     */

    public int getSupplierProductId() {
        return supplierProductId;
    }

    public void setSupplierProductId(int supplierProductId) {
        this.supplierProductId = supplierProductId;
    }

    public Merchandise getMerchandise() {
        return merchandise;
    }

    public void setMerchandise(Merchandise merchandise) {
        this.merchandise = merchandise;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }
}
