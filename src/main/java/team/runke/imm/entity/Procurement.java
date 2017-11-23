package team.runke.imm.entity;

import java.util.Date;
import java.util.List;

/**
 *　@author 索志文
 *　@versrion 1.0
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
     *采购单详情
     */
    private List<ProcurementInformation> ProcurementInformation;




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

    public Supplier getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Supplier supplierId) {
        this.supplierId = supplierId;
    }

    public Employee getProcurementEmployeeId() {
        return procurementEmployeeId;
    }

    public void setProcurementEmployeeId(Employee procurementEmployeeId) {
        this.procurementEmployeeId = procurementEmployeeId;
    }

    public Integer getProcurementAccomplish() {
        return procurementAccomplish;
    }

    public void setProcurementAccomplish(Integer procurementAccomplish) {
        this.procurementAccomplish = procurementAccomplish;
    }
}
