package team.ruike.imm.dao;

import team.ruike.imm.entity.Sales;
import team.ruike.imm.entity.Store;

import java.util.List;

/**
 * @author 郭旭
 * @version 2.0
 *商品详情信息表
 */
public interface StoreDao {
    /**
     * 指定条件查询商品详情信息表
     * @return
     */
    public List<Store> selectStore(Store store);


    /**
     * 指定条件修改商品详情信息表
     * @return
     */
    public int updateStore(Store store);

    /**
     * 新增商品详情信息表
     * @return
     */
    public int insertStore(Store store);
}
