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
		Member loginMember = new MemberDao().loginMember(conn, userId, userPwd);  // m 아니라 다른걸로 바꿔도됨
		
		/*JDBCTemplate.*/close(conn);
		
		return loginMember;
	
		
	}
}
