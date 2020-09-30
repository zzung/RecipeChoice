package com.kh.user.member.model.dao;

import static com.kh.user.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
	
	public int updateMember(Connection conn, Member m ) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemPwd());
			pstmt.setString(2, m.getMemName());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getMemPic());
			pstmt.setString(5, m.getMemId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	/**
	 * 회원정보 수정 후 마이페이지에 뿌려줄 멤버객체
	 * @return
	 */
	public Member selectUpdateMember(Connection conn, String memId) {
		
		Member m = null ; // 담을 곳 변수들 세팅
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectUpdateMember"); // 미완성된 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				m = new Member(
							   rs.getString("mem_id"),
							   rs.getString("mem_pwd"),
							   rs.getString("mem_name"),
							   rs.getString("email"),
							   rs.getString("mem_pic"),
							   rs.getDate("enroll_date")
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}
}
