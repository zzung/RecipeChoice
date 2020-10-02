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
		
		ArrayList<Faq> list = new FaqDao().selectFaqListView(conn);
		
		close(conn);
		
		return list;
	}
	
}