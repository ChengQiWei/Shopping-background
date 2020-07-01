package com.hrms.bean;

/**
 * @author GenshenWang.nomico
 * @date 2020/4/15.
 */
public class Cart {
	
	private Integer cartId;//订单标号
	private Integer cartUser;//购买者
	private float cartPrice;//购物车总价
	private Integer cartNum;//商品个数
	private String cartAbstract;//购物车商品
	
	private User user;//网站用户
	
	
	
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	public Integer getCartUser() {
		return cartUser;
	}
	public void setCartUser(Integer cartUser) {
		this.cartUser = cartUser;
	}
	public float getCartPrice() {
		return cartPrice;
	}
	public void setCartPrice(float cartPrice) {
		this.cartPrice = cartPrice;
	}
	public Integer getCartNum() {
		return cartNum;
	}
	public void setCartNum(Integer cartNum) {
		this.cartNum = cartNum;
	}
	public String getCartAbstract() {
		return cartAbstract;
	}
	public void setCartAbstract(String cartAbstract) {
		this.cartAbstract = cartAbstract;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", cartUser='" + cartUser + '\'' +
                ", cartPrice='" + cartPrice + '\'' +
                ", cartNum='" + cartNum + '\'' +
                ", cartAbstract=" + cartAbstract + '\'' +
                ", user=" + user +
                '}';
    }

    public Cart() {
    }
    
    public Cart(Integer cartId,Integer cartUser,float cartPrice,Integer cartNum,String  cartAbstract) {
    	this.cartId = cartId;
    	this.cartUser = cartUser;
    	this.cartPrice = cartPrice;
    	this.cartNum = cartNum;
    	this.cartAbstract = cartAbstract;
    }
	

}
