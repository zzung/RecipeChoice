package com.kh.user.reply.model.dao;

import static com.kh.user.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.user.board.model.dao.BoardDao;
import com.kh.user.reply.model.vo.Reply;

public class ReplyDao {
	
	private Properties prop = new Properties();
	
	public ReplyDao() {

		String fileName = BoardDao.class.getResource("/sql/reply/reply-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 댓글의 개수를 가져옴
	 * @param conn
	 * @param bno
	 * @param boardType 
	 * @return
	 */
	public int replyMaxCount(Connection conn, int bno, String boardType) {
		
		int replyCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("replyMaxCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setString(2, boardType);
			
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
	 * @param boardType 
	 * @return
	 */
	public ArrayList<Reply> selectReplyList(Connection conn, int bno, String boardType, int start, int maxReply) {
		
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setString(2, boardType);
			pstmt.setInt(3, start);
			pstmt.setInt(4, maxReply);
			
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
	 * @param boardType 
	 * @return
	 */
	public int replyTopNo(Connection conn, int bno, String boardType) {
		
		int topReplyNo = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("replyTopNo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setString(2, boardType);
			
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

	/**
	 * 댓글수정
	 * @param replyNo		// 댓글번호
	 * @param replyContent	// 수정할 댓글내용
	 * @return
	 */
	public int replyUpdate(Connection conn, int replyNo, String replyContent) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("replyUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, replyContent);
			pstmt.setInt(2, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteReply(Connection conn, int replyNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("replyDelete");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, replyNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
}
