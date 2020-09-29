package com.kh.user.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.user.common.JDBCTemplate.close;
import static com.kh.user.common.JDBCTemplate.getConnection;
import com.kh.user.member.model.dao.MemberDao;
import com.kh.user.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();		
		try {
	
			prop.loadFromXML(new FileInputStream(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public Member loginMember(Connection conn, String userId, String userPwd) {
		// selet문 !! 조회하면 한 행이 돌아옴 
		
		Member m = null ; // 담을 곳 변수들 세팅
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("loginMember"); // 미완성된 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			pstmt.setString(2, userPwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member(rs.getInt("user_no"),
							   rs.getString("mem_id"),
							   rs.getString("mem_pwd"),
							   rs.getString("mem_name"),
							   rs.getString("email"),
							   rs.getDate("enroll_Date"),
							   rs.getString("status")
						
						);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
	
		return m;
	}
	public int insertMember(Connection conn, Member m) {

		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2,m.getMemPwd());
			pstmt.setString(3, m.getMemName());
			pstmt.setString(4, m.getEmail());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int idCheck(Connection conn, String checkId) {
		// select문 
		int count = 0;
		
		PreparedStatement pstmt = null;
		 
		ResultSet rs = null;
		
		String sql = prop.getProperty("idCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
		
		
	}
	public int nameCheck(Connection conn, String checkName) {
		// select문 
		int count = 0;
		
		PreparedStatement pstmt = null;
		 
		ResultSet rs = null;
		
		String sql = prop.getProperty("nameCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkName);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
		
		
	}
	public int emailCheck(Connection conn, String email) {
		// select문 
		int count = 0;
		
		PreparedStatement pstmt = null;
		 
		ResultSet rs = null;
		
		String sql = prop.getProperty("emailCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return count;
		
		
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
