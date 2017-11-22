package team.runke.imm.entity;
import java.util.Date;
public class Crm {
    private int crmId;
    private int employeeId;
    private int clientId;
    private int crmDemand;
    private int crmAsk;
    private Date crmDate;

    public int getCrmId() {
        return crmId;
    }

    public void setCrmId(int crmId) {
        this.crmId = crmId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public int getCrmDemand() {
        return crmDemand;
    }

    public void setCrmDemand(int crmDemand) {
        this.crmDemand = crmDemand;
    }

    public int getCrmAsk() {
        return crmAsk;
    }

    public void setCrmAsk(int crmAsk) {
        this.crmAsk = crmAsk;
    }

    public Date getCrmDate() {
        return crmDate;
    }

    public void setCrmDate(Date crmDate) {
        this.crmDate = crmDate;
    }
}
