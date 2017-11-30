package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.ClientDao;
import team.ruike.imm.entity.Client;
import team.ruike.imm.service.ClientService;

import java.util.List;

@Service("clientService")
public class ClientServiceImpl implements ClientService {
    @Autowired
    ClientDao clientDao;

    public ClientDao getClientDao() { return clientDao; }
    public void setClientDao(ClientDao clientDao) { this.clientDao = clientDao; }

    public List<Client> selecrClient(Client client) {
        return clientDao.selecrClient(client);
    }

    /**
     * 分页展示
     * @param client
     * @return
     */
    public List<Client> pagerClient(Client client) {
        client.setPageSize(2); //设置每页显示数据数
        client.setCurrentPage((3-1)*2);  //设置第几页 （页数-1*显示数据数）
        return clientDao.pagerClient(client);
    }

    public int updateClient(Client client) { return clientDao.updateClient(client); }

    public int insertClient(Client client) {
        return clientDao.insertClient(client);
    }
}
