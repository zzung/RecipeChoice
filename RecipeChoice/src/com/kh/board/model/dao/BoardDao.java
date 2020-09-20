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

	/**
	 * 게시글 목록 가져오기
	 * @param conn
	 * @param currentPage			현재페이지 정보
	 * @return
	 */
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

	/**
	 * 게시글 최대수를 가져와 페이지 정보객체에 넣어줌
	 * @param conn
	 * @param pi		최대 페이지수를 저장할 페이지정보 객체
	 */
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

	/**
	 * 게시글을 DB에 insert함
	 * @param conn
	 * @param writed
	 * @return
	 */
	public int insertBoardContent(Connection conn, Board writed) {

		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("writeBoardContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, writed.getUserNo());
			pstmt.setString(2, writed.getBoardTitle());
			pstmt.setString(3, writed.getCategory());
			pstmt.setString(4, writed.getBoardContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 게시글 번호를 통해 게시글 상세 내용을 가져옴
	 * @param conn
	 * @param bno
	 * @return
	 */
	public Board selectBoardDetail(Connection conn, int bno) {
		
		Board b = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectBoardDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				b = new Board(rs.getInt("BOARD_NO")
						    , rs.getInt("USER_NO")
						    , rs.getString("MEM_ID")
						    , rs.getString("MEM_NAME")
						    , rs.getString("MEM_PIC")
						    , rs.getString("BOARD_TITLE")
						    , rs.getString("BOARD_CATEGORY")
						    , rs.getString("BOARD_CONTENT")
						    , rs.getDate("CREATE_DATE")
						    , rs.getInt("BOARD_COUNT")
						    , "Y");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return b;
	}

	/**
	 * 게시글 상세조회시 조회전에 해당게시글의 조회수 증가
	 * @param conn
	 * @param bno
	 * @return
	 */
	public int updateBoardCount(Connection conn, int bno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoardCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
