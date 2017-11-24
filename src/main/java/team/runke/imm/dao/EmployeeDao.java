package team.runke.imm.dao;

import team.runke.imm.entity.Crm;
import team.runke.imm.entity.Employee;

import java.util.List;
/**
 * @author 索志文
 * @version 1.0
 */
public interface EmployeeDao {
    /**
     * 指定条件查询员工信息
     * @param employee 员工信息
     * @return
     */
    public List<Employee> selecrEmployee(Employee employee);

    /**
     *指定条件修改员工信息
     * @param employee
     * @return
     */
    public int updateEmployee(Employee employee);

    /**
     *增加员工信息
     * @param employee
     * @return
     */
    public int insertEmployee(Employee employee);
}
