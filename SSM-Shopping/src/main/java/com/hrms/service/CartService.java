package com.hrms.service;

import com.hrms.bean.Cart;
import com.hrms.mapper.CartMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/23.
 */
@Service
public class CartService {
	
	@Autowired
	CartMapper cartMapper;

    public int getCartCount(){
        return cartMapper.countCarts();
    }
    public List<Cart> getCartList(Integer offser, Integer limit){
        return cartMapper.selectByLimitAndOffset(offser, limit);
    }
    public Cart getCartById(Integer cartId){
        return cartMapper.selectOneById(cartId);
    }
    public int updateCartById(Integer cartId, Cart cart){return cartMapper.updateOneById(cartId, cart);}//修改购物车信息
    public int deleteCartById(Integer cartId){
        return cartMapper.deleteOneById(cartId);//删除购物车信息
    }
    public int deleteAll(){
        return cartMapper.deleteAll();//删除购物车信息
    }
}
