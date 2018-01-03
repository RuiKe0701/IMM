package team.ruike.imm.entity;

/**
 * /**
 * @author 郭旭
 * @version 2.0
 *入库详情表
 */

public class WarehousingParticular {

    /**
     *入库编号
     */
    private Integer wpId;
    /**
     *入库单号
     */
    private String warehousingId;
    /**
     *商品编号
     */
    private Integer merchandiseId;
    /**
     *商品数量
     */
    private Integer wpNumber;
    /**
     *预计入库（采购订单上数量）
     */
    private Integer wpPredictNumber;
    /**
     *实际入库
     */
    private Integer wpPracticalNumber;
    /**
     *损坏数量
     */
    private Integer wpDamageNumber;


    public Integer getWpId() {
        return wpId;
    }

    public void setWpId(Integer wpId) {
        this.wpId = wpId;
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

    public Integer getWpNumber() {
        return wpNumber;
    }

    public void setWpNumber(Integer wpNumber) {
        this.wpNumber = wpNumber;
    }

    public Integer getWpPredictNumber() {
        return wpPredictNumber;
    }

    public void setWpPredictNumber(Integer wpPredictNumber) {
        this.wpPredictNumber = wpPredictNumber;
    }

    public Integer getWpPracticalNumber() {
        return wpPracticalNumber;
    }

    public void setWpPracticalNumber(Integer wpPracticalNumber) {
        this.wpPracticalNumber = wpPracticalNumber;
    }

    public Integer getWpDamageNumber() {
        return wpDamageNumber;
    }

    public void setWpDamageNumber(Integer wpDamageNumber) {
        this.wpDamageNumber = wpDamageNumber;
    }
}
