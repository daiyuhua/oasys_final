package com.dyh.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.context.annotation.Bean;

import java.util.Date;

/**
 * @author daiyuhua
 */
public class Resign {
    private Long id;
    private String resignId;
    private String workId;
    private String office;
    private String reason;
    private String applyDoc;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date applyDate;

    private String status;

    private Employee employee;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date gmtCreate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date gmtModified;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getResignId() {
        return resignId;
    }

    public void setResignId(String resignId) {
        this.resignId = resignId;
    }

    public String getWorkId() {
        return workId;
    }

    public void setWorkId(String workId) {
        this.workId = workId;
    }

    public String getOffice() {
        return office;
    }

    public void setOffice(String office) {
        this.office = office;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getApplyDoc() {
        return applyDoc;
    }

    public void setApplyDoc(String applyDoc) {
        this.applyDoc = applyDoc;
    }

    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
        return "Resign{" +
                "id=" + id +
                ", resignId='" + resignId + '\'' +
                ", workId='" + workId + '\'' +
                ", office='" + office + '\'' +
                ", reason='" + reason + '\'' +
                ", applyDoc='" + applyDoc + '\'' +
                ", applyDate=" + applyDate +
                ", status='" + status + '\'' +
                ", employee=" + employee +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}
