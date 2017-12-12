package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.MerchandiseDao;
import team.ruike.imm.entity.Merchandise;
import team.ruike.imm.service.MerchandiseService;

import java.util.List;

@Service("merchandiseService")
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
        List<Merchandise> list=merchandiseDao.selecrMerchandise(merchandise);
        return list;
    }
    //根据id 查询一个类
    public Merchandise selectOne(Merchandise merchandise){
        List<Merchandise> list=merchandiseDao.selecrMerchandise(merchandise);
        if(null!=list){
            return list.get(0);
        }else {
            return  new Merchandise();
        }
    }

    public int updateMerchandise(Merchandise merchandise) {
        return merchandiseDao.updateMerchandise(merchandise);
    }

    public int insertMerchandise(Merchandise merchandise) {
        return merchandiseDao.insertMerchandise(merchandise);
    }
}
