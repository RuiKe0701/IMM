package team.runke.imm.entity;
import java.util.Date;
public class Warehousing {
    private int warehousingId;
    private int warehousingBatchNumber;
    private int warehousingBuyer;
    private String procurementId;
    private Date warehousingDate;
    private String warehousingRemarks;
    private int warehousingEmployeeId;

    public int getWarehousingId() {
        return warehousingId;
    }

    public void setWarehousingId(int warehousingId) {
        this.warehousingId = warehousingId;
    }

    public int getWarehousingBatchNumber() {
        return warehousingBatchNumber;
    }

    public void setWarehousingBatchNumber(int warehousingBatchNumber) {
        this.warehousingBatchNumber = warehousingBatchNumber;
    }

    public int getWarehousingBuyer() {
        return warehousingBuyer;
    }

    public void setWarehousingBuyer(int warehousingBuyer) {
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

    public int getWarehousingEmployeeId() {
        return warehousingEmployeeId;
    }

    public void setWarehousingEmployeeId(int warehousingEmployeeId) {
        this.warehousingEmployeeId = warehousingEmployeeId;
    }
}
