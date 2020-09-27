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
}
