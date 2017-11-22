package team.runke.imm.entity;
import java.util.Date;
public class StorageMove {
    private int warehousingId;
    private int warehousingBuyer;
    private String salesId;
    private Date warehousingDate;
    private String warehousingRemarks;
    private int warehousingEmployeeId;

    public int getWarehousingId() {
        return warehousingId;
    }

    public void setWarehousingId(int warehousingId) {
        this.warehousingId = warehousingId;
    }

    public int getWarehousingBuyer() {
        return warehousingBuyer;
    }

    public void setWarehousingBuyer(int warehousingBuyer) {
        this.warehousingBuyer = warehousingBuyer;
    }

    public String getSalesId() {
        return salesId;
    }

    public void setSalesId(String salesId) {
        this.salesId = salesId;
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
