package com.updateImg.dto;

public class updateImgDto {
	
	private String path;
	private String name;
	
	public updateImgDto(){
		
	}
	public updateImgDto(String path, String name) {
		this.path = path;
		this.name = name;
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
