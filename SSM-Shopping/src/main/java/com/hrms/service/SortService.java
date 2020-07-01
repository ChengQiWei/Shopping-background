package com.hrms.service;

import com.hrms.bean.Sort;
import com.hrms.mapper.SortMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SortService {

	@Autowired
	SortMapper sortMapper;

    public int getSortCount(){
        return sortMapper.countSorts();
    }
    public List<Sort> getSortList(Integer offser, Integer limit){
        return sortMapper.selectByLimitAndOffset(offser, limit);
    }
    public Sort getSortById(Integer sortId){
        return sortMapper.selectOneById(sortId);
    }
    public int updateSortById(Integer sortId, Sort sort){return sortMapper.updateOneById(sortId, sort);}
    public int deleteSortById(Integer sortId){
        return sortMapper.deleteOneById(sortId);
    }
    public int addSort(Sort sort){
        return sortMapper.insertOne(sort);
    }
    public List<Sort> getSortName(){
        return sortMapper.selectSortList();
    }
	
	
}
