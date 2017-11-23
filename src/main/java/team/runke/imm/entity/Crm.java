package team.runke.imm.entity;
import java.util.Date;

/**
 *　@author 索志文
 *　@versrion 1.0
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

    public Integer getCrmId() {
        return crmId;
    }

    public void setCrmId(Integer crmId) {
        this.crmId = crmId;
    }

    public Employee getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Employee employeeId) {
        this.employeeId = employeeId;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getCrmDemand() {
        return crmDemand;
    }

    public void setCrmDemand(Integer crmDemand) {
        this.crmDemand = crmDemand;
    }

    public Integer getCrmAsk() {
        return crmAsk;
    }

    public void setCrmAsk(Integer crmAsk) {
        this.crmAsk = crmAsk;
    }

    public Date getCrmDate() {
        return crmDate;
    }

    public void setCrmDate(Date crmDate) {
        this.crmDate = crmDate;
    }
}
