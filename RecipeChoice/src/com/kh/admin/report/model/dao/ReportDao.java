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

import com.kh.admin.report.model.vo.PageInfo;
import com.kh.admin.report.model.vo.Report;

public class ReportDao {
	
	private Properties prop = new Properties();
	
	public ReportDao() {
		
		String fileName = ReportDao.class.getResource("/sql/report/report-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	public int selectListCount(Connection conn) {
		//select문 =>총 게시글 갯수
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
	 *  신고관리 조회페이지
	 * @param conn
	 * @return
	 */
	public ArrayList<Report> selectList(Connection conn, PageInfo pi){
		//select문 => 여러행 조회
		ArrayList<Report> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectReportList");
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			
			
			while(rs.next()) {
				list.add(new Report(rs.getInt("REP_NO"),
									rs.getString("WRITER"),
									rs.getString("TARGET"),
									rs.getString("REP_REASON"),
									rs.getDate("REP_DATE")));
									
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
		
	}
}
