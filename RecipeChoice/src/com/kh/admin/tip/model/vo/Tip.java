package com.kh.admin.tip.model.vo;

import java.sql.Date;

public class Tip {

	private int tipNo;					//재료 손질법 글번호
	private String tipTitle;			//제목
	private String tipInfo;				//간단설명
	private String tipIngredientTag;	//태그
	private String tipContent;			//게시글 내용
	private int tipCount;				//조회수
	private String tipCategory;			//재료손질법(1) / 재료상식(2)
	private String tipPicture;			//꿀팁 썸네일
	private Date createDate;			//작성일
	private String status;				//상태
	
	
	public Tip() {}
	
	public Tip(int tipNo, String tipTitle, String tipInfo, String tipIngredientTag, String tipContent, int tipCount,
			String tipCategory, String tipPicture, Date createDate, String status) {
		super();
		this.tipNo = tipNo;
		this.tipTitle = tipTitle;
		this.tipInfo = tipInfo;
		this.tipIngredientTag = tipIngredientTag;
		this.tipContent = tipContent;
		this.tipCount = tipCount;
		this.tipCategory = tipCategory;
		this.tipPicture = tipPicture;
		this.createDate = createDate;
		this.status = status;
	}


	public int getTipNo() {
		return tipNo;
	}
	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}
	public String getTipTitle() {
		return tipTitle;
	}
	public void setTipTitle(String tipTitle) {
		this.tipTitle = tipTitle;
	}
	public String getTipInfo() {
		return tipInfo;
	}
	public void setTipInfo(String tipInfo) {
		this.tipInfo = tipInfo;
	}
	public String getTipIngredientTag() {
		return tipIngredientTag;
	}
	public void setTipIngredientTag(String tipIngredientTag) {
		this.tipIngredientTag = tipIngredientTag;
	}
	public String getTipContent() {
		return tipContent;
	}
	public void setTipContent(String tipContent) {
		this.tipContent = tipContent;
	}
	public int getTipCount() {
		return tipCount;
	}
	public void setTipCount(int tipCount) {
		this.tipCount = tipCount;
	}
	public String getTipCategory() {
		return tipCategory;
	}
	public void setTipCategory(String tipCategory) {
		this.tipCategory = tipCategory;
	}
	public String getTipPicture() {
		return tipPicture;
	}
	public void setTipPicture(String tipPicture) {
		this.tipPicture = tipPicture;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Tip [tipNo=" + tipNo + ", tipTitle=" + tipTitle + ", tipInfo=" + tipInfo + ", tipIngredientTag="
				+ tipIngredientTag + ", tipContent=" + tipContent + ", tipCount=" + tipCount + ", tipCategory="
				+ tipCategory + ", tipPicture=" + tipPicture + ", createDate=" + createDate + ", status=" + status
				+ "]";
	}
}
