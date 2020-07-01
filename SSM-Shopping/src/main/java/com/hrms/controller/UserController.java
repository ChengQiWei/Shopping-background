package com.hrms.controller;

import com.hrms.bean.User;
import com.hrms.service.UserService;
import com.hrms.util.JsonMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/21.
 */
@Controller
@RequestMapping(value = "/hrms/user")
public class UserController {
	
	 @Autowired
	    UserService userService;

	    /**
	     * 用户删除操作
	     * @param userId
	     * @return
	     */
	    @RequestMapping(value = "/deleteUser/{userId}", method = RequestMethod.DELETE)
	    @ResponseBody
	    public JsonMsg deleteUser(@PathVariable("userId") Integer userId){
	        int res = 0;
	        if (userId > 0){
	            res = userService.deleteUserById(userId);
	        }
	       if (res != 1){
	            return JsonMsg.fail().addInfo("user_del_error", "用户删除异常");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 更改员工信息
	     * @param userId
	     * @param user
	     * @return
	     */
	    @RequestMapping(value ="/updateUser/{userId}", method = RequestMethod.PUT)
	    @ResponseBody
	    public JsonMsg updateUser(@PathVariable("userId") Integer userId,  User user){
	        int res = userService.updateUserById(userId, user);
	        if (res != 1){
	            return JsonMsg.fail().addInfo("user_update_error", "更改异常");
	        }
	        return JsonMsg.success();
	    }

	    /**
	     * 查询输入的员工姓名是否重复
	     * @param userName
	     * @return
	     */
	    @RequestMapping(value = "/checkUserExists", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg checkUserExists(@RequestParam("userName") String userName){
	        //对输入的姓名格式进行验证
	        String regName = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
	        if(!userName.matches(regName)){
	            return JsonMsg.fail().addInfo("name_reg_error", "输入姓名为2-5位中文或6-16位英文和数字组合");
	        }
	        User user = userService.getUserByName(userName);
	        if (user != null){
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
	        int totalItems = userService.getUserCount();
	        //获取总的页数
	        int temp = totalItems / 5;
	        int totalPages = (totalItems % 5 == 0) ? temp : temp+1;
	        return JsonMsg.success().addInfo("totalPages", totalPages);
	    }

	    /**
	     * 新增员工
	     * @param user 新增的员工信息
	     * @return
	     */
	    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
	    @ResponseBody
	    public JsonMsg addUser(User user){
	        int res = userService.addUser(user);
	        if (res == 1){
	            return JsonMsg.success();
	        }else {
	            return JsonMsg.fail();
	        }
	    }

	    /**
	     * 根据id查询员工信息
	     * @param userId
	     * @return
	     */
	    @RequestMapping(value = "/getUserById/{userId}", method = RequestMethod.GET)
	    @ResponseBody
	    public JsonMsg getEmpById(@PathVariable("userId") Integer userId){
	        User user = userService.getUserById(userId);
	        if (user != null){
	            return JsonMsg.success().addInfo("user", user);
	        }else {
	            return JsonMsg.fail();
	        }

	    }
	    /**
	     * 查询
	     * @param pageNo 查询指定页码包含的数据
	     * @return
	     */
	    @RequestMapping(value = "/getUserList", method = RequestMethod.GET)
	    public ModelAndView getUser(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo){
	        ModelAndView mv = new ModelAndView("userPage");
	        int limit = 5;
	        // 记录的偏移量(即从第offset行记录开始查询)，
	        // 如第1页是从第1行(offset=(21-1)*5=0,offset+1=0+1=1)开始查询；
	        // 第2页从第6行(offset=(2-1)*5=5,offset+1=5+1=6)记录开始查询
	        int offset = (pageNo-1)*limit;
	        //获取指定页数包含的员工信息
	        List<User> users = userService.getUserList(offset, limit);
	        //获取总的记录数
	        int totalItems = userService.getUserCount();
	        //获取总的页数
	        int temp = totalItems / limit;
	        int totalPages = (totalItems % limit == 0) ? temp : temp+1;
	        //当前页数
	        int curPage = pageNo;

	        //将上述查询结果放到Model中，在JSP页面中可以进行展示
	        mv.addObject("users", users)
	                .addObject("totalItems", totalItems)
	                .addObject("totalPages", totalPages)
	                .addObject("curPage", curPage);
	        return mv;
	    }

}
