package team.runke.imm.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Date;

@Entity
public class Crm {
    private int crmId;
    private int crmDemand;
    private int crmAsk;
    private Date crmDate;

    @Id
    @Column(name = "crm_id")
    public int getCrmId() {
        return crmId;
    }

    public void setCrmId(int crmId) {
        this.crmId = crmId;
    }

    @Basic
    @Column(name = "crm_demand")
    public int getCrmDemand() {
        return crmDemand;
    }

    public void setCrmDemand(int crmDemand) {
        this.crmDemand = crmDemand;
    }

    @Basic
    @Column(name = "crm_ask")
    public int getCrmAsk() {
        return crmAsk;
    }

    public void setCrmAsk(int crmAsk) {
        this.crmAsk = crmAsk;
    }

    @Basic
    @Column(name = "crm_date")
    public Date getCrmDate() {
        return crmDate;
    }

    public void setCrmDate(Date crmDate) {
        this.crmDate = crmDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Crm crm = (Crm) o;

        if (crmId != crm.crmId) return false;
        if (crmDemand != crm.crmDemand) return false;
        if (crmAsk != crm.crmAsk) return false;
        if (crmDate != null ? !crmDate.equals(crm.crmDate) : crm.crmDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = crmId;
        result = 31 * result + crmDemand;
        result = 31 * result + crmAsk;
        result = 31 * result + (crmDate != null ? crmDate.hashCode() : 0);
        return result;
    }
}
