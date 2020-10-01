package com.kh.user.board.model.vo;

public class Board {

	private int boardNo;			// 게시판 번호
	private int userNo;				// 유저번호
	private String memId;			// 유저아이디
	private String memName;			// 유저이름
	private String memPic;			// 프로필이미지 경로
	private String boardTitle;		// 게시판 제목
	private String category;		// 카테고리
	private String boardContent;	// 게시판 내용
	private String createDate;		// 작성일
	private int boardCount;			// 조회수
	private String status;			// 상태
	
	public Board() {}

	public Board(int boardNo, int userNo, String memId, String memName, String memPic, String boardTitle,
			String category, String boardContent, String createDate, int boardCount, String status) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.memId = memId;
		this.memName = memName;
		this.memPic = memPic;
		this.boardTitle = boardTitle;
		this.category = category;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.boardCount = boardCount;
		this.status = status;
	}



	public Board(int boardNo, int userNo, String memName, String memPic, String boardTitle, String category,
			String boardContent, String createDate , int boardCount) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.memName = memName;
		this.memPic = memPic;
		this.boardTitle = boardTitle;
		this.category = category;
		this.boardContent = boardContent;
		this.createDate = createDate;
	}

	public Board(int boardNo, int userNo, String memId, String memName, String memPic, String boardTitle,
			String category, String boardContent, String createDate, int boardCount) {
		super();
		this.boardNo = boardNo;
		this.userNo = userNo;
		this.memId = memId;
		this.memName = memName;
		this.memPic = memPic;
		this.boardTitle = boardTitle;
		this.category = category;
		this.boardContent = boardContent;
		this.createDate = createDate;
		this.boardCount = boardCount;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
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
	
}
