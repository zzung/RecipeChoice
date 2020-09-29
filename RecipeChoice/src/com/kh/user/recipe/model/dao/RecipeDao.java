package com.kh.user.recipe.model.dao;

import static com.kh.user.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.user.recipe.model.vo.Cook;
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.Recipe;

public class RecipeDao {

	private Properties prop = new Properties();

	public RecipeDao() {

		String fileName = RecipeDao.class.getResource("/sql/recipe/recipe-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}// e.RecipeDao

	public int insertRecipe(Connection conn, Recipe r) {
		int result1 = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertRecipe");

		try {
			pstmt = conn.prepareStatement(sql);

			// pstmt.setInt(1, r.getUserNo());
			// pstmt.setString(2, r.getMemName());
			pstmt.setString(1, r.getRcpTitle());
			pstmt.setString(2, r.getRcpDishType());
			pstmt.setString(3, r.getRcpTag());
			pstmt.setInt(4, r.getRcpTime());
			pstmt.setString(5, r.getRcpContent());
			pstmt.setString(6, r.getRcpPic());

			result1 = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result1;

	}// e.insertRecipe

	public int insertIngredientList(Connection conn, ArrayList<IngredientList> ingList) {
		int result2 = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertIngredientList");

		try {

			for (IngredientList ingredient : ingList) {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, ingredient.getIngDish());
				pstmt.setString(2, ingredient.getIngMetering());

				result2 = pstmt.executeUpdate();
				
				if (result2 == 0) {
					return 0;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}// e.insertIngredientList

	public int insertCookDetail(Connection conn, ArrayList<Cook> cookList) {
		int result3 = 0;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCookDetail");

		try {
			for (Cook c : cookList) {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, c.getCookContent());
				pstmt.setInt(2, c.getCookOrder());
				pstmt.setString(3, c.getCookPic());

				result3 = pstmt.executeUpdate();

				if (result3 == 0) {
					return 0;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result3;
	}// e.insertCookDetail
	
	public ArrayList<Recipe> selectRecipeList(Connection conn) {	
		ArrayList<Recipe> list = new ArrayList<>(); 
		
		Statement stmt = null; 
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectRecipeList");
		
		try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
			
				while(rs.next()) {
				list.add(new Recipe(rs.getInt("RCP_NO"),
									rs.getString("MEM_NAME"),
									rs.getString("RCP_TITLE"),
									rs.getString("RCP_CONTENT"),
									rs.getString("RCP_PIC")));
		
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return list; 
	}//e.ArrayList<Recipe>
	
	public int totalCount(Connection conn) {
		int totalCount = 0; 
		
		Statement stmt = null;
		ResultSet rs = null; 
		
		String sql = prop.getProperty("totalCount");
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				totalCount = rs.getInt("TOTAL");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return totalCount; 
	}
	
}
