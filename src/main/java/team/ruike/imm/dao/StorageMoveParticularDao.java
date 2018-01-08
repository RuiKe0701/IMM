package team.ruike.imm.dao;


import team.ruike.imm.entity.StorageMoveParticular;
import team.ruike.imm.entity.Store;

import java.util.List;

/**
 * @author 郭旭s
 * @version 2.0
 *出库详情表
 *出库详情表
 */
public interface StorageMoveParticularDao {
    /**
     * 指定条件查询出库详情表
     * @return
     */
    public List<StorageMoveParticular> selectMoveParticular(StorageMoveParticular storageMoveParticular);


    /**
     * 指定条件修改出库详情表
     * @return
     */
    public int updateMoveParticular(StorageMoveParticular storageMoveParticular);

    /**
     * 新增出库详情表
     * @return
     */
    public int insertMoveParticular(StorageMoveParticular storageMoveParticular);
}
