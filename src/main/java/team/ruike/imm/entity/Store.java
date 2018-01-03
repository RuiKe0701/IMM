package team.ruike.imm.entity;

import java.util.Date;

/**
 * @author 郭旭
 * @version 2.0
 *商品详情信息表
 */
public class Store {
    /**
     *仓库商品编号
     */
    private Integer storeId;

    /**
     *入库单号
     */
    private String warehousingId;

    /**
     *商品编号
     */
    private Integer merchandiseId;

    /**
     *当前数量
     */
    private Integer storeNumber;

    /**
     *进货价
     */
    private Double purchasingPrice;

    /**
     *生产日期
     */
    private Date storeBirthday;

    /**
     *保质日期
     */
    private Date storeLife;

    /**
     *损坏数量
     */
    private Integer storeDamaged;





    private Merchandise merchandise;

    public Integer getStoreId() {
        return storeId;
    }

    public void setStoreId(Integer storeId) {
        this.storeId = storeId;
    }

    public String getWarehousingId() {
        return warehousingId;
    }

    public void setWarehousingId(String warehousingId) {
        this.warehousingId = warehousingId;
    }

    public Integer getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(Integer merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public Integer getStoreNumber() {
        return storeNumber;
    }

    public void setStoreNumber(Integer storeNumber) {
        this.storeNumber = storeNumber;
    }

    public Double getPurchasingPrice() {
        return purchasingPrice;
    }

    public void setPurchasingPrice(Double purchasingPrice) {
        this.purchasingPrice = purchasingPrice;
    }

    public Date getStoreBirthday() {
        return storeBirthday;
    }

    public void setStoreBirthday(Date storeBirthday) {
        this.storeBirthday = storeBirthday;
    }

    public Date getStoreLife() {
        return storeLife;
    }

    public void setStoreLife(Date storeLife) {
        this.storeLife = storeLife;
    }

    public Integer getStoreDamaged() {
        return storeDamaged;
    }

    public void setStoreDamaged(Integer storeDamaged) {
        this.storeDamaged = storeDamaged;
    }
}