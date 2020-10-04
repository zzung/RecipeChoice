package com.kh.user.recipe.model.vo;

public class Count {

	private int totalCount;
	private String relationPic; 
	
	public Count(){}

	public Count(int totalCount) {
		super();
		this.totalCount = totalCount;
	}
	
	public Count(String relationPic) {
		super();
		this.relationPic = relationPic;
	}

	public String getRelationPic() {
		return relationPic;
	}

	public void setRelationPic(String relationPic) {
		this.relationPic = relationPic;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
}
