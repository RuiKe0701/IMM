package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.ProcurementDao;
import team.ruike.imm.entity.Procurement;
import team.ruike.imm.service.ProcurementService;

import java.util.List;

@Service("ProcurementService")
public class ProcurementServiceImpl implements ProcurementService {
    @Autowired
    ProcurementDao procurementDao;

    public ProcurementDao getProcurementDao() {
        return procurementDao;
    }

    public void setProcurementDao(ProcurementDao procurementDao) {
        this.procurementDao = procurementDao;
    }

    public List<Procurement> selectProcurement(Procurement procurement) {
        return null;
    }

    public int updateProcurement(Procurement procurement) {
        return 0;
    }

    public int insertProcurement(Procurement procurement) {
        return 0;
    }
}
