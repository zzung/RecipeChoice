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
	
	
	public ArrayList<Tip> selectCareTipList(Connection conn, int page) {

		ArrayList<Tip> careTipList = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int start = (int)(page-1)*10+1;
		int end = start+9;
		String sql = prop.getProperty("selectCareTipList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
			pstmt.setString(6, t.getTipPicture());
			 
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


	public int enableStatus(Connection conn, int tno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("enableStatus");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int increaseTipCount(Connection conn, int tno) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Tip> selectKnowledgeList(Connection conn, int page) {
		
		ArrayList<Tip> knowledgeList = new ArrayList<>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int start = (int)(page-1)*10+1;
		int end = start+9;
		String sql = prop.getProperty("selectKnowledgeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
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
				knowledgeList.add(t);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return knowledgeList;
	}


	public Tip selectKnowledge(Connection conn, int tno) {

		Tip t = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectKnowledge");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, tno);
			
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


	public int updateKnowledge(Connection conn, Tip t) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateKnowledge");
		
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


	public int insertKnowledge(Connection conn, Tip t) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertKnowledge");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getTipTitle());
			pstmt.setString(2, t.getTipInfo());
			pstmt.setString(3, t.getTipIngredientTag());
			pstmt.setString(4, t.getTipContent());
			pstmt.setInt(5, t.getTipCount());
			pstmt.setString(6, t.getTipPicture());
			 
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public int deleteKnowledge(Connection conn, int tipNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteKnowledge");
		
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
