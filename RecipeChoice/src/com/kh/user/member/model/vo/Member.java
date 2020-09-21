package com.kh.user.member.model.vo;

import java.sql.Date;

public class Member {

	private int userNo;
	private String memId;
	private String memPwd;
	private String memName; 	// 닉네임
	private String email;		// 이메일
	private Date enrollDate;		// 회원가입일
	private String status;			// 상태값(y/n) 탈퇴, 정상
	
	public Member() {}
	
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

	public Member(int userNo, String memId, String memPwd, String memName, String email, Date enrollDate,
			String status) {
		super();
		this.userNo = userNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.email = email;
		this.enrollDate = enrollDate;
		this.status = status;
	}


	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", email=" + email + ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
}
