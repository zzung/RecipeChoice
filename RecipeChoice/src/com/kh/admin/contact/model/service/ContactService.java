package com.kh.admin.contact.model.service;

import static com.kh.user.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.contact.model.dao.ContactDao;
import com.kh.admin.contact.model.vo.Contact;
import com.kh.admin.contact.model.vo.PageInfo;

public class ContactService {

	/**
	 * 1_1. 총 일반게시글 갯수 조회용 서비스
	 * @return 총 갯수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ContactDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
			
	}
	
	
	/**
	 * 1.사용자 1:1문의 전체조회용 서비스
	 * @return 조회된 전체 1:1문의 리스트
	 */
	public ArrayList<Contact> selectContactList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Contact> list = new ContactDao().selectContactList(conn,pi);
		
		close(conn);
		
		return list;
	}
	/**
	 *  2. 1:1문의 작성용 서비스 
	 * @param c  작성자 번호, 제목, 분야, 내용이 담겨있는 객체
	 * @return	처리된 행 수 
	 */
	public int insertContact(Contact c) {
		//처리된 행수를 리턴 
		Connection conn = getConnection();
		
		int result = new ContactDao().insertContact(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		
		close(conn);
		
		return result;
	}
	/**
	 * 사용자 1:1 상세 조회용 서비스
	 * @param conNo 클릭한 공지사항 번호
	 * @return 조회된 데이터가 담겨있는 contact 객체
	 */
	public Contact selectContactUser(int conNo) {
		
		Connection conn = getConnection();
		
		Contact c = new ContactDao().selectContactUser(conn, conNo);
		
		close(conn);
		
		return c;
	}
	
	//관리자 select
	public ArrayList<Contact> selectContactListView(){
		Connection conn = getConnection();
		
		ArrayList<Contact> listView = new ContactDao().selectContactListView(conn);
		
		close(conn);
		
		return listView;
	}
	/**
	 * 상세정보 조회용 서비스
	 * @param bno 상세조회요청한 게시글 번호
	 * @return 해당 게시글 정보가 담겨있는 Contact 객체
	 */
	public Contact selectContact(int bno) {
		
		Connection conn = getConnection();
		
		Contact c = new ContactDao().selectContact(conn,  bno);
		
		close(conn);
		
		return c;
	}
}