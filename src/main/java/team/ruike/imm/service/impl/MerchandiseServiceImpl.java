package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.MerchandiseDao;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.service.MerchandiseService;

import java.util.List;

@Service("MerchandiseService")
public class MerchandiseServiceImpl implements MerchandiseService{
    @Autowired
    MerchandiseDao merchandiseDao;

    public MerchandiseDao getMerchandiseDao() {
        return merchandiseDao;
    }

    public void setMerchandiseDao(MerchandiseDao merchandiseDao) {
        this.merchandiseDao = merchandiseDao;
    }

    public List<Merchandise> selectMerchandise(Merchandise merchandise) {
        return merchandiseDao.selecrMerchandise(merchandise);
    }

    public int updateMerchandise(Merchandise merchandise) {
        return merchandiseDao.updateMerchandise(merchandise);
    }

    public int insertMerchandise(Merchandise merchandise) {
        return merchandiseDao.insertMerchandise(merchandise);
    }
}
