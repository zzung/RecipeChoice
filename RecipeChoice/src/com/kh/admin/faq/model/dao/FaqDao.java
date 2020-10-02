package com.kh.admin.faq.model.dao;

import static com.kh.user.common.JDBCTemplate.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;

import com.kh.admin.faq.model.dao.FaqDao;

public class FaqDao {
	
	private Properties prop = new Properties();
	
	public FaqDao() {
		
		String fileName = FaqDao.class.getResource("/sql/faq/faq-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int selectFaqDetailView(Connection conn) {

}
