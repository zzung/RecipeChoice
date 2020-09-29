package com.kh.admin.report.model.dao;

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

import com.kh.admin.contact.model.vo.Contact;


import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.contact.model.vo.Contact;
import com.kh.admin.report.model.vo.Report;

public class ReportDao {
	
	private Properties prop = new Properties();
	
	public ReportDao() {
		
		String fileName = ReportDao.class.getResource("/sql/Report/Report-mapper").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	/**
	 *  신고관리 조회페이지
	 * @param conn
	 * @return
	 */
	public ArrayList<Report> selectReportList(Connection conn){
		
		ArrayList<Contact> list = new ArrayList<>();
		
		Statement stmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReportList");
		
		
		try {
			
			stmt=conn.createStatement();
			
			rs = stmt.executeQuery(sql); 
			
			while(rs.next()) {
				list.add(new Report(re.getInt))
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
