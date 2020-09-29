package com.kh.user.member.model.service;

import static com.kh.user.common.JDBCTemplate.*;
import static com.kh.user.common.JDBCTemplate.getConnection;
import static com.kh.user.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;

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
	/**
	 * 아이디 중복체크 
	 * @param checkId
	 * @return
	 */
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn,checkId);
		
		close(conn);
		return count;
	}
	
	public int nameCheck(String checkName) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().nameCheck(conn,checkName);
		
		close(conn);
		return count;
	}
	
	public int emailCheck(String email) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().emailCheck(conn,email);
		
		close(conn);
		return count;
	}
	
	// 관리자 페이지에서 전체 회원 조회하기
	public ArrayList<Member> selectMemberList() {

		Connection conn = getConnection();
		ArrayList<Member> memberList = new MemberDao().selectMemberList(conn);
		close(conn);
		
		return memberList;
	}
	
	// 관리자 페이지에서 블랙리스트 조회하기
	public ArrayList<Member> selectBlackList() {

		Connection conn = getConnection();
		ArrayList<Member> blackList = new MemberDao().selectBlackList(conn);
		close(conn);
		
		return blackList;
	}
	
	// 관리자 페이지에서 회원 상세조회
	public Member selectMember(int userNo) {

		Connection conn = getConnection();
		Member m = new MemberDao().selectMember(conn, userNo);
		close(conn);
		
		return m;
	}
}
