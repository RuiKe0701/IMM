package team.runke.imm.entity;

import java.util.List;

/**
 *　@author 索志文
 *　@versrion 1.0
 * 职位信息
 */
public class Position {
    /**
     * 职位编号
     */
    private Integer positionId;
    /**
     * 职位名称
     */
    private String positionName;
    /**
     * 员工信息
     */
    private List<Employee> Employee;

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }
}
