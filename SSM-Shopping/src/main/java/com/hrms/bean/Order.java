package com.hrms.bean;

/**
 * @author GenshenWang.nomico
 * @date 2020/4/15.
 */
public class Order {
	private Integer orderId;//订单标号
	private String orderUser;//购买者
	private float orderPrice;//订单价钱
	private String  orderAbstract;//订单详情
	private String orderRname;//接收者名字
	private String orderRphone;//接受者电话
	private String orderRaddre;//接受者地址
	private String orderDate;//订单日期
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderUser() {
		return orderUser;
	}
	public void setOrderUser(String orderUser) {
		this.orderUser = orderUser;
	}
	public float getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(float orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderAbstract() {
		return orderAbstract;
	}
	public void setOrderAbstract(String orderAbstract) {
		this.orderAbstract = orderAbstract;
	}
	public String getOrderRname() {
		return orderRname;
	}
	public void setOrderRname(String orderRname) {
		this.orderRname = orderRname;
	}
	public String getOrderRphone() {
		return orderRphone;
	}
	public void setOrderRphone(String orderRphone) {
		this.orderRphone = orderRphone;
	}
	public String getOrderRaddre() {
		return orderRaddre;
	}
	public void setOrderRaddre(String orderRaddre) {
		this.orderRaddre = orderRaddre;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	@Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", orderUser='" + orderUser + '\'' +
                ", orderPrice='" + orderPrice + '\'' +
                 ", orderAbstract='" + orderAbstract + '\'' +
                ", orderRname='" + orderRname + '\'' +
                ", orderRphone='" + orderRphone + '\'' +
                ", orderRaddre='" + orderRaddre + '\'' +
                ", orderDate=" + orderDate +
                '}';
    }

    public Order() {
    }
    
    public Order(Integer orderId,String orderUser,float orderPrice,String orderAbstract,String orderRname,String orderRphone,String orderRaddre,String orderDate) {
    	this.orderId = orderId;
    	this.orderUser = orderUser;
    	this.orderPrice = orderPrice;
    	this.orderAbstract = orderAbstract;
    	this.orderRname = orderRname;
    	this.orderRphone = orderRphone;
    	this.orderRaddre = orderRaddre;
    	this.orderDate = orderDate;
    }

	
	

}
