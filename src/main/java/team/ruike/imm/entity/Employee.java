package team.ruike.imm.entity;

/**
 *@author 索志文
 * @version 2.0
 * 员工信息
 */
public class Employee {
    /**
     * 员工编号
     */
    private int employeeId;
    /**
     * 员工名称
     */
    private String employeeName;
    /**
     * 职位编号
     */
    private Position position;
    /**
     *身份证号
     */
    private String employeeIdNumber;
    /**
     * 移动电话
     */
    private String employeeMobilePhone;
    /**
     * 电子邮箱
     */
    private String employeeEmail;
    /**
     * 联络地址
     */
    private String employeeAddress;
    /**
     * 是否已删除
     */
    private  Integer employeeState;

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public Integer getEmployeeState() {
        return employeeState;
    }

    public void setEmployeeState(Integer employeeState) {
        this.employeeState = employeeState;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public String getEmployeeIdNumber() {
        return employeeIdNumber;
    }

    public void setEmployeeIdNumber(String employeeIdNumber) {
        this.employeeIdNumber = employeeIdNumber;
    }

    public String getEmployeeMobilePhone() {
        return employeeMobilePhone;
    }

    public void setEmployeeMobilePhone(String employeeMobilePhone) {
        this.employeeMobilePhone = employeeMobilePhone;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }

    public String getEmployeeAddress() {
        return employeeAddress;
    }

    public void setEmployeeAddress(String employeeAddress) {
        this.employeeAddress = employeeAddress;
    }
}
