package com.kh.admin.contact.model.dao;

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
	
	public ArrayList<Contact> selectContactList(Connection conn){
		//select문 => 여러행 조회
		ArrayList<Contact> list = new ArrayList<>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectContactList");
		
		try {
			
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);//sql문 전달하면서 실행 그래서 완성형태여야함
			
			while(rset.next()) {//매개변수이용
				list.add(new Contact(rset.getInt("con_no"),
									 rset.getString("con_type"),
								     rset.getString("con_title"),
								     rset.getString("user_no"),
								     rset.getDate("con_date")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	public int insertContact(Connection conn, Contact c) {
		//insert문 => 처리된 행 수
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertContact");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, c.getConTitle());
			pstmt.setString(2, c.getConContent());
			pstmt.setString(3, c.getConType());
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
}
