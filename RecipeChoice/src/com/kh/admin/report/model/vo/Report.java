package com.kh.admin.report.model.vo;

import java.sql.Date;

public class Report {
	
	private String boardTitle;
	private String rcpTitle;
	private int repNo;
	private String writer;
	private String target;
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

	public Report(String boardTitle, String rcpTitle, int repNo, String writer, String target, String repWriterNo,
			String repTargetNo, String repReason, Date repDate, String status, String boardType, String repContentNo,
			int repReply) {
		super();
		this.boardTitle = boardTitle;
		this.rcpTitle = rcpTitle;
		this.repNo = repNo;
		this.writer = writer;
		this.target = target;
		this.repWriterNo = repWriterNo;
		this.repTargetNo = repTargetNo;
		this.repReason = repReason;
		this.repDate = repDate;
		this.status = status;
		this.BoardType = boardType;
		this.repContentNo = repContentNo;
		this.repReply = repReply;
	}
	
	public Report(String boardTitle, String rcpTitle, int repNo, String writer, String target, String repWriterNo,
			String repTargetNo, String repReason, Date repDate, String boardType, String repContentNo) {
		this.boardTitle = boardTitle;
		this.rcpTitle = rcpTitle;
		this.repNo = repNo;
		this.writer = writer;
		this.target = target;
		this.repWriterNo = repWriterNo;
		this.repTargetNo = repTargetNo;
		this.repReason = repReason;
		this.repDate = repDate;
		this.BoardType = boardType;
		this.repContentNo = repContentNo;

	
	}


	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getRcpTitle() {
		return rcpTitle;
	}

	public void setRcpTitle(String rcpTitle) {
		this.rcpTitle = rcpTitle;
	}

	public int getRepNo() {
		return repNo;
	}

	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
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
		return "Report [boardTitle=" + boardTitle + ", rcpTitle=" + rcpTitle + ", repNo=" + repNo + ", writer=" + writer
				+ ", target=" + target + ", repWriterNo=" + repWriterNo + ", repTargetNo=" + repTargetNo
				+ ", repReason=" + repReason + ", repDate=" + repDate + ", status=" + status + ", BoardType="
				+ BoardType + ", repContentNo=" + repContentNo + ", repReply=" + repReply + "]";
	}
	
	


}

	
	
	