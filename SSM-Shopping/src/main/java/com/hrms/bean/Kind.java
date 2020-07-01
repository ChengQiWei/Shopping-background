package com.hrms.bean;

/**
 * @author GenshenWang.nomico
 * @date 2020/4/15.
 */
public class Kind {
	private Integer kindId;//种类标号
	private String kindName;//种类名字
	public Integer getKindId() {
		return kindId;
	}
	public void setKindId(Integer kindId) {
		this.kindId = kindId;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	
	@Override
    public String toString() {
        return "Kind{" +
                "kindId=" + kindId +
                ", kindName=" + kindName +
                '}';
    }

    public Kind() {
    }
    
    public Kind(Integer kindId,String kindName) {
    	this.kindId = kindId;
    	this.kindName = kindName;

    }

}
