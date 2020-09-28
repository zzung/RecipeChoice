package com.kh.user.member.model.service;

import static com.kh.user.common.JDBCTemplate.close;
import static com.kh.user.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.user.member.model.dao.MemberDao;
import com.kh.user.member.model.vo.Member;

public class MemberService {
	/**
	 * 로그인 서비스 pje
	 * @param userId
	 * @param userPwd
	 * @return int
	 */
	public Member loginMember(String userId, String userPwd) {
		
		
		Connection conn = /*JDBCTemplate.*/getConnection();
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);  
		
		/*JDBCTemplate.*/close(conn);
	
		return loginUser;
	
		
	}
}
