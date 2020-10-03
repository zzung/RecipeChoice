package com.kh.user.member.model.service;

import static com.kh.user.common.JDBCTemplate.close;
import static com.kh.user.common.JDBCTemplate.commit;
import static com.kh.user.common.JDBCTemplate.close;
import static com.kh.user.common.JDBCTemplate.commit;
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
	/**
	 * 아이디 중복체크 
	 * @param checkId
	 * @return count
	 */
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn,checkId);
		
		close(conn);
		return count;
	}
	/**
	 * 닉네임 중복체크
	 * @param checkName
	 * @return count
	 */
	public int nameCheck(String checkName) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().nameCheck(conn,checkName);
		
		close(conn);
		return count;
	}
	/**
	 * 이메일 중복체크
	 * @param email
	 * @return count
	 */
	public int emailCheck(String email) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().emailCheck(conn,email);
		
		close(conn);
		return count;
	}
	
	/**
	 * 회원 정보 수정 
	 * @param m 닉네임,아이디,비밀번호,이메일,(이미지파일)
	 * @return
	 */
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn,m);
		
		Member updateMem = null;
		if(result > 0) { // update 성공했을경우
			commit(conn);
			
			// 갱신된 회원 다시 조회해오기 
			// 세션에 이전상태의 정보가 담겨있기 때문에!
			updateMem = new MemberDao().selectUpdateMember(conn,m.getMemId());
			
		}else {// update실패했을 경우 
			rollBack(conn);
		}
		
		close(conn);
		
		return updateMem;  // 갱신된 회원객체 / null
		
	}
	/**
	 * 회원 탈퇴용 서비스
	 * @param memId(사용자 아이디)
	 * @return
	 */
	public int deleteMember (String memId) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, memId);
		
		if(result > 0) {
			commit(conn);
			
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}
	/**
	 * ID 찾기 서비스
	 * @param email
	 * @return
	 */
	public String searchId(String email) {
		
		Connection conn = getConnection();
		String searchId = new MemberDao().searchId(conn, email);
		
		close(conn);
		return searchId;
	}
	/**
	 * 비밀번호 변경 서비스
	 * @param memId
	 * @param memPwd
	 * @return
	 */
	public int updatePwd(String memId, String memPwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn,memId,memPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		return result;
	}
}
