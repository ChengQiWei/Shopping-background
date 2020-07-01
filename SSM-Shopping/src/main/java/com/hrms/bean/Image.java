package com.hrms.bean;

/**
 * @author GenshenWang.nomico
 * @date 2020/4/15.
 */
public class Image {
	private Integer imageId;//图片标号
	private String imageName;//图片名字
	private String imageUrl;//图片地址
	
	public Integer getImageId() {
		return imageId;
	}
	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
    public String toString() {
        return "Image{" +
                "imageId=" + imageId +
                 ", imageName='" + imageName + '\'' +
                ", imageUrl=" + imageUrl +
                '}';
    }

    public Image() {
    }
    
    public Image(Integer imageId,String imageName,String imageUrl) {
    	this.imageId = imageId;
    	this.imageName = imageName;
    	this.imageUrl = imageUrl;
   
    }
	
	
	
	
	
}
