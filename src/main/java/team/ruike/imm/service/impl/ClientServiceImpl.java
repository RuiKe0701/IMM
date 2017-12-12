package team.ruike.imm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.ruike.imm.dao.ClientDao;
import team.ruike.imm.entity.Client;
import team.ruike.imm.instrument.Pager;
import team.ruike.imm.service.ClientService;

import java.util.List;
@Service("clientService")
public class ClientServiceImpl implements ClientService{
    int pageSize=2;//设置每页显示数据数
    @Autowired
    ClientDao clientDao;

    public ClientDao getClientDao() {
        return clientDao;
    }

    public void setClientDao(ClientDao clientDao) {
        this.clientDao = clientDao;
    }

    public List<Client> selecrClient(Client client) {
        return clientDao.selecrClient(client);
    }

    public List<Client> pagerClient(Integer currentPage) {
        Client client=new Client();
        client.setCurrentPage(currentPage);
        //设置每页显示数据数
        client.setPageSize(pageSize);
        if (currentPage>0){
            //根据输入的页数查询
            client.setCurrentPage((client.getCurrentPage()-1)*pageSize);
            return clientDao.selecrClient(client);
        }
        return clientDao.selecrClient(client);
    }

    public Pager<Client> getPager(Integer currentPage) {
        //查询全部信息
        List<Client> userList=clientDao.selecrClient(null);
        //接收分页数据
        Pager<Client> pager=new Pager<Client>(currentPage,pageSize,userList);
        return pager;
    }

    public int updateClient(Client client) {
        return clientDao.updateClient(client);
    }


    public int insertClient(Client client) {
        return clientDao.insertClient(client);
    }

    public int updateAdd(List client) {
        return clientDao.updateAdd(client);
    }
}
