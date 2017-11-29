package team.ruike.imm.service;

import team.ruike.imm.entity.Supplier;

import java.util.List;

/**
 * Created by HP on 2017/11/29.
 */
public interface SupplierService {

    List<Supplier> selectSuplier(Supplier supplier);
}
