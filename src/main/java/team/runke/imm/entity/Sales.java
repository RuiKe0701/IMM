package team.runke.imm.entity;
import java.util.Date;
public class Sales {
    private String salesId;
    private Date salesDate;
    private int clientId;
    private int employeeId;
    private int salesState;
    private int eventDetailsId;
    private int salesActivities;

    public String getSalesId() {
        return salesId;
    }

    public void setSalesId(String salesId) {
        this.salesId = salesId;
    }

    public Date getSalesDate() {
        return salesDate;
    }

    public void setSalesDate(Date salesDate) {
        this.salesDate = salesDate;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getSalesState() {
        return salesState;
    }

    public void setSalesState(int salesState) {
        this.salesState = salesState;
    }

    public int getEventDetailsId() {
        return eventDetailsId;
    }

    public void setEventDetailsId(int eventDetailsId) {
        this.eventDetailsId = eventDetailsId;
    }

    public int getSalesActivities() {
        return salesActivities;
    }

    public void setSalesActivities(int salesActivities) {
        this.salesActivities = salesActivities;
    }
}
