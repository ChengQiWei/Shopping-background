package com.hrms.service;

import com.hrms.bean.Order;
import com.hrms.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/23.
 */
@Service
public class OrderService {
	
	@Autowired
    OrderMapper orderMapper;

    public int getOrderCount(){//获取订单总数
        return orderMapper.countOrders();
    }
    public List<Order> getOrderList(Integer offser, Integer limit){//查找全部订单
        return orderMapper.selectByLimitAndOffset(offser, limit);
    }
    public int deleteOrderById(Integer orderId){//根据订单ID删除订单
        return orderMapper.deleteOneById(orderId);
    }

	

}
