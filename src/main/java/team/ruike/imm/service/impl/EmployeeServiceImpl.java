package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.EmployeeDao;
import team.ruike.imm.entity.Employee;
import team.ruike.imm.service.EmployeeService;

import java.util.List;


@Service("EmployeeService")
public class EmployeeServiceImpl implements EmployeeService{
    @Autowired
    EmployeeDao employeeDao;

    public EmployeeDao getEmployeeDao() {
        return employeeDao;
    }

    public void setEmployeeDao(EmployeeDao employeeDao) {
        this.employeeDao = employeeDao;
    }
    public List<Employee> selectEmployee(Employee employee){
        return employeeDao.selecrEmployee(employee);
    }
    public int updateEmployee(Employee employee){
        return employeeDao.updateEmployee(employee);
    }
    public int insertEmployee(Employee employee) {
        return  employeeDao.insertEmployee(employee);
    }
}
