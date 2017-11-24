package team.ruike.imm.entity;
import java.util.Date;

/**
 * @author 闫琛昊
 * @version 2.0
 *入库记录
 */
public class Warehousing {
    /**
     * 入库编号
     */
    private Integer warehousingId;
    /**
     * 批号
     */
    private Integer warehousingBatchNumber;
    /**
     * 入库人
     */
    private Integer warehousing_buyer;
    /**
     * 采购单号
     */
    private Integer procurementId;
    /**
     * 入库日期
     */
    private Date warehousingDate;
    /**
     * 入库备注
     */
    private String warehousingRemarks;
    /**
     * 经办人
     */
    private int warehousingEmployeeId;
    /**
     * 是否已删除
     */
    private Integer warehousingState;
    /**
     * 员工信息
     */
    private Employee employee;
    /**
     * 采购单号
     */
    private Procurement procurement;



    public Integer getWarehousingId() {
        return warehousingId;
    }

    public void setWarehousingId(Integer warehousingId) {
        this.warehousingId = warehousingId;
    }

    public Integer getWarehousingBatchNumber() {
        return warehousingBatchNumber;
    }

    public void setWarehousingBatchNumber(Integer warehousingBatchNumber) {
        this.warehousingBatchNumber = warehousingBatchNumber;
    }

    public Integer getWarehousing_buyer() {
        return warehousing_buyer;
    }

    public void setWarehousing_buyer(Integer warehousing_buyer) {
        this.warehousing_buyer = warehousing_buyer;
    }

    public Integer getProcurementId() {
        return procurementId;
    }

    public void setProcurementId(Integer procurementId) {
        this.procurementId = procurementId;
    }

    public Date getWarehousingDate() {
        return warehousingDate;
    }

    public void setWarehousingDate(Date warehousingDate) {
        this.warehousingDate = warehousingDate;
    }

    public String getWarehousingRemarks() {
        return warehousingRemarks;
    }

    public void setWarehousingRemarks(String warehousingRemarks) {
        this.warehousingRemarks = warehousingRemarks;
    }

    public int getWarehousingEmployeeId() {
        return warehousingEmployeeId;
    }

    public void setWarehousingEmployeeId(int warehousingEmployeeId) {
        this.warehousingEmployeeId = warehousingEmployeeId;
    }

    public Integer getWarehousingState() {
        return warehousingState;
    }

    public void setWarehousingState(Integer warehousingState) {
        this.warehousingState = warehousingState;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Procurement getProcurement() {
        return procurement;
    }

    public void setProcurement(Procurement procurement) {
        this.procurement = procurement;
    }
    //aaa
}
