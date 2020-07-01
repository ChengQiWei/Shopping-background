package com.hrms.bean;


/**
 * @author GenshenWang.nomico
 * @date 2020/4/15.
 */
public class User {
	
	
	private Integer userId;
	private String userName;
    private String userPassword;
    private String gender;
	private String userPhone;
    private String userAddress;
    private String city;
	private String email;
    private String userPostcode;
    private String userLastdate;
    private String payment;

   
        
        public Integer getUserId() {
    		return userId;
    	}

    	public void setUserId(Integer userId) {
    		this.userId = userId;
    	}

    	public String getUserName() {
    		return userName;
    	}

    	public void setUserName(String userName) {
    		this.userName = userName;
    	}

    	public String getUserPassword() {
    		return userPassword;
    	}

    	public void setUserPassword(String userPassword) {
    		this.userPassword = userPassword;
    	}
    	
    	public String getGender() {
    		return gender;
    	}

    	public void setGender(String gender) {
    		this.gender = gender;
    	}

    	public String getUserPhone() {
    		return userPhone;
    	}

    	public void setUserPhone(String userPhone) {
    		this.userPhone = userPhone;
    	}

    	public String getUserAddress() {
    		return userAddress;
    	}

    	public void setUserAddress(String userAddress) {
    		this.userAddress = userAddress;
    	}

    	public String getCity() {
    		return city;
    	}

    	public void setCity(String city) {
    		this.city = city;
    	}

    	public String getEmail() {
    		return email;
    	}

    	public void setEmail(String email) {
    		this.email = email;
    	}

    	public String getPayment() {
    		return payment;
    	}

    	public void setPayment(String payment) {
    		this.payment = payment;
    	}


    	public String getUserPostcode() {
    		return userPostcode;
    	}

    	public void setUserPostcode(String userPostcode) {
    		this.userPostcode = userPostcode;
    	}

    	public String getUserLastdate() {
    		return userLastdate;
    	}

    	public void setUserLastdate(String userLastdate) {
    		this.userLastdate = userLastdate;
    	}

    

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", gender='" + gender + '\'' +
                ", userPhone=" + userPhone + '\'' +
                ", userAddress=" + userAddress + '\'' +
                ", city=" + city + '\'' +
                ", email=" + email + '\'' +
                ", userPostcode=" + userPostcode + '\'' +
                ", userLastdate=" + userLastdate + '\'' +
                ", payment=" + payment +
                '}';
    }

    public User() {
    }
    
    public User(Integer userId,String userName,String userPassword,String gender,String userPhone,String userAddress,String city, String email,String userPostcode,String userLastdate,String payment) {
    	this.userId = userId;
    	this.userName = userName;
    	this.userPassword = userPassword;
    	this.gender = gender;
    	this.userPhone = userPhone;
    	this.userAddress = userAddress;
    	this.city = city;
    	this.email = email;
    	this.payment = payment;
    	this.userPostcode = userPostcode;
    	this.userLastdate = userLastdate;
    }

}
