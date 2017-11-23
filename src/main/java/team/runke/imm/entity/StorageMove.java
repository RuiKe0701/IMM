package team.runke.imm.entity;
import java.util.Date;
/**
 * @author 闫琛昊
 * @version 1.0
 *
 */
public class StorageMove {
    /**
     * 入库编号
     */
    private Integer warehousingId;
    /**
     * 出库人
     */
    private Employee employee;
    /**
     * 售货单号
     */
    private Sales sales;
    /**
     * 出库日期
     */
    private Date warehousingDate;
    /**
     * 出库备注
     */
    private String warehousingRemarks;
    /**
     * 经办人
     */
    private Integer warehousingEmployeeId;

    public void setWarehousingId(Integer warehousingId) {
        this.warehousingId = warehousingId;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public Sales getSales() {
        return sales;
    }

    public void setSales(Sales sales) {
        this.sales = sales;
    }

    public void setWarehousingEmployeeId(Integer warehousingEmployeeId) {
        this.warehousingEmployeeId = warehousingEmployeeId;
    }
}
