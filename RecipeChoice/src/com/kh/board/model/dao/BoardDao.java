package com.kh.board.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.PageInfo;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {

		String fileName = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<Board> selectBoardList(Connection conn, int currentPage) {
		
		ArrayList<Board> boardList = new ArrayList<Board>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectBoardListByPage");
		
		int maxRownum = currentPage * 10; 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, maxRownum - 9);
			pstmt.setInt(2, maxRownum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardList.add(new Board(rs.getInt("BOARD_NO")
						              , rs.getInt("USER_NO")
						              , rs.getString("MEM_NAME")
						              , rs.getString("MEM_PIC")
						              , rs.getString("BOARD_TITLE")
						              , rs.getString("BOARD_CATEGORY")
						              , rs.getString("BOARD_CONTENT")
						              , rs.getDate("CREATE_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return boardList;
	}

	public void getMaxPage(Connection conn, PageInfo pi) {
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("getMaxPage");
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int max = rs.getInt("MAX");
				pi.setMaxPage((max % 10 == 0)? max / 10:max / 10 + 1 );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
	}

}
