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
    private Integer warehousingBuyer;
    /**
     * 采购单号
     */
    private String procurementId;
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
    private Integer warehousingUserId;
    /**
     * 是否已删除
     */
    private Integer warehousingState;
    /**
     * 员工信息
     */
    private Employee employee;
    /**
     * 用户信息
     */
    private  User user;
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

    public Integer getWarehousingBuyer() {
        return warehousingBuyer;
    }

    public void setWarehousingBuyer(Integer warehousingBuyer) {
        this.warehousingBuyer = warehousingBuyer;
    }

    public String getProcurementId() {
        return procurementId;
    }

    public void setProcurementId(String procurementId) {
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

    public Integer getWarehousingUserId() {
        return warehousingUserId;
    }

    public void setWarehousingUserId(Integer warehousingUserId) {
        this.warehousingUserId = warehousingUserId;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Procurement getProcurement() {
        return procurement;
    }

    public void setProcurement(Procurement procurement) {
        this.procurement = procurement;
    }
}
