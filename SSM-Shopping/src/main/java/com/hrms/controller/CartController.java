package com.hrms.controller;

import com.hrms.bean.Cart;
import com.hrms.service.CartService;
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
@RequestMapping(value = "/hrms/cart")
public class CartController {
	
	@Autowired
	CartService cartService;

    /**
     * 购物车删除操作
     * @param cartId
     * @return
     */
    @RequestMapping(value = "/deleteCart/{cartId}", method = RequestMethod.DELETE)
    @ResponseBody
    public JsonMsg deleteCart(@PathVariable("cartId") Integer cartId){
        int res = 0;
        if (cartId > 0){
            res = cartService.deleteCartById(cartId);
        }
        if (res != 1){
            return JsonMsg.fail().addInfo("cart_del_error", "购物车删除异常");
        }
        return JsonMsg.success();
    }
    
    /**
     * 购物车清空操作
     * @return
     */
    @RequestMapping(value = "/deleteCartAll", method = RequestMethod.DELETE)
    @ResponseBody
    public JsonMsg deleteCartAll(){
        int res = 0;
        res = cartService.deleteAll();
        if (res != 1){
            return JsonMsg.fail().addInfo("cart_del_error", "购物车清空异常");
        }
        return JsonMsg.success();
    }

    /**
     * 更改购物车信息
     * @param cartId
     * @param cart
     * @return
     */
    @RequestMapping(value ="/updateCart/{cartId}", method = RequestMethod.PUT)
    @ResponseBody
    public JsonMsg updateCart(@PathVariable("cartId") Integer cartId,  Cart cart){
        int res = cartService.updateCartById(cartId, cart);
        if (res != 1){
            return JsonMsg.fail().addInfo("cart_update_error", "更改异常");
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
        int totalItems = cartService.getCartCount();
        //获取总的页数
        int temp = totalItems / 5;
        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
        return JsonMsg.success().addInfo("totalPages", totalPages);
    }


    /**
     * 根据id查询员工信息
     * @param cartId
     * @return
     */
    @RequestMapping(value = "/getCartById/{cartId}", method = RequestMethod.GET)
    @ResponseBody
    public JsonMsg getCartById(@PathVariable("cartId") Integer cartId){
    	Cart cart= cartService.getCartById(cartId);
        if (cart != null){
            return JsonMsg.success().addInfo("cart", cart);
        }else {
            return JsonMsg.fail();
        }

    }
    /**
     * 查询
     * @param pageNo 查询指定页码包含的数据
     * @return
     */
    @RequestMapping(value = "/getCartList", method = RequestMethod.GET)
    public ModelAndView getCart(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
        ModelAndView mv = new ModelAndView("cartPage");
        int limit = 5;
        // 记录的偏移量(即从第offset行记录开始查询)，
        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
        int offset = (pageNo-1)*limit;
        //获取指定页数包含的员工信息
        List<Cart> carts = cartService.getCartList(offset, limit);
        //获取总的记录数
        int totalItems = cartService.getCartCount();
        //获取总的页数
        int temp = totalItems / limit;
        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
        //当前页数
        int curPage = pageNo;

        //将上述查询结果放到Model中，在JSP页面中可以进行展示
        mv.addObject("carts", carts)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPage", curPage);
        return mv;
    }
	
	
	
	
	

}
