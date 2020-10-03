package com.kh.admin.faq.model.dao;

import static com.kh.user.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.faq.model.vo.Faq;

public class FaqDao {
	
	private Properties prop = new Properties();
	
	public FaqDao() {
		
		String fileName = FaqDao.class.getResource("/sql/faq/faq-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Faq> selectFaqDetailView(Connection conn) {
		
       ArrayList<Faq> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectFaqListView");
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				list.add(new Faq(rs.getInt("faq_no"),
								 rs.getString("faq_title"),
								 rs.getString("faq_content")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return list;
	}
	public ArrayList<Faq> selectFaqListView(Connection conn) {
		
	       ArrayList<Faq> listView = new ArrayList<>();
			
			Statement stmt = null;
			ResultSet rs = null;
			
			String sql = prop.getProperty("selectFaqListView");
			
			try {
				stmt = conn.createStatement();
				
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					listView.add(new Faq(rs.getInt("faq_no"),
									 rs.getString("faq_title"),
									 rs.getString("faq_content")));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(stmt);
			}
			return listView;
		}
	
	public int insertFaq(Connection conn, Faq f) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, f.getFaqTitle());
			pstmt.setString(2, f.getFaqContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Faq selectFaq(Connection conn, int fno) {
		//select문 => 한 행 조회
		
		Faq f = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectFaq");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				f = new Faq(rs.getString("FAQ_TITLE"),
							rs.getString("FAQ_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return f;
	}
}
