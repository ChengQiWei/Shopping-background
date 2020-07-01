package com.hrms.service;


import com.hrms.bean.Goods;
import com.hrms.mapper.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @author ChengQiwei.nomico
 * @date 2020/4/23.
 */
@Service
public class GoodsService {
	
	@Autowired
    GoodsMapper goodsMapper;

    public int getGoCount(String goAny ){//计算商品总数
        return goodsMapper.countGoodss(goAny);
    }
    public List<Goods> getGoList(Integer offser, Integer limit,String goAny){//输出商品列表
        return goodsMapper.selectByLimitAndOffset(offser, limit,goAny);
    }
    public List<Goods> getGoAnyList(String goAny){//输出商品列表
        return goodsMapper.selectByAny(goAny);
    }
    public Goods getGoById(Integer goId){//通过ID搜索商品
        return goodsMapper.selectOneGoById(goId);
    }
    public Goods getGoByName(String goName){return goodsMapper.selectOneGoByName(goName);};//通过名字搜索商品
    
    public int updateGoById(MultipartFile file,Integer goId, Goods goods,ModelMap map) throws IllegalStateException, IOException{
    	// 保存图片的路径，图片上传成功后，将路径保存到数据库
    			String filePath = "D:\\SSM_HRMS-master\\upload";
    			// 获取原始图片的扩展名
    			String originalFilename = file.getOriginalFilename();
    			// 生成文件新的名字
    			String newFileName = UUID.randomUUID() + originalFilename;
    			// 封装上传文件位置的全路径
    			File targetFile = new File(filePath, newFileName);
    			file.transferTo(targetFile);
    	
    			// 保存到数据库
    			goods.setGoImage(newFileName);
    	return goodsMapper.updateOneById(goId, goods);
    	}//更新商品
    public int deleteGoById(Integer goId){//删除商品
        return goodsMapper.deleteOneById(goId);
    }
    public int addGo(Goods goods){//添加商品
        return goodsMapper.insertOne(goods);
    }
   
	
	
	
}
