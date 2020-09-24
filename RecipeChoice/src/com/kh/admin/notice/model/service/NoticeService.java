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

	
	
	
}
