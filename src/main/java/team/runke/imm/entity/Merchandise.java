package team.runke.imm.entity;
import java.math.BigDecimal;
/**
 *　@author 索志文
 *　@versrion 1.0
 * 商品信息
 */
public class Merchandise {
    /**
     * 商品编号
     */
    private Integer merchandiseId;
    /**
     * 商品编码
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
     * 商品类型
     */
    private ProductType productType;
    /**
     * 商品单位
     */
    private Units units;
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

    public ProductType getProductTypeId() {
        return productTypeId;
    }

    public void setProductTypeId(ProductType productTypeId) {
        this.productTypeId = productTypeId;
    }

    public Units getUnitsId() {
        return unitsId;
    }

    public void setUnitsId(Units unitsId) {
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

    public SalesStatus getSalesStatusId() {
        return salesStatusId;
    }

    public void setSalesStatusId(SalesStatus salesStatusId) {
        this.salesStatusId = salesStatusId;
    }
}
