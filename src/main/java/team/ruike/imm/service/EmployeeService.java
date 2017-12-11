package team.ruike.imm.service;

import team.ruike.imm.entity.Employee;

import java.util.List;

/**
 * 闫琛昊
 */
public interface EmployeeService {
    /**
     * 按指定条件查询员工信息
     * @param employee
     * @return
     */
    public List<Employee> selectEmployee(Employee employee);

    /**
     * 按指定条件修改员工信息
     * @param employee
     * @return
     */
    public int updateEmployee(Employee employee);

    /**
     * 新增员工信息
     * @param employee
     * @return
     */
    public int insertEmployee(Employee employee);
}
