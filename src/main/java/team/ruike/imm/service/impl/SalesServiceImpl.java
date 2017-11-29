package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.SalesDao;
import team.ruike.imm.entity.Sales;
import team.ruike.imm.service.SalesService;

import java.util.List;

@Service("salesService")
public class SalesServiceImpl implements SalesService{

    @Autowired
    private SalesDao salesDao;

    public SalesDao getSalesDao() {
        return salesDao;
    }

    public void setSalesDao(SalesDao salesDao) {
        this.salesDao = salesDao;
    }

    public List<Sales> selectSales(Sales sales) {
        List<Sales> list = salesDao.selectSales(sales);
        return list;
    }
}
