package com.hrms.bean;

public class Sort {
	private Integer sortId;
    private String sortName;
    private Integer sortKind;
    
    

	private Kind kind;

	public Integer getSortId() {
		return sortId;
	}

	public void setSortId(Integer sortId) {
		this.sortId = sortId;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public Integer getSortKind() {
		return sortKind;
	}

	public void setSortKind(Integer sortKind) {
		this.sortKind = sortKind;
	}

	public Kind getKind() {
		return kind;
	}

	public void setKind(Kind kind) {
		this.kind = kind;
	}
	
	
	
	 @Override
	    public String toString() {
	        return "Sort{" +
	                "sortId=" + sortId +
	                ", sortName='" + sortName + '\'' +
	                ", sortKind=" + sortKind + '\'' +
	                ", kind=" + kind +
	                '}';
	    }

	    public Sort() {
	    }
	    public Sort(Integer sortId, String sortName, Integer sortKind) {
	        this.sortId = sortId;
	        this.sortName = sortName;
	        this.sortKind = sortKind;
	    }
	
	
	
	
	
	

}
