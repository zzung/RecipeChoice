package com.kh.admin.management.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.management.model.dao.ManagementDao;
import com.kh.user.board.model.vo.Board;
import com.kh.user.member.model.dao.MemberDao;
import com.kh.user.member.model.vo.Member;
import static com.kh.user.common.JDBCTemplate.*;

public class ManagementService {
	
	
		// 관리자 페이지 > 전체 회원 조회
		public ArrayList<Member> selectMemberList() {

			Connection conn = getConnection();
			ArrayList<Member> memberList = new ManagementDao().selectMemberList(conn);
			close(conn);
			
			return memberList;
		}
		
	
		// 관리자 페이지 > 블랙리스트 조회
		public ArrayList<Member> selectBlackList() {

			Connection conn = getConnection();
			ArrayList<Member> blackList = new ManagementDao().selectBlackList(conn);
			close(conn);
			
			return blackList;
		}
		
		// 관리자 페이지 > 회원 상세조회
		public Member selectMember(int userNo) {

			Connection conn = getConnection();
			Member m = new ManagementDao().selectMember(conn, userNo);
			close(conn);
			
			return m;
		}

		// 관리자페이지 > 회원 상세조회 > 회원이 올린 게시글 목록 조회
		public ArrayList<Board> selectBoardList(int userNo) {

			Connection conn = getConnection();
			ArrayList<Board> boardList = new ManagementDao().selectBoardList(conn, userNo);
			close(conn);
			
			return boardList;
		}
		
		
		
		
}
