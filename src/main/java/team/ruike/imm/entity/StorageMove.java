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
    private Warehousing warehousing;
    /**
     * 出库人
     */
    private Integer smBuyer;
    /**
     * 售货单号
     */
    private Sales salesId;
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
    private Employee employee;
    /**
     * 是否已删除
     */
    private Integer smState;

    public Integer getSmId() {
        return smId;
    }

    public void setSmId(Integer smId) {
        this.smId = smId;
    }

    public Warehousing getWarehousing() {
        return warehousing;
    }

    public void setWarehousing(Warehousing warehousing) {
        this.warehousing = warehousing;
    }

    public Integer getSmBuyer() {
        return smBuyer;
    }

    public void setSmBuyer(Integer smBuyer) {
        this.smBuyer = smBuyer;
    }

    public Sales getSalesId() {
        return salesId;
    }

    public void setSalesId(Sales salesId) {
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

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Integer getSmState() {
        return smState;
    }

    public void setSmState(Integer smState) {
        this.smState = smState;
    }
}
