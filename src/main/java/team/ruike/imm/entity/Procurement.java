package team.ruike.imm.entity;
import java.util.Date;

/**
 * @author 索志文
 * @version 2.0
 * 采购订单
 */
public class Procurement {
    /**
     * 采购单号
     */
    private String procurementId;
    /**
     * 采购日期
     */
    private Date procurementDate;
    /**
     * 供应商编号
     */
    private Supplier supplier;
    /**
     * 采购人
     */
    private Employee procurementEmployee;
    /**
     * 状态
     */
    private Integer procurementAccomplish;
    /**
     * 是否已删除
     */
    private  Integer procurementState;

    public Integer getProcurementState() {
        return procurementState;
    }

    public void setProcurementState(Integer procurementState) {
        this.procurementState = procurementState;
    }

    public String getProcurementId() {
        return procurementId;
    }

    public void setProcurementId(String procurementId) {
        this.procurementId = procurementId;
    }

    public Date getProcurementDate() {
        return procurementDate;
    }

    public void setProcurementDate(Date procurementDate) {
        this.procurementDate = procurementDate;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

    public Employee getProcurementEmployee() {
        return procurementEmployee;
    }

    public void setProcurementEmployee(Employee procurementEmployee) {
        this.procurementEmployee = procurementEmployee;
    }

    public Integer getProcurementAccomplish() {
        return procurementAccomplish;
    }

    public void setProcurementAccomplish(Integer procurementAccomplish) {
        this.procurementAccomplish = procurementAccomplish;
    }
}
