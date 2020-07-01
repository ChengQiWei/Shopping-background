package com.hrms.bean;

/**
 * @author GenshenWang.nomico
 * @date 2020/4/15.
 */
public class Admin {
	private Integer adminId;
	private String adminName;
	private String adminPassword;
	
	public Integer getAdminId() {
		return adminId;
	}
	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	
	@Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", adminPassword=" + adminPassword +
                '}';
    }

    public Admin() {
    }
    
    public Admin(Integer adminId,String adminName,String adminPassword) {
    	this.adminId = adminId;
    	this.adminName = adminName;
    	this.adminPassword = adminPassword;
    }

	
	

}
