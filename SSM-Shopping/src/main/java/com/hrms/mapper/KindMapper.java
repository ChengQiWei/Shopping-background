package com.hrms.mapper;




import com.hrms.bean.Kind;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/23.
 */
public interface KindMapper {
	
	String TABLE_NAME = "tbl_kind";
    String INSERT_FIELDS = "kind_name";
    String SELECT_FIELDS = "kind_id as 'kindId', " +
            "kind_name as 'kindName'";
    
    /**
     * =================================删除============================================
     */
    @Delete({"DELETE FROM", TABLE_NAME, "WHERE kind_id=#{kindId}"})
    int deleteKindById(@Param("kindId") Integer kindId);

    /**
     * =================================更改============================================
     */
    int updateKindById(@Param("kindId") Integer kindId,
                       @Param("kind") Kind kind);

    /**
     * =================================新增============================================
     */
    @Insert({"INSERT INTO",TABLE_NAME, "(", INSERT_FIELDS ,") " +
            "VALUES(#{kind.kindName})" })
    int insertKind(@Param("kind") Kind kind);

    /**
     * =================================查询============================================
     */
    @Select({"SELECT", SELECT_FIELDS, "FROM", TABLE_NAME, "WHERE kind_id=#{kindId}" })
    Kind selectOneById(@Param("kindId") Integer kindId);
    @Select({"SELECT", SELECT_FIELDS, "FROM", TABLE_NAME, "WHERE kind_name=#{kindName}" })
    Kind selectOneByName(@Param("kindName") String kindName);
    @Select({"SELECT", SELECT_FIELDS, "FROM", TABLE_NAME})
    List<Kind> selectKindList();

    List<Kind> selectKindsByLimitAndOffset(@Param("offset") Integer offset,
                                                 @Param("limit") Integer limit);

    @Select({"SELECT COUNT(kind_id) FROM", TABLE_NAME,
            "WHERE kindName = #{kindName}"})
    int checkKindsExistsByName(@Param("kindName") String kindName);

    @Select({"SELECT COUNT(*) FROM", TABLE_NAME})
    int countKinds();
	
	
	
	
	
	

}
