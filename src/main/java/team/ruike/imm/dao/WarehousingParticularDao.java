package team.ruike.imm.dao;

import team.ruike.imm.entity.Store;
import team.ruike.imm.entity.WarehousingParticular;

import java.util.List;

/**
 * @author 郭旭s
 * @version 2.0
 *入库详情表
 */
public interface WarehousingParticularDao {
    /**
     * 指定条件查询入库详情表
     * @return
     */
    public List<WarehousingParticular> selectParticular(WarehousingParticular warehousingParticular);


    /**
     * 指定条件修改入库详情表
     * @return
     */
    public int updateParticular(WarehousingParticular warehousingParticular);

    /**
     * 新增入库详情表
     * @return
     */
    public int insertParticular(WarehousingParticular warehousingParticular);
}
