package com.kh.user.recipe.model.vo;

public class Cook {
	
	private int cookNo;
	private int rcpNo;
	private String cookContent;
	private int cookOrder;
	private String cookPic;	
	
	public Cook() {}

	public Cook(int cookNo, int rcpNo, String cookContent, int cookOrder, String cookPic) {
		super();
		this.cookNo = cookNo;
		this.rcpNo = rcpNo;
		this.cookContent = cookContent;
		this.cookOrder = cookOrder;
		this.cookPic = cookPic;
	}

	public int getCookNo() {
		return cookNo;
	}

	public void setCookNo(int cookNo) {
		this.cookNo = cookNo;
	}

	public int getRcpNo() {
		return rcpNo;
	}

	public void setRcpNo(int rcpNo) {
		this.rcpNo = rcpNo;
	}

	public String getCookContent() {
		return cookContent;
	}

	public void setCookContent(String cookContent) {
		this.cookContent = cookContent;
	}

	public int getCookOrder() {
		return cookOrder;
	}

	public void setCookOrder(int cookOrder) {
		this.cookOrder = cookOrder;
	}

	public String getCookPic() {
		return cookPic;
	}

	public void setCookPic(String cookPic) {
		this.cookPic = cookPic;
	}
	
	
}
