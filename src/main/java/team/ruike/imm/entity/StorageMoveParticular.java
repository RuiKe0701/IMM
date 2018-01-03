package team.ruike.imm.entity;

/**
 * @author 郭旭
 * @version 2.0
 *出库详情表
 */
public class StorageMoveParticular {
    /**
     *出库编号
     */
    private Integer smpId;
    /**
     *出库单号
     */
    private String smId;
    /**
     *商品编号
     */
    private Integer merchandiseId;
    /**
     *商品数量
     */
    private Integer smpNumber;
    /**
     *损坏数量
     */
    private Integer smpDamageNumber;

    public Integer getSmpId() {
        return smpId;
    }

    public void setSmpId(Integer smpId) {
        this.smpId = smpId;
    }

    public String getSmId() {
        return smId;
    }

    public void setSmId(String smId) {
        this.smId = smId;
    }

    public Integer getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(Integer merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public Integer getSmpNumber() {
        return smpNumber;
    }

    public void setSmpNumber(Integer smpNumber) {
        this.smpNumber = smpNumber;
    }

    public Integer getSmpDamageNumber() {
        return smpDamageNumber;
    }

    public void setSmpDamageNumber(Integer smpDamageNumber) {
        this.smpDamageNumber = smpDamageNumber;
    }
}
