package team.ruike.imm.dao;

import team.ruike.imm.entity.Merchandise;

import java.util.List;

/**
 * @author 索志文
 * @version 1.0
 */
public interface MerchandiseDao {
    /**
     * 指定条件查询商品信息
     * @param merchandise 商品信息
     * @return
     */
    public List<Merchandise> selecrMerchandise(Merchandise merchandise);
    List<Merchandise> selectAll(Merchandise merchandise);

    /**
     *指定条件修改商品信息
     * @param merchandise
     * @return
     */
    public int updateMerchandise(Merchandise merchandise);

    /**
     *增加商品信息
     * @param merchandise
     * @return
     */
    public int insertMerchandise(Merchandise merchandise);
    /**
     * 分页
     * @return
     */
    public List<Merchandise> PagerMerchandise(Merchandise merchandise);
}
