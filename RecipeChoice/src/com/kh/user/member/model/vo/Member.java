package com.kh.user.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;
	private String memId;
	private String memPwd;
	private String memName; 	// 닉네임
	private String email;		// 이메일
	private String memPic;		// 마이페이지 사진
	private Date enrollDate;	// 회원가입일
	private int memReportCount; // 신고받은횟수
	private String status;		// 상태값(y/n/b) 탈퇴, 정상
	private int boardCount;		// 올린 게시글 수
	
	public Member() {}
	

	public Member(int userNo, String memId, String memPwd, String memName, String email, String memPic, Date enrollDate,
			String status) {
		super();
		this.userNo = userNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.memPic = memPic;
		this.enrollDate = enrollDate;
		this.status = status;
	}


	public Member(String memId, String memPwd, String memName, String email, String memPic, Date enrollDate) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.memPic = memPic;
		this.enrollDate = enrollDate;
	}
	
	public Member(String memId, String memPwd, String memName, String email, String memPic) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.memPic = memPic;
	}


	public Member(String memId, String memPwd, String memName, String email) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
	}

	// 이미지 없는 회원 조회
	public Member(String memId, String memPwd, String memName, String email, Date enrollDate) {
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.enrollDate = enrollDate;
	}


	public Member(int userNo, String memId, String memPwd, String memName, String email, Date enrollDate, String status) {
		this.userNo = userNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.enrollDate = enrollDate;
		this.status = status;
	}
	
	public Member(int userNo, String memId, String memPwd, String memName, String email, String memPic, Date enrollDate,
			int memReportCount, String status) {
		super();
		this.userNo = userNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.memPic = memPic;
		this.enrollDate = enrollDate;
		this.memReportCount = memReportCount;
		this.status = status;
	}
	

	public Member(int userNo, String memId, String memPwd, String memName, String email, String memPic, Date enrollDate,
			int memReportCount, String status, int boardCount) {
		super();
		this.userNo = userNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.memPic = memPic;
		this.enrollDate = enrollDate;
		this.memReportCount = memReportCount;
		this.status = status;
		this.boardCount = boardCount;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getMemPic() {
		return memPic;
	}

	public void setMemPic(String memPic) {
		this.memPic = memPic;
	}

	public int getMemReportCount() {
		return memReportCount;
	}

	public void setMemReportCount(int memReportCount) {
		this.memReportCount = memReportCount;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", email=" + email + ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
}
