package com.kh.admin.management.model.dao;

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

import com.kh.user.member.model.dao.MemberDao;
import com.kh.user.member.model.vo.Member;

public class ManagementDao {
	
	private Properties prop = new Properties();
	public ManagementDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();		
		try {
	
			prop.loadFromXML(new FileInputStream(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<Member> selectMemberList(Connection conn) {

		ArrayList<Member> memberList = new ArrayList<>();
		ResultSet rs = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Member m = new Member(rs.getInt("USER_NO"), rs.getString("MEM_ID"),
									  rs.getString("MEM_PWD"), rs.getString("MEM_NAME"),
									  rs.getString("EMAIL"), rs.getString("MEM_PIC"),
									  rs.getDate("ENROLL_DATE"),rs.getInt("MEM_REP_COUNT"),
									  rs.getString("STATUS"), rs.getInt("BOARD_COUNT"));
				memberList.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return memberList;
	}
	
	
	public ArrayList<Member> selectBlackList(Connection conn) {

		ArrayList<Member> blackList = new ArrayList<>();
		ResultSet rs = null;
		Statement stmt = null;
		String sql = prop.getProperty("selectBlackList");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Member m = new Member(rs.getInt("USER_NO"), rs.getString("MEM_ID"),
						  rs.getString("MEM_PWD"), rs.getString("MEM_NAME"),
						  rs.getString("EMAIL"), rs.getString("MEM_PIC"),
						  rs.getDate("ENROLL_DATE"),rs.getInt("MEM_REP_COUNT"),
						  rs.getString("STATUS"), rs.getInt("BOARD_COUNT"));
				
				blackList.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return blackList;
	}
	
	public Member selectMember(Connection conn, int userNo) {

		Member m = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member(rs.getInt("USER_NO"), rs.getString("MEM_ID"),
						  rs.getString("MEM_PWD"), rs.getString("MEM_NAME"),
						  rs.getString("EMAIL"), rs.getString("MEM_PIC"),
						  rs.getDate("ENROLL_DATE"),rs.getInt("MEM_REP_COUNT"),
						  rs.getString("STATUS"), rs.getInt("BOARD_COUNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return m;
	}
}
