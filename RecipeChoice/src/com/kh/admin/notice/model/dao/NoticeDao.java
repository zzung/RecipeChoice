package com.kh.admin.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
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
	
	
	public ArrayList<Notice> selectNoticeList(Connection conn) {

		ArrayList<Notice> noticeList = new ArrayList<>();
		ResultSet rs = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Notice n = new Notice(rs.getInt("not_no"), rs.getString("not_title"),
									  rs.getString("not_content"), rs.getString("not_important"),
									  rs.getDate("not_date"), rs.getString("status"));
				
				noticeList.add(n);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rs);
		}
		
		return noticeList;
	}
	
	
	
	
	
	
	
	
	
	

}
