package com.kh.user.recipe.model.vo;

public class IngredientList {
	
	private int rcpNo2;
	private String ingDish;
	private String ingMetering; 

	public IngredientList(){}

	public IngredientList(int rcpNo2, String ingDish, String ingMetering) {
		super();
		this.rcpNo2 = rcpNo2;
		this.ingDish = ingDish;
		this.ingMetering = ingMetering;
	}

	public int getRcpNo2() {
		return rcpNo2;
	}

	public void setRcpNo2(int rcpNo2) {
		this.rcpNo2 = rcpNo2;
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
	
	
}
