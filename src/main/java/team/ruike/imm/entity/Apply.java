package team.ruike.imm.entity;

import team.ruike.imm.utility.PagerParameter;

import java.io.Serializable;
import java.util.Date;

public class Apply  extends PagerParameter implements Serializable {
    private Integer applyId;         //申请编号
    private String applyTitle;       //申请标题
    private String applyInvoiceNo;  //申请单号
    private String applyRemarks;    //备注
    private String applyInitiator;  //发起人
    private String applyReceived;   //接收人
    private Date applyDate;          //申请日期
    private Integer applyLook;       //是否查看

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public String getApplyTitle() {
        return applyTitle;
    }

    public void setApplyTitle(String applyTitle) {
        this.applyTitle = applyTitle;
    }

    public String getApplyInvoiceNo() {
        return applyInvoiceNo;
    }

    public void setApplyInvoiceNo(String applyInvoiceNo) {
        this.applyInvoiceNo = applyInvoiceNo;
    }

    public String getApplyRemarks() {
        return applyRemarks;
    }

    public void setApplyRemarks(String applyRemarks) {
        this.applyRemarks = applyRemarks;
    }

    public String getApplyInitiator() {
        return applyInitiator;
    }

    public void setApplyInitiator(String applyInitiator) {
        this.applyInitiator = applyInitiator;
    }

    public String getApplyReceived() {
        return applyReceived;
    }

    public void setApplyReceived(String applyReceived) {
        this.applyReceived = applyReceived;
    }

    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public Integer getApplyLook() {
        return applyLook;
    }

    public void setApplyLook(Integer applyLook) {
        this.applyLook = applyLook;
    }
}
