package team.ruike.imm.dao;

import team.ruike.imm.entity.Supplier;

import java.util.List;

/**
 * @author 闫琛昊
 * @version 1.0
 *供应商信息
 */
public interface SupplierDao {
    /**
     * 指定条件查询供应商信息
     * @param supplier 供应商信息
     * @return
     */
    public List<Supplier> selectSuplier(Supplier supplier);

    /**
     * 指定条件修改供应商信息
     * @param supplier 供应商信息
     * @return
     */
    public int updateSupplier(Supplier supplier);

    /**
     * 新增供应商信息
     * @param supplier 供应商信息
     * @return
     */
    public int insertSuplier(Supplier supplier);
    /**
     * 分页
     * @return
     */
    public List<Supplier> PagerSupplier(Supplier supplier);

    public int noncooperation(List<Supplier> supplier);
    public int cooperative(List<Supplier> supplier);
}
