package com.dyh.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.ToString;

import java.util.Date;

/**
 * @author daiyuhua
 */
public class CheckOn {
    private Long id;
    private String checkOnId;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date checkOnTime;
    private String workId;
    private String isLate;
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

    public String getCheckOnId() {
        return checkOnId;
    }

    public void setCheckOnId(String checkOnId) {
        this.checkOnId = checkOnId;
    }

    public Date getCheckOnTime() {
        return checkOnTime;
    }

    public void setCheckOnTime(Date checkOnTime) {
        this.checkOnTime = checkOnTime;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getIsLate() {
        return isLate;
    }

    public void setIsLate(String isLate) {
        this.isLate = isLate;
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

    @Override
    public String toString() {
        return "CheckOn{" +
                "id=" + id +
                ", checkOnId='" + checkOnId + '\'' +
                ", checkOnTime=" + checkOnTime +
                ", workId='" + workId + '\'' +
                ", isLate='" + isLate + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                ", employee=" + employee +
                '}';
    }
}
