package com.kh.admin.contact.model.service;

import static com.kh.user.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.contact.model.dao.ContactDao;
import com.kh.admin.contact.model.vo.Contact;

public class ContactService {

	/**
	 * 1.사용자 1:1문의 전체조회용 서비스
	 * @return 조회된 전체 1:1문의 리스트
	 */
	public ArrayList<Contact> selectContactList(){
		
		Connection conn = getConnection();
		
		ArrayList<Contact> list = new ContactDao().selectContactList(conn);
		
		close(conn);
		
		return list;
	}
	/**
	 *  2. 1:1문의 작성용 서비스
	 * @param c  작성자 번호, 제목, 분야, 내용이 담겨있는 객체
	 * @return
	 */
	public int insertContact(Contact c) {
		//처리된 행수를 리턴 
		Connection conn = getConnection();
		
		int result = new ContactDao().insertContact(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
}
