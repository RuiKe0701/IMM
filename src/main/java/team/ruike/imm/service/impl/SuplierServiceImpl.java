package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.SupplierDao;
import team.ruike.imm.entity.Supplier;
import team.ruike.imm.service.SupplierService;

import java.util.List;

/**
 * Created by HP on 2017/11/29.
 */
@Service("supplierService")
public class SuplierServiceImpl implements SupplierService {
    @Autowired
    private SupplierDao supplierDao;

    public SupplierDao getSupplierDao() {
        return supplierDao;
    }

    public void setSupplierDao(SupplierDao supplierDao) {
        this.supplierDao = supplierDao;
    }

    public List<Supplier> selectSuplier(Supplier supplier) {
        List<Supplier> list=supplierDao.selectSuplier(supplier);
        return list;
    }

    public int updateSupplier(Supplier supplier) {
        return supplierDao.updateSuplier(supplier);
    }

    public int insertSupplier(Supplier supplier) {
        return supplierDao.insertSuplier(supplier);
    }
}
