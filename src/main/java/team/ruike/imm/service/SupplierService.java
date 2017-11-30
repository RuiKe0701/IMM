package team.ruike.imm.service;

import team.ruike.imm.entity.Supplier;

import java.util.List;

/**
 * 闫琛昊
 */
public interface SupplierService {
    /**
     * 按条件查询指定供应商信息
     * @param supplier
     * @return
     */
    public List<Supplier> selectSuplier(Supplier supplier);

    /**
     * 按条件修改指定供应商信息
     * @param supplier
     * @return
     */
    public int updateSupplier(Supplier supplier);

    /**
     * 新增供应商信息
     * @param supplier
     * @return
     */
    public int insertSupplier(Supplier supplier);
}
