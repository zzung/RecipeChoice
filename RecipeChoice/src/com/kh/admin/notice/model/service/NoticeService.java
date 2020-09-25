package com.kh.admin.notice.model.service;

import static com.kh.user.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.notice.model.dao.NoticeDao;
import com.kh.admin.notice.model.vo.Notice;

public class NoticeService {

	
	public ArrayList<Notice> selectNoticeList() {
		
		Connection conn = getConnection();
		ArrayList<Notice> noticeList = new NoticeDao().selectNoticeList(conn);
		close(conn);
		
		return noticeList;
	}

	public Notice selectNotice(int nno) {

		Connection conn = getConnection();
		Notice n = new NoticeDao().selectNotice(conn, nno);
		close(conn);
		
		return n;
	}

	
	
	
}
