package com.kh.admin.contact.model.vo;

import java.sql.Date;

public class Contact {

	private int conNo;
	private String userNo; //"1" 1 조회시 작성자아이디/작성하기시 로그인한 사용자 회원번호
	private String conType;
	private String conTitle;
	private String conContent;
	private Date conProcessDate;
	private Date conDate;
	private String answer;
	private String status;
	

	public Contact() {
		
	}

	public Contact(int conNo, String userNo, String conType, String conTitle, String conContent, Date conProcessDate,
			Date conDate, String answer, String status) {
		super();
		this.conNo = conNo;
		this.userNo = userNo;
		this.conType = conType;
		this.conTitle = conTitle;
		this.conContent = conContent;
		this.conProcessDate = conProcessDate;
		this.conDate = conDate;
		this.answer = answer;
		this.status = status;
	}
	
	
	
	public Contact(int conNo, String userNo, String conType, String conTitle, Date conDate) {
		super();
		this.conNo = conNo;
		this.userNo = userNo;
		this.conType = conType;
		this.conTitle = conTitle;
		this.conDate = conDate;
	}

	public int getConNo() {
		return conNo;
	}

	public void setConNo(int conNo) {
		this.conNo = conNo;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getConType() {
		return conType;
	}

	public void setConType(String conType) {
		this.conType = conType;
	}

	public String getConTitle() {
		return conTitle;
	}

	public void setConTitle(String conTitle) {
		this.conTitle = conTitle;
	}

	public String getConContent() {
		return conContent;
	}

	public void setConContent(String conContent) {
		this.conContent = conContent;
	}

	public Date getConProcessDate() {
		return conProcessDate;
	}

	public void setConProcessDate(Date conProcessDate) {
		this.conProcessDate = conProcessDate;
	}

	public Date getConDate() {
		return conDate;
	}

	public void setConDate(Date conDate) {
		this.conDate = conDate;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Contact [conNo=" + conNo + ", userNo=" + userNo + ", conType=" + conType + ", conTitle=" + conTitle
				+ ", conContent=" + conContent + ", conProcessDate=" + conProcessDate + ", conDate=" + conDate
				+ ", answer=" + answer + ", status=" + status + "]";
	}
	
	
}
