package com.hrms.mapper;

import com.hrms.bean.Admin;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/23.
 */
public interface AdminMapper {
	
	String TABLE_NAME = "tbl_admin";
    String INSERT_FIELDS = "admin_name, admin_password";
    String SELECT_FIELDS = "admin_id, " + INSERT_FIELDS;
    
    /**
     * ================================= 修改 ============================================
     */
    int updateOneById(@Param("adminId") Integer adminId,
                      @Param("admin") Admin admin);
    
    int updateOneByName(@Param("adminName") String adminName,
            @Param("admin") Admin admin);
    /**
     * =================================新增============================================
     */
    @Insert({"INSERT INTO", TABLE_NAME, "(",INSERT_FIELDS,") " +
                    "VALUES(#{adminName}, " +
                    "#{adminPassword})"})
    int insertOne(Admin admin);
    
    /**
     * =================================查询============================================
     */
    Admin selectOneById(@Param("adminId") int adminId);
    Admin selectOneByName(@Param("adminName") String adminName);
    
    /**
     * 分页查询
     * @param limit 返回记录最大行数
     * @param offset 返回记录行的偏移量
     * @return 如offset=10，limit=5的时候，就会从数据库第11行记录开始返回5条查询结果，即范围从(offset+1)---(offset+limit)
     */
    List<Admin> selectByLimitAndOffset(@Param("offset") Integer offset,
                                          @Param("limit") Integer limit);

    /**
     * 查询总记录数
     * @return
     */
    @Select({"select count(*) from", TABLE_NAME})
    int countAdmins();
    
    
    
    
    

}
