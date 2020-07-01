package com.hrms.service;

import com.hrms.bean.Admin;
import com.hrms.mapper.AdminMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/23.
 */
@Service
public class AdminService {
	@Autowired
    AdminMapper adminMapper;

    public int getAdminCount(){
        return adminMapper.countAdmins();
    }
    public List<Admin> getAdminList(Integer offser, Integer limit){
        return adminMapper.selectByLimitAndOffset(offser, limit);
    }
    public Admin getAdminById(Integer adminId){
        return adminMapper.selectOneById(adminId);
    }
    public Admin getAdminByName(String adminName){return adminMapper.selectOneByName(adminName);};
    public int updateAdminById(Integer adminId, Admin admin){return adminMapper.updateOneById(adminId, admin);}
    public int updateAdminByName(String adminName, Admin admin){return adminMapper.updateOneByName(adminName, admin);}
    public int addAdmin(Admin admin){
        return adminMapper.insertOne(admin);
    }


	
	
	
	
}
