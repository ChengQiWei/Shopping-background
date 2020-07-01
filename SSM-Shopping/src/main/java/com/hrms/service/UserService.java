package com.hrms.service;


import com.hrms.bean.User;
import com.hrms.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/20.
 */
@Service
public class UserService {

	 @Autowired
	    UserMapper userMapper;

	    public int getUserCount(){
	        return userMapper.countUsers();
	    }//获取用户总数
	    public List<User> getUserList(Integer offser, Integer limit){
	        return userMapper.selectUserByLimitAndOffset (offser, limit);
	    }//获取所有的用户信息
	    public User getUserById(Integer userId){
	        return userMapper.selectOneUserById(userId);
	    }//通过ID号搜索用户
	    public User getUserByName(String userName){return userMapper.selectOneUserByName(userName);};//通过名字搜索用户信息
	    public int updateUserById(Integer userId, User user){return userMapper.updateOneById(userId, user);}//更新用户信息
	    public int deleteUserById(Integer userId){
	        return userMapper.deleteOneById(userId);
	    }//通过ID号删除用户信息
	    public int addUser(User user){
	        return userMapper.insertOne(user);
	    }//添加用户
	
	
	
	
	
	
}
