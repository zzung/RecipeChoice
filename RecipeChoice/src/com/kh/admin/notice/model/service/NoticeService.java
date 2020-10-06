package com.kh.admin.notice.model.service;

import static com.kh.user.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.notice.model.dao.NoticeDao;
import com.kh.admin.notice.model.vo.Notice;

public class NoticeService {

	
	public ArrayList<Notice> selectNoticeList(int page) {
		
		Connection conn = getConnection();
		ArrayList<Notice> noticeList = new NoticeDao().selectNoticeList(conn, page);
		close(conn);
		
		return noticeList;
	}

	public Notice selectNotice(int nno) {

		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, nno);
		close(conn);
		
		return n;
	}

	public int insertNotice(Notice n) {

		Connection conn = getConnection();
		int result = new NoticeDao().insertNotice(conn, n);
		
		if(result >0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateNotice(Notice n) {

		Connection conn = getConnection();
		int result = new NoticeDao().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteNotice(int noticeNo) {

		Connection conn = getConnection();
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Notice> selectNoticeListManagement(int page) {
		
		Connection conn = getConnection();
		ArrayList<Notice> noticeList = new NoticeDao().selectNoticeListManagement(conn,page);
		close(conn);
		
		return noticeList;
	}

	public int noticeListCount() {

		Connection conn = getConnection();
		int result = new NoticeDao().noticeListCount(conn);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	
	
	
}
