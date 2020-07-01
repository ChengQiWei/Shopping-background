package com.hrms.mapper;


import com.hrms.bean.Sort;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface SortMapper {
	
	 String TABLE_NAME = "tbl_sort";
	    String INSERT_FIELDS = "sort_name, sort_kind";
	    String SELECT_FIELDS = "sort_id as 'sortId', " +
	    		"sort_name as 'sortName', " +
	            "sort_kind as 'sortKind'";

	    /**
	     * ================================= 删除 ============================================
	     */
	    @Delete({"DELETE FROM", TABLE_NAME, "WHERE sort_id = #{sortId}"})
	    int deleteOneById(@Param("sortId") Integer sortId);
	    /**
	     * ================================= 修改 ============================================
	     */
	    int updateOneById(@Param("sortId") Integer sortId,
	                      @Param("sort") Sort sort);
	    /**
	     * =================================新增============================================
	     */
	    @Insert({"INSERT INTO", TABLE_NAME, "(",INSERT_FIELDS,") " +
	                    "VALUES(#{sortName}, " +
	                    "#{sortKind})"})
	    int insertOne(Sort sort);

	    /**
	     * =================================查询============================================
	     */
	    Sort selectOneById(@Param("sortId") int sortId);
	    //查询带有部门信息的Employee
	    Sort selectWithKindById(@Param("sortId") Integer sortId);
	    @Select({"SELECT", SELECT_FIELDS, "FROM", TABLE_NAME})
	    List<Sort> selectSortList();

	    /**
	     * 分页查询
	     * @param limit 返回记录最大行数
	     * @param offset 返回记录行的偏移量
	     * @return 如offset=10，limit=5的时候，就会从数据库第11行记录开始返回5条查询结果，即范围从(offset+1)---(offset+limit)
	     */
	    List<Sort> selectByLimitAndOffset(@Param("offset") Integer offset,
	                                          @Param("limit") Integer limit);

	    /**
	     * 查询总记录数
	     * @return
	     */
	    @Select({"select count(*) from", TABLE_NAME})
	    int countSorts();

	
	
	
	
	

}
