package team.ruike.imm.entity;

import java.util.Date;

/**
 * @author 郭旭
 * @version 2.0
 *预采购单详情表
 */
public class AdvanceProcureInformation {
    /**
     *采购编号
     */
    private Integer apiId;

    /**
     *采购单号
     */
    private String apId;
    /**
     *商品编号
     */
    private Integer merchandise_id;
    /**
     *采购价格
     */
    private Double apiActualPrice;
    /**
     *采购数量
     */
    private Integer apiVolume;
    /**
     *单位
     */
    private String  unitsId;
    /**
     *是否已删除
     */
    private Integer apiState;


    public Integer getApiId() {
        return apiId;
    }

    public void setApiId(Integer apiId) {
        this.apiId = apiId;
    }

    public String getApId() {
        return apId;
    }

    public void setApId(String apId) {
        this.apId = apId;
    }

    public Integer getMerchandise_id() {
        return merchandise_id;
    }

    public void setMerchandise_id(Integer merchandise_id) {
        this.merchandise_id = merchandise_id;
    }

    public Double getApiActualPrice() {
        return apiActualPrice;
    }

    public void setApiActualPrice(Double apiActualPrice) {
        this.apiActualPrice = apiActualPrice;
    }

    public Integer getApiVolume() {
        return apiVolume;
    }

    public void setApiVolume(Integer apiVolume) {
        this.apiVolume = apiVolume;
    }

    public String getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(String unitsId) {
        this.unitsId = unitsId;
    }

    public Integer getApiState() {
        return apiState;
    }

    public void setApiState(Integer apiState) {
        this.apiState = apiState;
    }
}
