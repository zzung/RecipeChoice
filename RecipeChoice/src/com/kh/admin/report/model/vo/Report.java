package com.kh.admin.report.model.vo;

import java.sql.Date;

public class Report {
	
	private int repNo;
	private String repWriterNo;
	private String repTargetNo;
	private String repReason;
	private Date repDate;
	private String status;
	private String BoardType;
	private String repContentNo;
	private int repReply;
	
	public Report() {
		
	}

	public Report(int repNo, String repWriterNo, String repTargetNo, String repReason, Date repDate, String status,
			String boardType, String repContentNo, int repReply) {
		super();
		this.repNo = repNo;
		this.repWriterNo = repWriterNo;
		this.repTargetNo = repTargetNo;
		this.repReason = repReason;
		this.repDate = repDate;
		this.status = status;
		BoardType = boardType;
		this.repContentNo = repContentNo;
		this.repReply = repReply;
	}

	public int getRepNo() {
		return repNo;
	}

	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}

	public String getRepWriterNo() {
		return repWriterNo;
	}

	public void setRepWriterNo(String repWriterNo) {
		this.repWriterNo = repWriterNo;
	}

	public String getRepTargetNo() {
		return repTargetNo;
	}

	public void setRepTargetNo(String repTargetNo) {
		this.repTargetNo = repTargetNo;
	}

	public String getRepReason() {
		return repReason;
	}

	public void setRepReason(String repReason) {
		this.repReason = repReason;
	}

	public Date getRepDate() {
		return repDate;
	}

	public void setRepDate(Date repDate) {
		this.repDate = repDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBoardType() {
		return BoardType;
	}

	public void setBoardType(String boardType) {
		BoardType = boardType;
	}

	public String getRepContentNo() {
		return repContentNo;
	}

	public void setRepContentNo(String repContentNo) {
		this.repContentNo = repContentNo;
	}

	public int getRepReply() {
		return repReply;
	}

	public void setRepReply(int repReply) {
		this.repReply = repReply;
	}

	@Override
	public String toString() {
		return "Report [repNo=" + repNo + ", repWriterNo=" + repWriterNo + ", repTargetNo=" + repTargetNo
				+ ", repReason=" + repReason + ", repDate=" + repDate + ", status=" + status + ", BoardType="
				+ BoardType + ", repContentNo=" + repContentNo + ", repReply=" + repReply + "]";
	}
	
	
}
