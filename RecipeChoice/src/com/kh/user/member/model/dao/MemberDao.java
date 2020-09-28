package com.kh.user.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
							   rs.getDate("enrollDate"),
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
}
