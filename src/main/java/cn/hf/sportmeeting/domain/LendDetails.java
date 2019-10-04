package cn.hf.sportmeeting.domain;

import cn.hf.sportmeeting.utils.DateUtil;

import java.util.Date;

public class LendDetails {
    private Integer id;

    private Integer borrowNum;

    private String borrower;

    private String borrowerTel;

    private Date borrowTime;
    private String borrowTimeStr;

    private Date returnTime;
    private String returnTimeStr;

    private String returner;

    private Integer equipmentId;

    private String description;

    private Boolean isReturn;

    private Boolean active;

    @Override
    public String toString() {
        return "LendDetails{" +
                "id=" + id +
                ", borrowNum=" + borrowNum +
                ", borrower='" + borrower + '\'' +
                ", borrowerTel='" + borrowerTel + '\'' +
                ", borrowTime=" + borrowTime +
                ", borrowTimeStr='" + borrowTimeStr + '\'' +
                ", returnTime=" + returnTime +
                ", returnTimeStr='" + returnTimeStr + '\'' +
                ", returner='" + returner + '\'' +
                ", equipmentId=" + equipmentId +
                ", description='" + description + '\'' +
                ", isReturn=" + isReturn +
                ", active=" + active +
                '}';
    }

    public String getBorrowTimeStr() {
        if(borrowTime != null)
        {
            borrowTimeStr = DateUtil.date2String(borrowTime,"yyyy-MM-dd HH:mm:ss");
        }

        return borrowTimeStr;
    }

    public void setBorrowTimeStr(String borrowTimeStr) {
        this.borrowTimeStr = borrowTimeStr;
    }

    public String getReturnTimeStr() {
        if(returnTime != null)
        {
            returnTimeStr = DateUtil.date2String(returnTime,"yyyy-MM-dd HH:mm:ss");
        }

        return returnTimeStr;
    }

    public void setReturnTimeStr(String returnTimeStr) {
        this.returnTimeStr = returnTimeStr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBorrowNum() {
        return borrowNum;
    }

    public void setBorrowNum(Integer borrowNum) {
        this.borrowNum = borrowNum;
    }

    public String getBorrower() {
        return borrower;
    }

    public void setBorrower(String borrower) {
        this.borrower = borrower == null ? null : borrower.trim();
    }

    public String getBorrowerTel() {
        return borrowerTel;
    }

    public void setBorrowerTel(String borrowerTel) {
        this.borrowerTel = borrowerTel == null ? null : borrowerTel.trim();
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }

    public Date getReturnTime() {
        return returnTime;
    }

    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }

    public String getReturner() {
        return returner;
    }

    public void setReturner(String returner) {
        this.returner = returner == null ? null : returner.trim();
    }

    public Integer getEquipmentId() {
        return equipmentId;
    }

    public void setEquipmentId(Integer equipmentId) {
        this.equipmentId = equipmentId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Boolean getIsReturn() {
        return isReturn;
    }

    public void setIsReturn(Boolean isReturn) {
        this.isReturn = isReturn;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}