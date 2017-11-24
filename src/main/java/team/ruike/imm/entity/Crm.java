package team.ruike.imm.entity;

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
    private Integer employeeId;
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

    public Integer getCrmId() {
        return crmId;
    }

    public void setCrmId(Integer crmId) {
        this.crmId = crmId;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
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

    public Integer getCrmState() {
        return crmState;
    }

    public void setCrmState(Integer crmState) {
        this.crmState = crmState;
    }
}
