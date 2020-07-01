package com.hrms.mapper;

import com.hrms.bean.Cart;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/28.
 */
public interface CartMapper {

	 String TABLE_NAME = "tbl_cart";
	    String INSERT_FIELDS = "cart_user, cart_price, cart_number, cart_abstract";
	    String SELECT_FIELDS = "cart_id, " + INSERT_FIELDS;

	    /**
	     * ================================= 删除 ============================================
	     */
	    @Delete({"DELETE FROM", TABLE_NAME, "WHERE cart_id = #{cartId}"})
	    int deleteOneById(@Param("cartId") Integer cartId);
	    
	    @Delete({"DELETE FROM", TABLE_NAME})
	    int deleteAll();
	    /**
	     * ================================= 修改 ============================================
	     * 仅修改价格，数量，详细部分
	     */
	    int updateOneById(@Param("cartId") Integer cartId,
	                      @Param("cart") Cart cart);
	    
	    /**
	     * =================================查询============================================
	     * 修改时用到
	     */
	    Cart selectOneById(@Param("cartId") int cartId);
	    /**
	     * 分页查询
	     * @param limit 返回记录最大行数
	     * @param offset 返回记录行的偏移量
	     * @return 如offset=10，limit=5的时候，就会从数据库第11行记录开始返回5条查询结果，即范围从(offset+1)---(offset+limit)
	     */
	    List<Cart> selectByLimitAndOffset(@Param("offset") Integer offset,
	                                          @Param("limit") Integer limit);

	    /**
	     * 查询总记录数
	     * @return
	     */
	    @Select({"select count(*) from", TABLE_NAME})
	    int countCarts();
}
