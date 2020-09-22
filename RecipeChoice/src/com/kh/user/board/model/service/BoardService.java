package com.kh.user.board.model.service;

import static com.kh.user.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.user.board.model.dao.BoardDao;
import com.kh.user.board.model.vo.Board;
import com.kh.user.board.model.vo.PageInfo;
import com.kh.user.board.model.vo.Reply;

public class BoardService {

	public ArrayList<Board> selectBoardList(int currentPage) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> boardList = new BoardDao().selectBoardList(conn, currentPage);
		
		close(conn);
		
		return boardList;
	}

	public void getMaxPage(PageInfo pi) {
		
		Connection conn = getConnection();
		
		new BoardDao().getMaxPage(conn, pi);
		
		close(conn);
		
	}

	public int insertBoardContent(Board writed) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().insertBoardContent(conn, writed);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollBack(conn);
		}
		
		return result;
	}

	public Board selectBoardDetail(int bno) {
		
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectBoardDetail(conn, bno);
		
		close(conn);
		
		return b;
	}

	public int updateBoardCount(int bno) {

		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoardCount(conn, bno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollBack(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int updateBoardContent(Board update) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().updateBoardContent(conn, update);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollBack(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteBoardContent(int bno) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteBoardContent(conn, bno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollBack(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int replyMaxCount(int bno) {
		
		Connection conn = getConnection();
		
		int replyCount = new BoardDao().replyMaxCount(conn, bno);
		
		close(conn);
		
		return replyCount;
	}

	public ArrayList<Reply> selectReplyList(int bno, int start, int maxReply) {
		
		Connection conn = getConnection();
		
		ArrayList<Reply> replyList = new BoardDao().selectReplyList(conn, bno, start, maxReply);
		
		close(conn);
		
		return replyList;
	}

	public int replyTopNo(int bno) {
		Connection conn = getConnection();
		
		int topReplyNo = new BoardDao().replyTopNo(conn, bno);
		
		close(conn);
		
		return topReplyNo;
	}

}
