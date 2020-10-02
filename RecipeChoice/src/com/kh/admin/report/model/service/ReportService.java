package com.kh.admin.report.model.service;

import static com.kh.user.common.JDBCTemplate.close;
import static com.kh.user.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.report.model.dao.ReportDao;
import com.kh.admin.report.model.vo.PageInfo;
import com.kh.admin.report.model.vo.Report;

public class ReportService {
	
	/**
	 * 1_1. 총 일반게시글 갯수 조회용 서비스
	 * @return 총 갯수
	 */
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new ReportDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
			
	}
	/**
	 * 1_1. 현재 요청한 페이지에 보여져야할 리스트 조회용 서비스
	 * @param pi 현재요청한 페이지, 게시글 최대갯수가 담겨있는PageInfo 객체
	 * @return	조회된 결과가 담겨있는 list
	 */
	public ArrayList<Report> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectList(conn,pi);
		
		close(conn);
		
		return list;
	
	}
	
}
