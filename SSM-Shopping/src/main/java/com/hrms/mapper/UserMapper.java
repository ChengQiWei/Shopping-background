package com.hrms.mapper;

import com.hrms.bean.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author GenshenWang.nomico
 * @date 2020/4/20.
 */
public interface UserMapper {
	
	    String TABLE_NAME = "tbl_user";
	    String INSERT_FIELDS = "user_name, user_password, gender, user_phone ,user_address,user_city,user_email,user_postcode,user_lastdate,user_payment";
	    String SELECT_FIELDS = "user_id, " + INSERT_FIELDS;
	    
	    /**
	     * ================================= 删除 ============================================
	     */
	    @Delete({"DELETE FROM", TABLE_NAME, "WHERE user_id = #{userId}"})
	    int deleteOneById(@Param("userId") Integer userId);
	    /**
	     * ================================= 修改 ============================================
	     */
	    int updateOneById(@Param("userId") Integer userId,
	                      @Param("user") User user);
	    /**
	     * =================================新增============================================
	     */
	    @Insert({"INSERT INTO", TABLE_NAME, "(",INSERT_FIELDS,") " +
	                    "VALUES(#{userName}, " +
	                    "#{userPassword}, " +
	                    "#{gender}, " +
	                    "#{userPhone}, " +
	                    "#{userAddress}, " +
	                    "#{city}, " +
                         "#{email}, " +
                         "#{userPostcode}, " +
                         "#{userLastdate}, " +
	                    "#{payment})"})
	    int insertOne(User user);
	    
	    /**
	     * =================================查询============================================
	     */
	    User selectOneUserById(@Param("userId") int userId);
	    User selectOneUserByName(@Param("userName") String userName);
	    
	    /**
	     * 分页查询
	     * @param limit 返回记录最大行数
	     * @param offset 返回记录行的偏移量
	     * @return 如offset=10，limit=5的时候，就会从数据库第11行记录开始返回5条查询结果，即范围从(offset+1)---(offset+limit)
	     */
	    List<User> selectUserByLimitAndOffset(@Param("offset") Integer offset,
	                                          @Param("limit") Integer limit);

	    /**
	     * 查询总记录数
	     * @return
	     */
	    @Select({"select count(*) from", TABLE_NAME})
	    int countUsers();

}
