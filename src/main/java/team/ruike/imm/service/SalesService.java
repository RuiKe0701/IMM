package team.ruike.imm.service;

import team.ruike.imm.entity.Sales;

import java.util.List;

public interface SalesService {

    List<Sales> selectSales(Sales sales);
}
