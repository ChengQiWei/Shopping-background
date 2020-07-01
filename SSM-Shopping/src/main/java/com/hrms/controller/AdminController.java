package com.hrms.controller;

import com.hrms.bean.Admin;
import com.hrms.service.AdminService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import java.util.List;

/**
 * @author ChengQiwei.nomico
 * @date 2020/4/21.
 */
@Controller
@RequestMapping(value = "/hrms/admin")

public class AdminController {
	
	 @Autowired
	 AdminService adminService;

	    

	    /**
	     * 更改管理员信息
	     * @param adminId
	     * @param admin
	     * @return
	     */
	    @RequestMapping(value ="/updateAdmin/{adminId}", method = RequestMethod.PUT)
	    @ResponseBody
	    public JsonMsg updateAdmin(@PathVariable("adminId") Integer adminId,  Admin admin){
	        int res = adminService.updateAdminById(adminId, admin);
	        if (res != 1){
	            return JsonMsg.fail().addInfo("admin_update_error", "更改异常");
	        }
	        return JsonMsg.success();
	    }
	    
	    /**
	     * 更改管理员信息
	     * @param adminName
	     * @param admin
	     * @return
	     */
	    @RequestMapping(value ="/updateAdminByName/{adminName}", method = RequestMethod.PUT)
	    @ResponseBody
	    public JsonMsg updateAdminByName(@PathVariable("adminName") String adminName,  Admin admin){
	        int res = adminService.updateAdminByName(adminName, admin);
	        if (res != 1){
	            return JsonMsg.fail().addInfo("admin_update_error", "更改异常");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 查询输入的管理员姓名是否重复
	     * @param adminName
	     * @return
	     */
	    @RequestMapping(value = "/checkAdminExists", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg checkEmpExists(@RequestParam("adminName") String adminName){
	        //对输入的姓名与邮箱格式进行验证
	    	Admin admin = adminService.getAdminByName(adminName);
	        if (admin != null){
	            return JsonMsg.fail().addInfo("name_reg_error", "用户名重复");
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
	    public JsonMsg getTotalPage(){
	        int totalItems = adminService.getAdminCount();
	        //获取总的页数
	        int temp = totalItems / 5;
	        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
	        return JsonMsg.success().addInfo("totalPages", totalPages);
	    }

	    /**
	     * 新增管理员
	     * @param admin 新增的管理员信息
	     * @return
	     */
	    @RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
	    @ResponseBody
	    public JsonMsg addAdmin(Admin admin){
	        int res = adminService.addAdmin(admin);
	        if (res == 1){
	            return JsonMsg.success();
	        }else {
	            return JsonMsg.fail();
	        }
	    }

	    /**
	     * 根据id查询管理员信息
	     * @param adminId
	     * @return
	     */
	    @RequestMapping(value = "/getAdminById/{adminId}", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getAdminById(@PathVariable("adminId") Integer adminId){
	    	Admin admin = adminService.getAdminById(adminId);
	        if (admin != null){
	            return JsonMsg.success().addInfo("admin", admin);
	        }else {
	            return JsonMsg.fail();
	        }

	    }
	    

	    /**
	     * 对登录页面输入的用户名和密码做简单的判断
	     * @param request
	     * @return
	     */
	    @RequestMapping(value = "/dologin", method = RequestMethod.POST)
	    @ResponseBody
	    public JsonMsg dologin(HttpServletRequest request){
	        String adminName = request.getParameter("adminname");
	        String password = request.getParameter("password");
	        Admin admin =  adminService.getAdminByName(adminName);
	        if (admin == null){
	            return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
	        }
	        else if(!password.equals(admin.getAdminPassword())){
	            return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
	        }//返回JSON数据
	        else {
	        	request.getSession().setAttribute("adminName", adminName);
	        	return JsonMsg.success();
	        	
	        }
	        
	    }
	    /**
	     * 根据name查询管理员信息
	     * @param adminId
	     * @return
	     */
	    @RequestMapping(value = "/getAdmin", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getAdmin(HttpSession httpSession){
	    	String adminName=(String)httpSession.getAttribute("adminName");
	    	Admin admin=adminService.getAdminByName(adminName);
	        if (admin != null){
	            return JsonMsg.success().addInfo("admin", admin);
	        }else {
	            return JsonMsg.fail();
	        }

	    }
	    /**
	     * 查询
	     * @param pageNo 查询指定页码包含的数据
	     * @return
	     */
	    @RequestMapping(value = "/getAdminList", method = RequestMethod.GET)
	    public ModelAndView getAdmin(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
	        ModelAndView mv = new ModelAndView("adminPage");
	        int limit = 5;
	        // 记录的偏移量(即从第offset行记录开始查询)，
	        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
	        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
	        int offset = (pageNo-1)*limit;
	        //获取指定页数包含的员工信息
	        List<Admin> admins = adminService.getAdminList(offset, limit);
	        //获取总的记录数
	        int totalItems = adminService.getAdminCount();
	        //获取总的页数
	        int temp = totalItems / limit;
	        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
	        //当前页数
	        int curPage = pageNo;

	        //将上述查询结果放到Model中，在JSP页面中可以进行展示
	        mv.addObject("admins", admins)
	                .addObject("totalItems", totalItems)
	                .addObject("totalPages", totalPages)
	                .addObject("curPage", curPage);
	        return mv;
	    }
	
	
	
	

}
