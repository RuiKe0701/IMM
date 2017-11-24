package team.runke.imm.entity;
import com.sun.org.apache.bcel.internal.generic.INEG;

import java.util.Date;

/**
 * @author 索志文
 * @version 2.0
 * 客户关系维护记录
 */
public class Crm {
    /**
     * 记录编号
     */
    private Integer crmId;
    /**
     * 员工编号
     */
    private Employee employee;
    /**
     * 客户编号
     */
    private Integer client;
    /**
     * 是否需求
     */
    private Integer crmDemand;
    /**
     * 是否询问
     */
    private Integer crmAsk;
    /**
     * 记录时间
     */
    private Date crmDate;
    /**
     * 是否已删除
     */
    private Integer crmState;

    public void setCrmDemand(Integer crmDemand) {
        this.crmDemand = crmDemand;
    }

    public void setCrmAsk(Integer crmAsk) {
        this.crmAsk = crmAsk;
    }

    public Integer getCrmState() {
        return crmState;
    }

    public void setCrmState(Integer crmState) {
        this.crmState = crmState;
    }

    public Integer getCrmId() {
        return crmId;
    }

    public void setCrmId(Integer crmId) {
        this.crmId = crmId;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getClient() {
        return client;
    }

    public void setClient(Integer client) {
        this.client = client;
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
