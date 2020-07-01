package com.hrms.controller;


import com.hrms.bean.Kind;

import com.hrms.service.KindService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author ChengQiwei.nomico
 * @date 2020/4/23.
 */
@Controller
@RequestMapping(value = "/hrms/kind")
public class KindController {
	
	 @Autowired
	    KindService kindService;

	    /**
	     * 删除
	     * @param kindId
	     * @return
	     */
	    @RequestMapping(value = "/delKind/{kindId}", method = RequestMethod.DELETE)
	    @ResponseBody
	    public JsonMsg deleteKind(@PathVariable("kindId") Integer kindId){
	        int res = 0;
	        if (kindId > 0){
	            res = kindService.deleteKindById(kindId);
	        }
	        if (res != 1){
	            return JsonMsg.fail().addInfo("del_kind_error", "删除异常");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 部门更改
	     * @param kindId
	     * @param kind
	     * @return
	     */
	    @RequestMapping(value = "/updateKind/{kindId}", method = RequestMethod.PUT)
	    @ResponseBody
	    public JsonMsg updateKindById(@PathVariable("kindId") Integer kindId, Kind kind){

	        int res = 0;
	        if (kindId > 0){
	            res = kindService.updateKindById(kindId, kind);
	        }
	        if (res != 1){
	            return JsonMsg.fail().addInfo("update_kind_error", "种类更新失败");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 新增部门
	     * @param kind
	     * @return
	     */
	    @RequestMapping(value = "/addKind", method = RequestMethod.PUT)
	    @ResponseBody
	    public JsonMsg addKind(Kind kind){
	        int res = kindService.addKind(kind);
	        if (res != 1){
	            return JsonMsg.fail().addInfo("add_kind_error", "添加异常！");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 查询种类信息总页码数
	     * @return
	     */
	    @RequestMapping(value = "/getTotalPages", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getTotalPages(){

	        //每页显示的记录行数
	        int limit = 5;
	        //总记录数
	        int totalItems = kindService.getKindCount();
	        int temp = totalItems / limit;
	        int totalPages = (totalItems % limit== 0) ? temp : temp+1;

	        return JsonMsg.success().addInfo("totalPages", totalPages);
	    }

	    /**
	     *根据id号查找种类
	     */

	    @RequestMapping(value = "/getKindById/{kindId}", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getKindById(@PathVariable("kindId") Integer kindId){
	    	Kind kind = null;
	        if (kindId > 0){
	        	kind = kindService.getKindById(kindId);
	        }
	        if (kind != null){
	            return JsonMsg.success().addInfo("kind", kind);
	        }
	        return JsonMsg.fail().addInfo("get_kind_error", "无种类信息");
	    }

	    /**
	     * 分页查询：返回指定页数对应的数据
	     * @param pageNo
	     * @return
	     */
	    @RequestMapping(value = "/getKindList", method = RequestMethod.GET)
	    public ModelAndView getKindList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
	        ModelAndView mv = new ModelAndView("kindPage");
	        //每页显示的记录行数
	        int limit = 5;
	        //总记录数
	        int totalItems = kindService.getKindCount();
	        int temp = totalItems / limit;
	        int totalPages = (totalItems % limit== 0) ? temp : temp+1;
	        //每页的起始行(offset+1)数据，如第一页(offset=0，从第1(offset+1)行数据开始)
	        int offset = (pageNo - 1)*limit;
	        List<Kind> kinds = kindService.getKindList(offset, limit);

	        mv.addObject("kinds", kinds)
	                .addObject("totalItems", totalItems)
	                .addObject("totalPages", totalPages)
	                .addObject("curPageNo", pageNo);
	        return mv;
	    }

	    /**
	     * 查询所有部门名称
	     * @return
	     */
	    @RequestMapping(value = "/getKindName", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getKindName(){
	        List<Kind> kindList = kindService.getKindName();
	        if (kindList != null){
	            return JsonMsg.success().addInfo("kindList", kindList);
	        }
	        return JsonMsg.fail();
	    }
	
	
	

}
