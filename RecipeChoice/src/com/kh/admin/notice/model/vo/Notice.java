package com.kh.admin.notice.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeNo;			// 공지사항 번호
	private String noticeTitle;		// 공지사항 제목
	private String noticeContent;	// 공지사항 내용
	private String noticeImportant; // 중요 공지사항 여부
	private Date noticeDate;		// 공지사항 작성일
	private String status;			// 상태
	
	public Notice() {}
	
	public Notice(int noticeNo, String noticeTitle, String noticeContent, String noticeImportant, Date noticeDate,
			String status) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeImportant = noticeImportant;
		this.noticeDate = noticeDate;
		this.status = status;
	}
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeImportant() {
		return noticeImportant;
	}
	public void setNoticeImportant(String noticeImportant) {
		this.noticeImportant = noticeImportant;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeImportant=" + noticeImportant + ", noticeDate=" + noticeDate + ", status=" + status + "]";
	}
	
}
