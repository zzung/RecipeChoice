package com.kh.user.member.model.service;

import static com.kh.user.common.JDBCTemplate.*;
import static com.kh.user.common.JDBCTemplate.getConnection;
import static com.kh.user.common.JDBCTemplate.rollBack;

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
	/**
	 * 회원가입 서비스 pje
	 * @param m 
	 * @return
	 */
	public int insertMember(Member m) {
		
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}
}
