package com.hrms.mapper;


import com.hrms.bean.Goods;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author Chengqiwei.nomico
 * @date 2020/4/23.
 */

public interface GoodsMapper {

	String TABLE_NAME = "tbl_goods";
    String INSERT_FIELDS = "goods_name, goods_brand, goods_place, goods_price ,goods_abstract,goods_kind,goods_sort,goods_adddate,goods_image";
    String SELECT_FIELDS = "goods_id, " + INSERT_FIELDS;
    
    /**
     * ================================= 删除 ============================================
     */
    @Delete({"DELETE FROM", TABLE_NAME, "WHERE goods_id = #{goId}"})
    int deleteOneById(@Param("goId") Integer goId);
    /**
     * ================================= 修改 ============================================
     */
    int updateOneById(@Param("goId") Integer goId,
                      @Param("goods") Goods goods);
    /**
     * =================================新增============================================
     */
    @Insert({"INSERT INTO", TABLE_NAME, "(",INSERT_FIELDS,") " +
                    "VALUES(#{goName}, " +
                    "#{goBrand}, " +
                    "#{goPlace}, " +
                    "#{goPrice}, " +
                    "#{goAbstract}, " +
                    "#{goKind}, " +
                    "#{goSort}, " +
                     "#{goAdddate}, " +
                    "#{goImage})"})
    int insertOne(Goods goods);
    
    /**
     * =================================查询============================================
     */
    Goods selectOneGoById(@Param("goId") int goId);
    Goods selectOneGoByName(@Param("goName") String goName);
    //查询带有种类信息的Employee
    Goods selectWithKindById(@Param("goId") Integer goId);
    //大范围的查询带有种类信息的Employee
    List<Goods> selectByAny(@Param("goAny") String goAny);
    
    /**
     * 分页查询
     * @param limit 返回记录最大行数
     * @param offset 返回记录行的偏移量
     * @return 如offset=10，limit=5的时候，就会从数据库第11行记录开始返回5条查询结果，即范围从(offset+1)---(offset+limit)
     */
    List<Goods> selectByLimitAndOffset(@Param("offset") Integer offset,
                                          @Param("limit") Integer limit,
                                          @Param("goAny") String goAny);

    /**
     * 查询总记录数
     * @return
     */
   // @Select({"select count(*) from", TABLE_NAME})
    int countGoodss(@Param("goAny") String goAny);
}
