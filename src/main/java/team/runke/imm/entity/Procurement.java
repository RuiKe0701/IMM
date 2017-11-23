package team.runke.imm.entity;
import java.util.Date;
public class Procurement {
    private String procurementId;
    private Date procurementDate;
    private int supplierId;
    private int procurementEmployeeId;
    private int procurementAccomplish;

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

    public int getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(int supplierId) {
        this.supplierId = supplierId;
    }

    public int getProcurementEmployeeId() {
        return procurementEmployeeId;
    }

    public void setProcurementEmployeeId(int procurementEmployeeId) {
        this.procurementEmployeeId = procurementEmployeeId;
    }

    public int getProcurementAccomplish() {
        return procurementAccomplish;
    }

    public void setProcurementAccomplish(int procurementAccomplish) {
        this.procurementAccomplish = procurementAccomplish;
    }
}
