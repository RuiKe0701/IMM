package team.ruike.imm.dao;

import team.ruike.imm.entity.Apply;

import java.util.List;

public interface ApplyDao {
    //查询购货售获申请表
    public List<Apply> selectApply(Apply apply);
    //修改购货售获申请表
    public int updateApply(Apply apply);
    //新增购货售获申请表
    public int insertApply(Apply apply);
    //删除购货售获申请表
    public int deleteApply(Apply apply);
}
