package com.kh.admin.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.user.common.JDBCTemplate.*;

import com.kh.admin.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String fileName = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Notice> selectNoticeList(Connection conn, int page) {

		ArrayList<Notice> noticeList = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNoticeList");
		int start = (int)(page-1)*10+1;
		int end = start+9;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice(rs.getInt("not_no"), rs.getString("not_title"),
									  rs.getString("not_content"), rs.getString("not_important"),
									  rs.getDate("not_date"), rs.getString("status"));
				
				noticeList.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return noticeList;
	}


	public Notice selectNotice(Connection conn, int nno) {
		
		Notice n = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				n = new Notice(rs.getInt("NOT_NO"), rs.getString("NOT_TITLE"),
							   rs.getString("NOT_CONTENT"),rs.getString("NOT_IMPORTANT"),
							   rs.getDate("NOT_DATE"), rs.getString("STATUS"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return n;
	}


	public int insertNotice(Connection conn, Notice n) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeImportant());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updateNotice(Connection conn, Notice n) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeImportant());
			pstmt.setInt(4, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int deleteNotice(Connection conn, int noticeNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Notice> selectNoticeListManagement(Connection conn, int page) {
		ArrayList<Notice> noticeList = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int start = (int)(page-1)*10+1;
		int end = start+9;
		String sql = prop.getProperty("selectNoticeListManagement");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Notice n = new Notice(rs.getInt("not_no"), rs.getString("not_title"),
									  rs.getString("not_content"), rs.getString("not_important"),
									  rs.getDate("not_date"), rs.getString("status"));
				
				noticeList.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return noticeList;
	}


	public int noticeListCount(Connection conn) {

		int result = 0;
		Statement stmt = null;
		String sql = prop.getProperty("noticeListCount");
		
		try {
			stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			result = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	

}
