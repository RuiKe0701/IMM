package team.runke.imm.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Client {
    private int clientId;
    private String clientName;
    private String clientPersonInCharge;
    private String clientPost;
    private String clientPhone;
    private String clientMobilePhone;
    private String clientFax;
    private String clientAddress;
    private String clientFactoryAddress;

    @Id
    @Column(name = "client_id")
    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    @Basic
    @Column(name = "client_name")
    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    @Basic
    @Column(name = "client_person_in_charge")
    public String getClientPersonInCharge() {
        return clientPersonInCharge;
    }

    public void setClientPersonInCharge(String clientPersonInCharge) {
        this.clientPersonInCharge = clientPersonInCharge;
    }

    @Basic
    @Column(name = "client_post")
    public String getClientPost() {
        return clientPost;
    }

    public void setClientPost(String clientPost) {
        this.clientPost = clientPost;
    }

    @Basic
    @Column(name = "client_phone")
    public String getClientPhone() {
        return clientPhone;
    }

    public void setClientPhone(String clientPhone) {
        this.clientPhone = clientPhone;
    }

    @Basic
    @Column(name = "client_mobile_phone")
    public String getClientMobilePhone() {
        return clientMobilePhone;
    }

    public void setClientMobilePhone(String clientMobilePhone) {
        this.clientMobilePhone = clientMobilePhone;
    }

    @Basic
    @Column(name = "client_fax")
    public String getClientFax() {
        return clientFax;
    }

    public void setClientFax(String clientFax) {
        this.clientFax = clientFax;
    }

    @Basic
    @Column(name = "client_address")
    public String getClientAddress() {
        return clientAddress;
    }

    public void setClientAddress(String clientAddress) {
        this.clientAddress = clientAddress;
    }

    @Basic
    @Column(name = "client_factory_address")
    public String getClientFactoryAddress() {
        return clientFactoryAddress;
    }

    public void setClientFactoryAddress(String clientFactoryAddress) {
        this.clientFactoryAddress = clientFactoryAddress;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Client client = (Client) o;

        if (clientId != client.clientId) return false;
        if (clientName != null ? !clientName.equals(client.clientName) : client.clientName != null) return false;
        if (clientPersonInCharge != null ? !clientPersonInCharge.equals(client.clientPersonInCharge) : client.clientPersonInCharge != null)
            return false;
        if (clientPost != null ? !clientPost.equals(client.clientPost) : client.clientPost != null) return false;
        if (clientPhone != null ? !clientPhone.equals(client.clientPhone) : client.clientPhone != null) return false;
        if (clientMobilePhone != null ? !clientMobilePhone.equals(client.clientMobilePhone) : client.clientMobilePhone != null)
            return false;
        if (clientFax != null ? !clientFax.equals(client.clientFax) : client.clientFax != null) return false;
        if (clientAddress != null ? !clientAddress.equals(client.clientAddress) : client.clientAddress != null)
            return false;
        if (clientFactoryAddress != null ? !clientFactoryAddress.equals(client.clientFactoryAddress) : client.clientFactoryAddress != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = clientId;
        result = 31 * result + (clientName != null ? clientName.hashCode() : 0);
        result = 31 * result + (clientPersonInCharge != null ? clientPersonInCharge.hashCode() : 0);
        result = 31 * result + (clientPost != null ? clientPost.hashCode() : 0);
        result = 31 * result + (clientPhone != null ? clientPhone.hashCode() : 0);
        result = 31 * result + (clientMobilePhone != null ? clientMobilePhone.hashCode() : 0);
        result = 31 * result + (clientFax != null ? clientFax.hashCode() : 0);
        result = 31 * result + (clientAddress != null ? clientAddress.hashCode() : 0);
        result = 31 * result + (clientFactoryAddress != null ? clientFactoryAddress.hashCode() : 0);
        return result;
    }
}
