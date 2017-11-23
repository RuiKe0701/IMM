package team.runke.imm.entity;
import java.util.Date;
import java.util.List;

/**
 * @author 闫琛昊
 * @version 1.0
 *销售订单
 */
public class Sales {
    /**
     *  订单编号
     */
    private String salesId;
    /**
     *  销售日期
     */
    private Date salesDate;
    /**
     * 客户编号
     */
    private Client client;
    /**
     * 业务员编号
     */
    private Employee employee;
    /**
     * 状态
     */
    private Integer salesState;
    /**
     * 活动编号
     */
    private EventDetails eventDetails;
    /**
     *
     */
    private List<SalesInformation> salesInformations;

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

    public Integer getSalesState() {
        return salesState;
    }

    public void setSalesState(Integer salesState) {
        this.salesState = salesState;
    }

    public EventDetails getEventDetails() {
        return eventDetails;
    }

    public void setEventDetails(EventDetails eventDetails) {
        this.eventDetails = eventDetails;
    }

    public List<SalesInformation> getSalesInformations() {
        return salesInformations;
    }

    public void setSalesInformations(List<SalesInformation> salesInformations) {
        this.salesInformations = salesInformations;
    }
}
