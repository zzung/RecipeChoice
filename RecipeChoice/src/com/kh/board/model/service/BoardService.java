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

}
