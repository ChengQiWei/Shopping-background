package com.hrms.service;


import com.hrms.bean.Kind;
import com.hrms.mapper.KindMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author ChengQiwei.nomico
 * @date 2020/4/23.
 */
@Service
public class KindService {

	@Autowired
    KindMapper kindMapper;

    public int deleteKindById(Integer kindId){
        return kindMapper.deleteKindById(kindId);
    }
    public int updateKindById(Integer kindId, Kind kind){
        return kindMapper.updateKindById(kindId, kind);
    }
    public int addKind(Kind kind){
        return kindMapper.insertKind(kind);
    }
    public int getKindCount(){
        return kindMapper.countKinds();
    }
    public List<Kind> getKindList(Integer offset, Integer limit){
        return kindMapper.selectKindsByLimitAndOffset(offset, limit);
    };
    public Kind getKindById(Integer kindId){
        return kindMapper.selectOneById(kindId);
    }
    public Kind getKindByName(String kindName){
        return kindMapper.selectOneByName(kindName);
    }


    public List<Kind> getKindName(){
        return kindMapper.selectKindList();
    }
	
}
