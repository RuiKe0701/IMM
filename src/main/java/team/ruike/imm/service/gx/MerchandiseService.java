package team.ruike.imm.service.gx;

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
}
