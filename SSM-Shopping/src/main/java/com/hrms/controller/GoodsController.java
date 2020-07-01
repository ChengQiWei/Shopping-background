package com.hrms.controller;


import com.hrms.bean.Goods;
import com.hrms.service.GoodsService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

/**
 * @author ChengQiwei.nomico
 * @date 2020/4/23.
 */
@Controller
@RequestMapping(value = "/hrms/go")
public class GoodsController {
	
	 @Autowired
	    GoodsService goodsService;

	    /**
	     * 商品删除操作
	     * @param goId
	     * @return
	     */
	    @RequestMapping(value = "/deleteGo/{goId}", method = RequestMethod.DELETE)
	    @ResponseBody
	    public JsonMsg deleteGo(@PathVariable("goId") Integer goId){
	        int res = 0;
	        if (goId > 0){
	            res = goodsService.deleteGoById(goId);
	        }
	        if (res != 1){
	            return JsonMsg.fail().addInfo("go_del_error", "商品删除异常");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 更改商品信息
	     * @param file
	     * @param goId
	     * @param goods
	     * @param map
	     * @return
	     * @throws IOException 
	     * @throws IllegalStateException 
	     */
	    @RequestMapping(value ="/updateGo/{goId}", method = RequestMethod.POST)
	    @ResponseBody
	    public JsonMsg updateGo(@PathVariable("goId") Integer goId,  Goods goods, MultipartFile file, ModelMap map) throws IllegalStateException, IOException{
	        int res =  goodsService.updateGoById(file,goId, goods,map);
	        if (res != 1){
	            return JsonMsg.fail().addInfo("go_update_error", "更改异常");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 查询输入的商品名称是否重复
	     * @param empName
	     * @return
	     */
	    @RequestMapping(value = "/checkGoExists", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg checkGoExists(@RequestParam("goName") String goName) {
	       
	        Goods goods = goodsService.getGoByName(goName);
	        if (goods != null){
	            return JsonMsg.fail().addInfo("name_reg_error", "商品名重复");
	        }else {
	            return JsonMsg.success();
	        }
	    }

	    /**
	     * 新增记录后，查询最新的页数
	     * @return
	     */
	    @RequestMapping(value = "/getTotalPages", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getTotalPage(@RequestParam(value = "goAny", defaultValue = "") String goAny){
	        int totalItems = goodsService.getGoCount(goAny);
	        //获取总的页数
	        int temp = totalItems / 5;
	        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
	        return JsonMsg.success().addInfo("totalPages", totalPages);
	    }

	    /**
	     * 新增商品
	     * @param goods 新增的商品信息
	     * @return
	     */
	    @RequestMapping(value = "/addGo", method = RequestMethod.POST)
	    @ResponseBody
	    public JsonMsg addGo(Goods goods){
	        int res = goodsService.addGo(goods);
	        if (res == 1){
	            return JsonMsg.success();
	        }else {
	            return JsonMsg.fail();
	        }
	    }

	    /**
	     * 根据id查询商品信息
	     * @param goId
	     * @return
	     */
	    @RequestMapping(value = "/getGoById/{goId}", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getGoById(@PathVariable("goId") Integer goId){
	        Goods goods = goodsService.getGoById(goId);
	        if (goods != null){
	            return JsonMsg.success().addInfo("goods", goods);
	        }else {
	            return JsonMsg.fail();
	        }

	    }
	    /**
	     * 查询
	     * @param pageNo 查询指定页码包含的数据
	     * @return
	     */
	    @RequestMapping(value = "/getGoList", method = RequestMethod.GET)
	    public ModelAndView getGo(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,@RequestParam(value = "goAny", defaultValue = "") String goAny){
	        ModelAndView mv = new ModelAndView("goodsPage");
	        int limit = 5;
	        // 记录的偏移量(即从第offset行记录开始查询)，
	        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
	        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
	        int offset = (pageNo-1)*limit;
	        //获取指定页数包含的员工信息
	        List<Goods> goodss = goodsService.getGoList(offset, limit, goAny);
	        //获取总的记录数
	        int totalItems = goodsService.getGoCount(goAny);
	        //获取总的页数
	        int temp = totalItems / limit;
	        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
	        //当前页数
	        int curPage = pageNo;

	        //将上述查询结果放到Model中，在JSP页面中可以进行展示
	        mv.addObject("goodss", goodss)
	                .addObject("totalItems", totalItems)
	                .addObject("totalPages", totalPages)
	                .addObject("curPage", curPage);
	        return mv;
	    }
	    

}
