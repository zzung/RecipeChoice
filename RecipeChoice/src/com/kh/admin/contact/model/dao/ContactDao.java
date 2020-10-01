package com.kh.admin.contact.model.dao;

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

import com.kh.admin.contact.model.vo.PageInfo;
import com.kh.admin.contact.model.vo.Contact;

public class ContactDao {

	private Properties prop = new Properties();
	
	public ContactDao() {
		
		String fileName = ContactDao.class.getResource("/sql/contact/contact-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectListCount(Connection conn) {
		//select문 =>총 게시글 갯수(int)
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if(rs.next()) {
				listCount = rs.getInt("LISTCOUNT");
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(stmt);
		}
		return listCount;
		
	}
	
	/**
	 * 1:1 문의 전체 조회 리스트
	 * @param conn
	 * @return
	 */
	public ArrayList<Contact> selectContactList(Connection conn, PageInfo pi){
		//select문 => 여러행 조회
		ArrayList<Contact> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectContactList");
		
		try {
			
			pstmt = conn.prepareStatement(sql); 
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {//매개변수이용
				list.add(new Contact(rs.getInt("con_no"),
									 rs.getString("con_type"),
									 rs.getString("con_title"),
									 rs.getString("mem_id"),
								     rs.getDate("con_date")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	/**
	 * 작성
	 * @param conn
	 * @param c
	 * @return
	 */
	public int insertContact(Connection conn, Contact c) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getConTitle());
			pstmt.setString(2, c.getConType());
			pstmt.setString(3, c.getConContent());
			pstmt.setInt(4, Integer.parseInt(c.getUserNo()));//"1" -> 1
			//완성형태 만듬
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result; // 서비스에 리턴
		
	}
	public Contact selectContact(Connection conn, int bno) {
		//select문 => 한 행 조회
		Contact c = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				c = new Contact(rs.getInt("CON_NO"),
								rs.getString("CON_TITLE"),
								rs.getString("MEM_ID"),
								rs.getString("CON_TYPE"),
								rs.getString("CON_CONTENT"),
								rs.getDate("CON_DATE"));
						
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}
}
