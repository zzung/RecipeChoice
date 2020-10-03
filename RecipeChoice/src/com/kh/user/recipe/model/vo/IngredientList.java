package com.kh.user.recipe.model.vo;

public class IngredientList {
	
	private int ingNo;
	private int rcpNo;
	private String ingDish;
	private String ingMetering; 
	
	public IngredientList() {}

	public IngredientList(int ingNo, int rcpNo, String ingDish, String ingMetering) {
		super();
		this.ingNo = ingNo;
		this.rcpNo = rcpNo;
		this.ingDish = ingDish;
		this.ingMetering = ingMetering;
	}

	public int getIngNo() {
		return ingNo;
	}

	public void setIngNo(int ingNo) {
		this.ingNo = ingNo;
	}

	public int getRcpNo() {
		return rcpNo;
	}

	public void setRcpNo(int rcpNo) {
		this.rcpNo = rcpNo;
	}

	public String getIngDish() {
		return ingDish;
	}

	public void setIngDish(String ingDish) {
		this.ingDish = ingDish;
	}

	public String getIngMetering() {
		return ingMetering;
	}

	public void setIngMetering(String ingMetering) {
		this.ingMetering = ingMetering;
	}

	@Override
	public String toString() {
		return "IngredientList [ingNo=" + ingNo + ", rcpNo=" + rcpNo + ", ingDish=" + ingDish + ", ingMetering="
				+ ingMetering + "]";
	}
	
	
	
}
