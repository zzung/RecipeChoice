package com.kh.user.board.model.vo;

import java.sql.Date;

public class Report {

	private int reportNo;
	private int reporterNo;
	private int reportedMemNo;
	private String reason;
	private Date reportDate;
	private int boardType;
	private int bno;
	private String replyNo;
	private String status;

	public Report() {

	}

	public Report(int reportNo, int reporterNo, int reportedMemNo, String reason, Date reportDate, int boardType,
			int bno, String replyNo, String status) {
		super();
		this.reportNo = reportNo;
		this.reporterNo = reporterNo;
		this.reportedMemNo = reportedMemNo;
		this.reason = reason;
		this.reportDate = reportDate;
		this.boardType = boardType;
		this.bno = bno;
		this.replyNo = replyNo;
		this.status = status;
	}

	public Report(int reporterNo, int reportedMemNo, String reason, int boardType, int bno, String replyNoTmp) {
		super();
		this.reporterNo = reporterNo;
		this.reportedMemNo = reportedMemNo;
		this.reason = reason;
		this.boardType = boardType;
		this.bno = bno;
		this.replyNo = replyNoTmp;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReporterNo() {
		return reporterNo;
	}

	public void setReporterNo(int reporterNo) {
		this.reporterNo = reporterNo;
	}

	public int getReportedMemNo() {
		return reportedMemNo;
	}

	public void setReportedMemNo(int reportedMemNo) {
		this.reportedMemNo = reportedMemNo;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(String replyNo) {
		this.replyNo = replyNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
