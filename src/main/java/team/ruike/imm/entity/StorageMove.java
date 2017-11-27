package team.ruike.imm.entity;
import java.util.Date;
/**
 * @author 闫琛昊
 * @version 2.0
 *出库记录
 */
public class StorageMove {
    /**
     * 出库编号
     */
    private  Integer smId;
    /**
     * 入库编号
     */
    private Integer warehousingId;
    /**
     * 出库人
     */
    private Integer smBuyer;
    /**
     * 售货单号
     */
    private String salesId;
    /**
     * 出库日期
     */
    private Date smDate;
    /**
     * 出库备注
     */
    private String smRemarks;
    /**
     * 经办人
     */
    private Integer smUserId;
    /**
     * 是否已删除
     */
    private Integer smState;
    /**
     * 入库记录表
     */
    private Warehousing warehousing;
    /**
     * 员工信息表
     */
    private Employee employee;
    /**
     * 用户信息
     */
    private  User user;
    /**
     * 销售订单表
     */
    private Sales sales;

    public Integer getSmId() {
        return smId;
    }

    public void setSmId(Integer smId) {
        this.smId = smId;
    }

    public Integer getWarehousingId() {
        return warehousingId;
    }

    public void setWarehousingId(Integer warehousingId) {
        this.warehousingId = warehousingId;
    }

    public Integer getSmBuyer() {
        return smBuyer;
    }

    public void setSmBuyer(Integer smBuyer) {
        this.smBuyer = smBuyer;
    }

    public String getSalesId() {
        return salesId;
    }

    public void setSalesId(String salesId) {
        this.salesId = salesId;
    }

    public Date getSmDate() {
        return smDate;
    }

    public void setSmDate(Date smDate) {
        this.smDate = smDate;
    }

    public String getSmRemarks() {
        return smRemarks;
    }

    public void setSmRemarks(String smRemarks) {
        this.smRemarks = smRemarks;
    }

    public Integer getSmUserId() {
        return smUserId;
    }

    public void setSmUserId(Integer smUserId) {
        this.smUserId = smUserId;
    }

    public Integer getSmState() {
        return smState;
    }

    public void setSmState(Integer smState) {
        this.smState = smState;
    }

    public Warehousing getWarehousing() {
        return warehousing;
    }

    public void setWarehousing(Warehousing warehousing) {
        this.warehousing = warehousing;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Sales getSales() {
        return sales;
    }

    public void setSales(Sales sales) {
        this.sales = sales;
    }
}