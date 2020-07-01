package com.hrms.controller;

import com.hrms.bean.Order;
import com.hrms.service.OrderService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author ChengQiwei.nomico
 * @date 2020/4/21.
 */
@Controller
@RequestMapping(value = "/hrms/order")
public class OrderController {
	
	 @Autowired
	      OrderService orderService;

	    /**
	     * 订单删除操作
	     * @param orderId
	     * @return
	     */
	    @RequestMapping(value = "/deleteOrder/{orderId}", method = RequestMethod.DELETE)
	    @ResponseBody
	    public JsonMsg deleteOrder(@PathVariable("orderId") Integer orderId){
	        int res = 0;
	        if (orderId > 0){
	            res = orderService.deleteOrderById(orderId);
	        }
	        if (res != 1){
	            return JsonMsg.fail().addInfo("order_del_error", "员工删除异常");
	        }
	        return JsonMsg.success();
	    }


	    /**
	     * 新增记录后，查询最新的页数
	     * @return
	     */
	    @RequestMapping(value = "/getTotalPages", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getTotalPage(){
	        int totalItems = orderService.getOrderCount();
	        //获取总的页数
	        int temp = totalItems / 5;
	        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
	        return JsonMsg.success().addInfo("totalPages", totalPages);
	    }

	    /**
	     * 查询
	     * @param pageNo 查询指定页码包含的数据
	     * @return
	     */
	    @RequestMapping(value = "/getOrderList", method = RequestMethod.GET)
	    public ModelAndView getOrder(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
	        ModelAndView mv = new ModelAndView("orderPage");
	        int limit = 5;
	        // 记录的偏移量(即从第offset行记录开始查询)，
	        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
	        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
	        int offset = (pageNo-1)*limit;
	        //获取指定页数包含的员工信息
	        List<Order> orders = orderService.getOrderList(offset, limit);
	        //获取总的记录数
	        int totalItems = orderService.getOrderCount();
	        //获取总的页数
	        int temp = totalItems / limit;
	        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
	        //当前页数
	        int curPage = pageNo;

	        //将上述查询结果放到Model中，在JSP页面中可以进行展示
	        mv.addObject("orders", orders)
	                .addObject("totalItems", totalItems)
	                .addObject("totalPages", totalPages)
	                .addObject("curPage", curPage);
	        return mv;
	    }
	

}
