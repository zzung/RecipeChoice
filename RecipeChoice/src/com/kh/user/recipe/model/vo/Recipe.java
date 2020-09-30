package com.kh.user.recipe.model.vo;



import java.sql.Date;
public class Recipe {
	
	private int rcpNo; 
	private int userNo; 
	private String memName;
	private String rcpTitle; 
	private String rcpDishType;
	private String rcpTag;
	private int rcpTime;
	private String rcpContent;
	private String rcpPic;
	private Date createDate;
	private int count;
	private int scrapCount;
	private String status;
	private String rcpType;
	
	
	public Recipe() {}

	public Recipe(int rcpNo, int userNo, String memName, String rcpTitle, String rcpDishType, String rcpTag,
			int rcpTime, String rcpContent, String rcpPic, Date createDate, int count, int scrapCount, String status,
			String rcpType) {
		super();
		this.rcpNo = rcpNo;
		this.userNo = userNo;
		this.memName = memName;
		this.rcpTitle = rcpTitle;
		this.rcpDishType = rcpDishType;
		this.rcpTag = rcpTag;
		this.rcpTime = rcpTime;
		this.rcpContent = rcpContent;
		this.rcpPic = rcpPic;
		this.createDate = createDate;
		this.count = count;
		this.scrapCount = scrapCount;
		this.status = status;
		this.rcpType = rcpType;
	}


	public Recipe(int rcpNo, String memName, String rcpTitle, String rcpContent, String rcpPic) {
		super();
		this.rcpNo = rcpNo;
		this.memName = memName;
		this.rcpTitle = rcpTitle;
		this.rcpContent = rcpContent;
		this.rcpPic = rcpPic;
	}

	public Recipe(int rcpNo, int userNo, String memName, String rcpTitle, String rcpDishType, String rcpTag,
			int rcpTime, String rcpContent, String rcpPic, int count, int scrapCount) {
		super();
		this.rcpNo = rcpNo;
		this.userNo = userNo;
		this.memName = memName;
		this.rcpTitle = rcpTitle;
		this.rcpDishType = rcpDishType;
		this.rcpTag = rcpTag;
		this.rcpTime = rcpTime;
		this.rcpContent = rcpContent;
		this.rcpPic = rcpPic;
		this.count = count;
		this.scrapCount = scrapCount;
	}

	public int getRcpNo() {
		return rcpNo;
	}

	public void setRcpNo(int rcpNo) {
		this.rcpNo = rcpNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getRcpTitle() {
		return rcpTitle;
	}

	public void setRcpTitle(String rcpTitle) {
		this.rcpTitle = rcpTitle;
	}

	public String getRcpDishType() {
		return rcpDishType;
	}

	public void setRcpDishType(String rcpDishType) {
		this.rcpDishType = rcpDishType;
	}

	public String getRcpTag() {
		return rcpTag;
	}

	public void setRcpTag(String rcpTag) {
		this.rcpTag = rcpTag;
	}

	public int getRcpTime() {
		return rcpTime;
	}

	public void setRcpTime(int rcpTime) {
		this.rcpTime = rcpTime;
	}

	public String getRcpContent() {
		return rcpContent;
	}

	public void setRcpContent(String rcpContent) {
		this.rcpContent = rcpContent;
	}

	public String getRcpPic() {
		return rcpPic;
	}

	public void setRcpPic(String rcpPic) {
		this.rcpPic = rcpPic;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getScrapCount() {
		return scrapCount;
	}

	public void setScrapCount(int scrapCount) {
		this.scrapCount = scrapCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRcpType() {
		return rcpType;
	}

	public void setRcpType(String rcpType) {
		this.rcpType = rcpType;
	}

	
}
	