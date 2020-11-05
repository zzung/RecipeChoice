package com.kh.user.board.model.service;

import static com.kh.user.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.user.board.model.dao.BoardDao;
import com.kh.user.board.model.vo.Board;
import com.kh.user.board.model.vo.PageInfo;
import com.kh.user.board.model.vo.Report;

public class BoardService {

	public ArrayList<Board> selectBoardList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> boardList = new BoardDao().selectBoardList(conn, pi);
		
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

	public int reportInsert(Report report) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().reportInsert(conn, report);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollBack(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	/**
	 * USER가 작성한 글 갯수 가져오기
	 * @return 개수
	 */
	public int selectListCount(String memId) {
		
		Connection conn = getConnection();
		
		int result = new BoardDao().selectListCount(conn,memId);
		 
		close(conn);
		
		return result;
	}
	/**
	 * 내가 작성한 글 가져오기 서비스
	 * @param pi
	 * @return ArrayList
	 */
	public ArrayList<Board> selectMyBoardList(com.kh.user.member.model.vo.PageInfo pi, String memId) {
		Connection conn = getConnection();
		
		ArrayList<Board> myList = new BoardDao().selectMyBoardList(conn, pi, memId);
		
		close(conn);
		return myList;
	}


}
