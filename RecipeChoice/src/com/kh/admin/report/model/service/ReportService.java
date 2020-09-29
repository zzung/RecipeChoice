package com.kh.admin.report.model.service;

import static com.kh.user.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.report.model.dao.ReportDao;
import com.kh.admin.report.model.vo.Report;

public class ReportService {
	
	public ArrayList<Report> selectReportList(){
		
		Connection conn = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectReportList(conn);
		
		close(conn);
		
		return list;
	
	}
	
}
