package com.kh.user.recipe.model.dao;

import static com.kh.user.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

			//pstmt.setInt(1, r.getUserNo());
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

	public int insertIngredientList(Connection conn, IngredientList ingredient) {
		int result2 = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertIngredientList");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, ingredient.getIngDish());
			pstmt.setString(2, ingredient.getIngMetering());

			result2 = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2;
	}// e.insertIngredientList

	public int insertCookDetail(Connection conn, ArrayList<Cook> list) {
		int result3 = 0;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCookDetail");

		try {
			for (Cook c : list) {
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
}
