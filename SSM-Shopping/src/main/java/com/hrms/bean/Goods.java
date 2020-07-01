package com.hrms.bean;


/**
 * @author GenshenWang.nomico
 * @date 2020/4/15.
 */

public class Goods {
	private Integer goId;//标号
	private String goName;//商品名字
	private String goBrand;//商品品牌
	private String goPlace;//商品产地
	private float goPrice;//商品价格
	private String goAbstract;//商品详细描述
	private Integer goKind;//商品种类
	private Integer goSort;//商品种类
	private String goAdddate;//商品上架时间
	private String goImage;//商品图片
	private Integer goNum;//商品数量
	
   

	private Kind kind;
    private Sort sort;
	
	public Kind getKind() {
		return kind;
	}
	public void setKind(Kind kind) {
		this.kind = kind;
	}
	public Integer getGoId() {
		return goId;
	}
	public void setGoId(Integer goId) {
		this.goId = goId;
	}
	public String getGoName() {
		return goName;
	}
	public void setGoName(String goName) {
		this.goName = goName;
	}
	public String getGoBrand() {
		return goBrand;
	}
	public void setGoBrand(String goBrand) {
		this.goBrand = goBrand;
	}
	public String getGoPlace() {
		return goPlace;
	}
	public void setGoPlace(String goPlace) {
		this.goPlace = goPlace;
	}
	public float getGoPrice() {
		return goPrice;
	}
	public void setGoPrice(float goPrice) {
		this.goPrice = goPrice;
	}
	public String getGoAbstract() {
		return goAbstract;
	}
	public void setGoAbstract(String goAbstract) {
		this.goAbstract = goAbstract;
	}
	public Integer getGoKind() {
		return goKind;
	}
	public void setGoKind(Integer goKind ) {
		this.goKind = goKind;
	}
	public String getGoAdddate() {
		return goAdddate;
	}
	public void setGoAdddate(String goAdddate) {
		this.goAdddate = goAdddate;
	}
	public String getGoImage() {
		return goImage;
	}
	public void setGoImage(String goImage) {
		this.goImage = goImage;
	}
	public Integer getGoSort() {
		return goSort;
	}
	public void setGoSort(Integer goSort) {
		this.goSort = goSort;
	}
	public Sort getSort() {
		return sort;
	}
	public void setSort(Sort sort) {
		this.sort = sort;
	}
	 public Integer getGoNum() {
			return goNum;
		}
		public void setGoNum(Integer goNum) {
			this.goNum = goNum;
		}
	 @Override
	    public String toString() {
	        return "Goods{" +
	                "goId=" + goId +
	                ", goName='" + goName + '\'' +
	                ", goBrand='" + goBrand + '\'' +
	                ", goPrice='" + goPrice + '\'' +
	                ", goPlace=" + goPlace + '\'' +
	                ", goAbstract=" + goAbstract + '\'' +
	                ", goKind=" + goKind + '\'' +
	                ", goSort=" + goSort + '\'' +
	                ", goAdddate=" + goAdddate + '\'' +
	                ", goImage=" + goImage + '\''+
	                ", goNum=" + goNum + '\''+
	                ", kind=" + kind +
	                '}';
	    }
	 
	    public Goods() {
	    	
	    }
	    
	    public Goods(Integer goId,String goName,String goBrand,float goPrice,String goPlace,String goAbstract,Integer goKind, Integer goSort,String goAdddate,String goImage,Integer goNum) {
	    	this.goId = goId;
	    	this.goName = goName;
	    	this.goBrand = goBrand;
	    	this.goPlace = goPlace;
	    	this.goPrice = goPrice;
	    	this.goAbstract = goAbstract;
	    	this.goKind = goKind;
	    	this.goSort = goSort;
	    	this.goAdddate = goAdddate;
	    	this.goImage = goImage;
	    	this.goNum = goNum;
	    	
	    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
