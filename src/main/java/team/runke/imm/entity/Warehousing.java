package team.runke.imm.entity;
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
    private Procurement procurement;
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
    private Integer warehousing_state;

    public Integer getWarehousing_state() {
        return warehousing_state;
    }

    public void setWarehousing_state(Integer warehousing_state) {
        this.warehousing_state = warehousing_state;
    }

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

    public Procurement getProcurement() {
        return procurement;
    }

    public void setProcurement(Procurement procurement) {
        this.procurement = procurement;
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
}
