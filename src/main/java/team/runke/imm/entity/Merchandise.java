package team.runke.imm.entity;

import java.math.BigDecimal;
public class Merchandise {
    private int merchandiseId;
    private String productCode;
    private String merchandiseName;
    private String merchandiseSpecification;
    private Integer productTypeId;
    private Integer unitsId;
    private String merchandisePlaceOfOrigin;
    private Integer merchandiseSafetyStock;
    private Integer merchandiseActualQuntity;
    private BigDecimal merchandiseSalsePrice;
    private Integer salesStatusId;

    public int getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(int merchandiseId) {
        this.merchandiseId = merchandiseId;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getMerchandiseName() {
        return merchandiseName;
    }

    public void setMerchandiseName(String merchandiseName) {
        this.merchandiseName = merchandiseName;
    }

    public String getMerchandiseSpecification() {
        return merchandiseSpecification;
    }

    public void setMerchandiseSpecification(String merchandiseSpecification) {
        this.merchandiseSpecification = merchandiseSpecification;
    }

    public Integer getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(Integer productTypeId) {
        this.productTypeId = productTypeId;
    }

    public Integer getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(Integer unitsId) {
        this.unitsId = unitsId;
    }

    public String getMerchandisePlaceOfOrigin() {
        return merchandisePlaceOfOrigin;
    }

    public void setMerchandisePlaceOfOrigin(String merchandisePlaceOfOrigin) {
        this.merchandisePlaceOfOrigin = merchandisePlaceOfOrigin;
    }

    public Integer getMerchandiseSafetyStock() {
        return merchandiseSafetyStock;
    }

    public void setMerchandiseSafetyStock(Integer merchandiseSafetyStock) {
        this.merchandiseSafetyStock = merchandiseSafetyStock;
    }

    public Integer getMerchandiseActualQuntity() {
        return merchandiseActualQuntity;
    }

    public void setMerchandiseActualQuntity(Integer merchandiseActualQuntity) {
        this.merchandiseActualQuntity = merchandiseActualQuntity;
    }

    public BigDecimal getMerchandiseSalsePrice() {
        return merchandiseSalsePrice;
    }

    public void setMerchandiseSalsePrice(BigDecimal merchandiseSalsePrice) {
        this.merchandiseSalsePrice = merchandiseSalsePrice;
    }

    public Integer getSalesStatusId() {
        return salesStatusId;
    }

    public void setSalesStatusId(Integer salesStatusId) {
        this.salesStatusId = salesStatusId;
    }
}
