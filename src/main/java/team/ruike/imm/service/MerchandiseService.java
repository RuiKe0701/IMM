package team.ruike.imm.service;

import team.ruike.imm.entity.Merchandise;

import java.util.List;

/**
 * 闫琛昊
 */
public interface MerchandiseService {
    /**
     * 按指定条件查询商品信息
     * @param merchandise
     * @return
     */
    public List<Merchandise> selectMerchandise(Merchandise merchandise);
    List<Merchandise> selectAll(Merchandise merchandise);

    /**
     * 查询
     * @param merchandise
     * @return
     */
    public Merchandise selectOne(Merchandise merchandise);
    /**
     * 按指定条件修改商品信息
     * @param merchandise
     * @return
     */
    public int updateMerchandise(Merchandise merchandise);

    /**
     * 新增商品信息
     * @param merchandise
     * @return
     */
    public int insertMerchandise(Merchandise merchandise);
    //查询当前库存小于安全库存
    List<Merchandise> selectRelenish(Merchandise merchandise);
}
