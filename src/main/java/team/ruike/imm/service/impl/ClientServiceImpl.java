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
        System.out.println(client.getClientName()+"/ClientServiceImpl");
        List<Client> clients = clientDao.selecrClient(client);
        return clients;
    }

    public int updateClient(Client client) { return clientDao.updateClient(client); }

    public int insertClient(Client client) {
        return clientDao.insertClient(client);
    }
}
