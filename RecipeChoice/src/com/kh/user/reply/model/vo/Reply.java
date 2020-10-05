package com.kh.user.reply.model.vo;

public class Reply {
	
	private int boardReplyNo;		// 댓글의 번호
	private int userNo;				// 회원 번호
	private String memName;			// 회원 닉네임
	private String memPic;			// 프로필 경로
	private int bno;				// 게시글번호
	private String replyContent;	// 댓글 내용
	private String createDate;		// 댓글 작성일자
	private String status;			// 댓글 상태
	private String boardType;		// 게시판 유형
	
	public Reply() {}

	public Reply(int boardReplyNo, int userNo, String memName, String memPic, int bno, String replyContent,
			String createDate, String status, String boardType) {
		super();
		this.boardReplyNo = boardReplyNo;
		this.userNo = userNo;
		this.memName = memName;
		this.memPic = memPic;
		this.bno = bno;
		this.replyContent = replyContent;
		this.createDate = createDate;
		this.status = status;
		this.boardType = boardType;
	}

	public Reply(int boardReplyNo, int userNo, String memName, String memPic, int bno, String replyContent,
			String createDate) {
		super();
		this.boardReplyNo = boardReplyNo;
		this.userNo = userNo;
		this.memName = memName;
		this.memPic = memPic;
		this.bno = bno;
		this.replyContent = replyContent;
		this.createDate = createDate;
	}

	public Reply(int boardReplyNo, String memName, String replyContent, String createDate) {
		super();
		this.boardReplyNo = boardReplyNo;
		this.memName = memName;
		this.replyContent = replyContent;
		this.createDate = createDate;
	}

	public int getBoardReplyNo() {
		return boardReplyNo;
	}

	public void setBoardReplyNo(int boardReplyNo) {
		this.boardReplyNo = boardReplyNo;
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

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	
	public String getMemPic() {
		return memPic;
	}

	public void setMemPic(String memPic) {
		this.memPic = memPic;
	}

	@Override
	public String toString() {
		return "Reply [boardReplyNo=" + boardReplyNo + ", userNo=" + userNo + ", memName=" + memName + ", bno=" + bno
				+ ", replyContent=" + replyContent + ", createDate=" + createDate + ", status=" + status
				+ ", boardType=" + boardType + "]";
	}
	
}
