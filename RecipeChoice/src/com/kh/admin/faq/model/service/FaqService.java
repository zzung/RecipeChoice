package com.kh.admin.faq.model.service;

import static com.kh.user.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.faq.model.dao.FaqDao;
import com.kh.admin.faq.model.vo.Faq;


public class FaqService {

	/**
	 * 사용자쪽 디테일 리스트 전체 조회
	 * @return
	 */
	public ArrayList<Faq> selectFaqDetailView(){
		Connection conn = getConnection();
		
		ArrayList<Faq> list = new FaqDao().selectFaqDetailView(conn);
		
		close(conn);
		
		return list;
	}
	/**
	 * 관리자쪽 리스트 전체 조회
	 * @return
	 */
	public ArrayList<Faq> selectFaqListView(){
		Connection conn = getConnection();
		
		ArrayList<Faq> listView = new FaqDao().selectFaqListView(conn);
		
		close(conn);
		
		return listView;
	}
	/**
	 * 2.관리자쪽 추가하기 (작성용) 서비스
	 * @param f	제목, 내용이 담겨있는 객체
	 * @return  처리된 행 수 
	 */
	public int insertFaq(Faq f) {
		
		Connection conn = getConnection();
		
		int result = new FaqDao().insertFaq(conn, f);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		
		close(conn);
		
		return result;
	}
	/**
	 * update문 작성시 필요한 서비스
	 * @param fno 업데이트할 게시글 번호
	 * @return 해당 게시글 정보가 담겨있는 Faq객체
	 */
	public Faq selectFaq(int fno) {
		
		Connection conn = getConnection();
		
		Faq f = new FaqDao().selectFaqDetailView(conn, fno);
		
		close(conn);
		
		return f;
	}
	
	
}