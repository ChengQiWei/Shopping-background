package com.hrms.controller;


import com.hrms.bean.Sort;
import com.hrms.service.SortService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
@Controller
@RequestMapping(value = "/hrms/sort")
public class SortController {
	
	  @Autowired
	    SortService sortService;

	    /**
	     * 员工删除操作
	     * @param sortId
	     * @return
	     */
	    @RequestMapping(value = "/deleteSort/{sortId}", method = RequestMethod.DELETE)
	    @ResponseBody
	    public JsonMsg deleteSort(@PathVariable("sortId") Integer sortId){
	        int res = 0;
	        if (sortId > 0){
	            res = sortService.deleteSortById(sortId);
	        }
	        if (res != 1){
	            return JsonMsg.fail().addInfo("sort_del_error", "员工删除异常");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 更改员工信息
	     * @param sortId
	     * @param sort
	     * @return
	     */
	    @RequestMapping(value ="/updateSort/{sortId}", method = RequestMethod.PUT)
	    @ResponseBody
	    public JsonMsg updateSort(@PathVariable("sortId") Integer sortId,  Sort sort){
	        int res = sortService.updateSortById(sortId, sort);
	        if (res != 1){
	            return JsonMsg.fail().addInfo("sort_update_error", "更改异常");
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
	        int totalItems = sortService.getSortCount();
	        //获取总的页数
	        int temp = totalItems / 5;
	        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
	        return JsonMsg.success().addInfo("totalPages", totalPages);
	    }

	    /**
	     * 新增员工
	     * @param employee 新增的员工信息
	     * @return
	     */
	    @RequestMapping(value = "/addSort", method = RequestMethod.POST)
	    @ResponseBody
	    public JsonMsg addSort(Sort sort){
	        int res = sortService.addSort(sort);
	        if (res == 1){
	            return JsonMsg.success();
	        }else {
	            return JsonMsg.fail();
	        }
	    }

	    /**
	     * 根据id查询员工信息
	     * @param sortId
	     * @return
	     */
	    @RequestMapping(value = "/getSortById/{sortId}", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getSortById(@PathVariable("sortId") Integer sortId){
	    	Sort sort = sortService.getSortById(sortId);
	        if (sort != null){
	            return JsonMsg.success().addInfo("sort", sort);
	        }else {
	            return JsonMsg.fail();
	        }

	    }
	    /**
	     * 查询
	     * @param pageNo 查询指定页码包含的数据
	     * @return
	     */
	    @RequestMapping(value = "/getSortList", method = RequestMethod.GET)
	    public ModelAndView getSort(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
	        ModelAndView mv = new ModelAndView("sortPage");
	        int limit = 5;
	        // 记录的偏移量(即从第offset行记录开始查询)，
	        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
	        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
	        int offset = (pageNo-1)*limit;
	        //获取指定页数包含的员工信息
	        List<Sort> sorts = sortService.getSortList(offset, limit);
	        //获取总的记录数
	        int totalItems = sortService.getSortCount();
	        //获取总的页数
	        int temp = totalItems / limit;
	        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
	        //当前页数
	        int curPage = pageNo;

	        //将上述查询结果放到Model中，在JSP页面中可以进行展示
	        mv.addObject("sorts", sorts)
	                .addObject("totalItems", totalItems)
	                .addObject("totalPages", totalPages)
	                .addObject("curPage", curPage);
	        return mv;
	    }
	
	    /**
	     * 查询所有部门名称
	     * @return
	     */
	    @RequestMapping(value = "/getSortName", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getSortName(){
	        List<Sort> sortList = sortService.getSortName();
	        if (sortList != null){
	            return JsonMsg.success().addInfo("sortList", sortList);
	        }
	        return JsonMsg.fail();
	    }
	
	
	

}
