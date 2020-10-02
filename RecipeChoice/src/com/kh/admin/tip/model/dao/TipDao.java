package com.kh.admin.tip.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.admin.tip.model.vo.Tip;
import com.kh.user.member.model.dao.MemberDao;
import static com.kh.user.common.JDBCTemplate.*;

public class TipDao {

	private Properties prop = new Properties();
	public TipDao() {
		
		String fileName = MemberDao.class.getResource("/sql/tip/tip-mapper.xml").getPath();		
		try {
	
			prop.loadFromXML(new FileInputStream(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Tip> selectCareTipList(Connection conn) {

		ArrayList<Tip> careTipList = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCareTipList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Tip t = new Tip(rs.getInt("TIP_NO"),
								rs.getString("TIP_TITLE"),
								rs.getString("TIP_INFO"),
								rs.getString("TIP_ING"),
								rs.getString("TIP_CONTENT"),
								rs.getInt("TIP_COUNT"),
								rs.getString("TIP_CATEGORY"),
								rs.getString("TIP_PIC"),
								rs.getDate("CREATE_DATE"),
								rs.getString("STATUS"));
				careTipList.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return careTipList;
	}


	public Tip selectCareTip(Connection conn, int tipNo) {

		Tip t = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectCareTip");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tipNo);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				t = new Tip(rs.getInt("TIP_NO"),
						rs.getString("TIP_TITLE"),
						rs.getString("TIP_INFO"),
						rs.getString("TIP_ING"),
						rs.getString("TIP_CONTENT"),
						rs.getInt("TIP_COUNT"),
						rs.getString("TIP_CATEGORY"),
						rs.getString("TIP_PIC"),
						rs.getDate("CREATE_DATE"),
						rs.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return t;
	}


	public int insertCareTip(Connection conn, Tip t) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCareTip");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTipTitle());
			pstmt.setString(2, t.getTipInfo());
			pstmt.setString(3, t.getTipIngredientTag());
			pstmt.setString(4, t.getTipContent());
			pstmt.setInt(5, t.getTipCount());
			pstmt.setString(6, t.getTipCategory());
			pstmt.setString(7, t.getTipPicture());
			pstmt.setDate(8, t.getCreateDate());
			pstmt.setString(9, t.getStatus());
			 
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updateCareTip(Connection conn, Tip t) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCareTip");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTipTitle());
			pstmt.setString(2, t.getTipInfo());
			pstmt.setString(3, t.getTipIngredientTag());
			pstmt.setString(4, t.getTipContent());
			pstmt.setString(5, t.getTipPicture());
			pstmt.setInt(6, t.getTipNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteCareTip(Connection conn, int tipNo) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCareTip");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tipNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
