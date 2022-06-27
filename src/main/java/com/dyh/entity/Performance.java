package com.dyh.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import jdk.nashorn.internal.objects.annotations.Getter;
import jdk.nashorn.internal.objects.annotations.Setter;

import java.util.Date;

/**
 * @author daiyuhua
 */
public class Performance {
    private Long id;
    private String performanceId;
    private String workId;
    private String applyDate;
    private Integer checkOnDay;
    private String office;
    private Double checkOnPercent;
    private String performanceStatus;
    private String isReCheck;
    private String reCheckStatus;
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

    public String getPerformanceId() {
        return performanceId;
    }

    public void setPerformanceId(String performanceId) {
        this.performanceId = performanceId;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(String applyDate) {
        this.applyDate = applyDate;
    }

    public Integer getCheckOnDay() {
        return checkOnDay;
    }

    public void setCheckOnDay(Integer checkOnDay) {
        this.checkOnDay = checkOnDay;
    }

    public Double getCheckOnPercent() {
        return checkOnPercent;
    }

    public void setCheckOnPercent(Double checkOnPercent) {
        this.checkOnPercent = checkOnPercent;
    }

    public String getPerformanceStatus() {
        return performanceStatus;
    }

    public void setPerformanceStatus(String performanceStatus) {
        this.performanceStatus = performanceStatus;
    }

    public String getIsReCheck() {
        return isReCheck;
    }

    public void setIsReCheck(String isReCheck) {
        this.isReCheck = isReCheck;
    }

    public String getReCheckStatus() {
        return reCheckStatus;
    }

    public void setReCheckStatus(String reCheckStatus) {
        this.reCheckStatus = reCheckStatus;
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
        return "Performance{" +
                "id=" + id +
                ", performanceId='" + performanceId + '\'' +
                ", workId='" + workId + '\'' +
                ", applyDate='" + applyDate + '\'' +
                ", checkOnDay=" + checkOnDay +
                ", office='" + office + '\'' +
                ", checkOnPercent=" + checkOnPercent +
                ", performanceStatus='" + performanceStatus + '\'' +
                ", isReCheck='" + isReCheck + '\'' +
                ", reCheckStatus='" + reCheckStatus + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", employee=" + employee +
                '}';
    }
}
