package com.dyh.entity;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @author daiyuhua
 */

public class IncreasingMoney {
    private Long id;
    private String increasingId;
    private String workId;
    private String office;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date applyDate;

    private Double increasingMoney;
    private String applyStatus;
    private String moneyOfficeStatus;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date gmtCreate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date gmtModified;
    private Employee employee;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getIncreasingId() {
        return increasingId;
    }

    public void setIncreasingId(String increasingId) {
        this.increasingId = increasingId;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getApplyDate() {
        return applyDate;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public Double getIncreasingMoney() {
        return increasingMoney;
    }

    public void setIncreasingMoney(Double increasingMoney) {
        this.increasingMoney = increasingMoney;
    }

    public String getApplyStatus() {
        return applyStatus;
    }

    public void setApplyStatus(String applyStatus) {
        this.applyStatus = applyStatus;
    }

    public String getMoneyOfficeStatus() {
        return moneyOfficeStatus;
    }

    public void setMoneyOfficeStatus(String moneyOfficeStatus) {
        this.moneyOfficeStatus = moneyOfficeStatus;
    }

    public Date getGmtCreate() {
        return gmtCreate;
    }

    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    public Date getGmtModified() {
        return gmtModified;
    }

    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    @Override
    public String toString() {
        return "IncreasingMoney{" +
                "id=" + id +
                ", increasingId='" + increasingId + '\'' +
                ", workId='" + workId + '\'' +
                ", office='" + office + '\'' +
                ", applyDate=" + applyDate +
                ", increasingMoney=" + increasingMoney +
                ", applyStatus='" + applyStatus + '\'' +
                ", moneyOfficeStatus='" + moneyOfficeStatus + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", employee=" + employee +
                '}';
    }
}
