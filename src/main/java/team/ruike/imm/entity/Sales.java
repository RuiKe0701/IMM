package team.ruike.imm.entity;
import org.springframework.format.annotation.DateTimeFormat;

import java.awt.print.Paper;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author 闫琛昊
 * @version 2.0
 *销售订单
 */
public class Sales extends Paper implements Serializable{
    /**
     *  订单编号
     */
    private String salesId;
    /**
     *  销售日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date salesDate;
    /**
     * 客户编号
     */
    private Integer clientId;
    /**
     * 业务员编号
     */
    private Integer employeeId;
    /**
     * 状态
     */
    private Integer salesAccomplish;
    /**
     * 活动编号
     */
    private Integer eventDetailsId;
    /**
     * 活动商品量
     */
    private Integer salesActivities;
    /**
     * 是否已删除
     */
    private Integer salesState;

    /**
     *销售订单详情
     */
    private List<SalesInformation> salesInformations;
    /**
     * 客户信息表
     */
    private Client client;
    /**
     * 业务员信息表
     */
    private Employee employee;
    /**
     * 活动信息表
     */
    private EventDetails eventDetails;

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

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public Integer getSalesAccomplish() {
        return salesAccomplish;
    }

    public void setSalesAccomplish(Integer salesAccomplish) {
        this.salesAccomplish = salesAccomplish;
    }

    public Integer getEventDetailsId() {
        return eventDetailsId;
    }

    public void setEventDetailsId(Integer eventDetailsId) {
        this.eventDetailsId = eventDetailsId;
    }

    public Integer getSalesActivities() {
        return salesActivities;
    }

    public void setSalesActivities(Integer salesActivities) {
        this.salesActivities = salesActivities;
    }

    public Integer getSalesState() {
        return salesState;
    }

    public void setSalesState(Integer salesState) {
        this.salesState = salesState;
    }

    public List<SalesInformation> getSalesInformations() {
        return salesInformations;
    }

    public void setSalesInformations(List<SalesInformation> salesInformations) {
        this.salesInformations = salesInformations;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public EventDetails getEventDetails() {
        return eventDetails;
    }

    public void setEventDetails(EventDetails eventDetails) {
        this.eventDetails = eventDetails;
    }
}
