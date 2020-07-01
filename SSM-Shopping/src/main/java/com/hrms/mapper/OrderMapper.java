package com.hrms.mapper;

import com.hrms.bean.Order;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/28.
 */
public interface OrderMapper {
	
	 String TABLE_NAME = "tbl_order";
	    String INSERT_FIELDS = "order_user, order_price, order_abstract, order_rname, order_rphone, order_raddress, order_date";
	    String SELECT_FIELDS = "order_id, " + INSERT_FIELDS;

	    /**
	     * ================================= 删除 ============================================
	     */
	    @Delete({"DELETE FROM", TABLE_NAME, "WHERE order_id = #{orderId}"})
	    int deleteOneById(@Param("orderId") Integer orderId);
	    

	    /**
	     * 分页查询
	     * @param limit 返回记录最大行数
	     * @param offset 返回记录行的偏移量
	     * @return 如offset=10，limit=5的时候，就会从数据库第11行记录开始返回5条查询结果，即范围从(offset+1)---(offset+limit)
	     */
	    List<Order> selectByLimitAndOffset(@Param("offset") Integer offset,
	                                          @Param("limit") Integer limit);

	    /**
	     * 查询总记录数
	     * @return
	     */
	    @Select({"select count(*) from", TABLE_NAME})
	    int countOrders();


}
