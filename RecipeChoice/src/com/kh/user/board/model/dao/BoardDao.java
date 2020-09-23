package com.kh.user.board.model.dao;

import static com.kh.user.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.user.board.model.vo.Board;
import com.kh.user.board.model.vo.PageInfo;
import com.kh.user.board.model.vo.Reply;

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
						              , rs.getString("CREATE_DATE")));
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
						    , rs.getString("CREATE_DATE")
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

	/**
	 * 게시글 수정
	 * @param conn
	 * @param update
	 * @return
	 */
	public int updateBoardContent(Connection conn, Board update) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateBoardContent");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, update.getBoardTitle());
			pstmt.setString(2, update.getCategory());
			pstmt.setString(3, update.getBoardContent());
			pstmt.setInt(4, update.getBoardNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 게시글 삭제
	 * @param conn
	 * @param bno
	 * @return
	 */
	public int deleteBoardContent(Connection conn, int bno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteBoardContent");
		
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

	/**
	 * 댓글의 개수를 가져옴
	 * @param conn
	 * @param bno
	 * @return
	 */
	public int replyMaxCount(Connection conn, int bno) {
		
		int replyCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("replyMaxCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				replyCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return replyCount;
	}

	/**
	 * 댓글의 리스트를 가져옴
	 * @param conn
	 * @param bno
	 * @return
	 */
	public ArrayList<Reply> selectReplyList(Connection conn, int bno, int start, int maxReply) {
		
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setInt(2, start);
			pstmt.setInt(3, maxReply);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				replyList.add(new Reply(rs.getInt("BRE_NO")
									  , rs.getInt("USER_NO")
									  , rs.getString("MEM_NAME")
									  , rs.getString("MEM_PIC")
									  , rs.getInt("BOARD_NO")
									  , rs.getString("BRE_CONTENT")
									  , rs.getString("BRE_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return replyList;
		
	}

	/**
	 * 최상단 댓글 확인
	 * @param conn
	 * @param bno
	 * @return
	 */
	public int replyTopNo(Connection conn, int bno) {
		
		int topReplyNo = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("replyTopNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				topReplyNo = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return topReplyNo;
	}

}
