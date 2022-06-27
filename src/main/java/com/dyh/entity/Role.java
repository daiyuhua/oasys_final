package com.dyh.entity;

import java.util.Date;

/**
 * @author daiyuhua
 */
public class Role {
    private Long id;

    private String roleId;

    private String roleName;

    private String fatherRole;

    private Date gmtCreate;

    private Date gmtModified;

    public String getFatherRole() {
        return fatherRole;
    }

    public void setFatherRole(String fatherRole) {
        this.fatherRole = fatherRole;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId == null ? null : roleId.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
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

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roleId='" + roleId + '\'' +
                ", roleName='" + roleName + '\'' +
                ", fatherRole='" + fatherRole + '\'' +
                ", gmtCreate=" + gmtCreate +
                ", gmtModified=" + gmtModified +
                '}';
    }
}