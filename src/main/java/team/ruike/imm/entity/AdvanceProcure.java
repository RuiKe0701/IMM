package team.ruike.imm.entity;

import java.util.Date;

/**
 * @author 郭旭
 * @version 2.0
 *预采购单表
 */
public class AdvanceProcure {

    /**
     *采购单号
     */
    private String apId;

    /**
     *采购日期
     */
    private Date apDate;

    /**
     *供应商编号
     */
    private Integer supplierId;
    /**
     *采购人
     */
    private Integer apEmployeeId;
    /**
     *状态
     */
    private Integer apAccomplish;
    /**
     *是否已删除
     */
    private Integer procurementState;

    public String getApId() {
        return apId;
    }

    public void setApId(String apId) {
        this.apId = apId;
    }

    public Date getApDate() {
        return apDate;
    }

    public void setApDate(Date apDate) {
        this.apDate = apDate;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public Integer getApEmployeeId() {
        return apEmployeeId;
    }

    public void setApEmployeeId(Integer apEmployeeId) {
        this.apEmployeeId = apEmployeeId;
    }

    public Integer getApAccomplish() {
        return apAccomplish;
    }

    public void setApAccomplish(Integer apAccomplish) {
        this.apAccomplish = apAccomplish;
    }

    public Integer getProcurementState() {
        return procurementState;
    }

    public void setProcurementState(Integer procurementState) {
        this.procurementState = procurementState;
    }
}
