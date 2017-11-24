package team.ruike.imm.entity;

/**
 *　@author 索志文
 *　@versrion 2.0
 * 商品信息
 */
public class Merchandise {
    /**
     * 商品编号
     */
    private Integer merchandiseId;
    /**
     * 商品编码；
     */
    private String productCode;
    /**
     *商品名称
     */
    private String merchandiseName;
    /**
     * 商品规格
     */
    private String merchandiseSpecification;

    /**
     * 商品类型编号
     */
    private Integer productTypeId;
    /**
     * 商品单位信息
     */
    private Integer unitsId;
    /**
     * 产地
     */
    private String merchandisePlaceOfOrigin;
    /**
     * 安全存量
     */
    private Integer merchandiseSafetyStock;
    /**
     * 当前数量
     */
    private Integer merchandiseActualQuntity;
    /**
     * 无税供价
     */
    private double merchandiseSalsePrice;
    /**
     * 销售状态
     */
    private Integer salesStatusId;
    /**
     * 是否已删除
     */
    private  Integer merchandiseState;
    /**
     * 商品单位信息
     */
    private Units units;
    /**
     * 商品类型
     */
    private ProductType productType;
    /**
     * 销售状态
     */
    private SalesStatus salesStatus;

    public Integer getMerchandiseId() {
        return merchandiseId;
    }

    public void setMerchandiseId(Integer merchandiseId) {
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

    public double getMerchandiseSalsePrice() {
        return merchandiseSalsePrice;
    }

    public void setMerchandiseSalsePrice(double merchandiseSalsePrice) {
        this.merchandiseSalsePrice = merchandiseSalsePrice;
    }

    public Integer getSalesStatusId() {
        return salesStatusId;
    }

    public void setSalesStatusId(Integer salesStatusId) {
        this.salesStatusId = salesStatusId;
    }

    public Integer getMerchandiseState() {
        return merchandiseState;
    }

    public void setMerchandiseState(Integer merchandiseState) {
        this.merchandiseState = merchandiseState;
    }

    public Units getUnits() {
        return units;
    }

    public void setUnits(Units units) {
        this.units = units;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }

    public SalesStatus getSalesStatus() {
        return salesStatus;
    }

    public void setSalesStatus(SalesStatus salesStatus) {
        this.salesStatus = salesStatus;
    }
}
