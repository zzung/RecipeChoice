package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;

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

}
