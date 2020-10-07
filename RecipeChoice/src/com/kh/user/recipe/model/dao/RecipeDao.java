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
import com.kh.user.recipe.model.vo.Count;
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.PageInfo;
import com.kh.user.recipe.model.vo.Recipe;
import com.kh.user.reply.model.vo.Reply;

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

			pstmt.setInt(1, r.getUserNo());
			pstmt.setString(2, r.getMemName());
			pstmt.setString(3, r.getRcpTitle());
			pstmt.setString(4, r.getRcpDishType());
			pstmt.setString(5, r.getRcpTag());
			pstmt.setInt(6, r.getRcpTime());
			pstmt.setString(7, r.getRcpContent());
			pstmt.setString(8, r.getRcpPic());

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
	}//e.totalCount
	
	public Recipe selectDetailRecipeList(Connection conn, int rcpNo){
		Recipe r = new Recipe();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectDetailRecipeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rcpNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				r = new Recipe(rs.getInt("RCP_NO"),
								rs.getInt("USER_NO"),
								rs.getString("MEM_NAME"),
								rs.getString("RCP_TITLE"),
								rs.getString("RCP_DISH_TYPE"),
								rs.getString("RCP_TAG"),
								rs.getInt("RCP_TIME"),
								rs.getString("RCP_CONTENT"),
								rs.getString("RCP_PIC"),
								rs.getInt("COUNT"),
								rs.getInt("SCRAP_COUNT")
								);
			}
			
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return r; 
		
	}//e.selectDetailRecipeList
	
	public ArrayList<IngredientList> selectDetailIngList(Connection conn, int rcpNo){
		
		ArrayList<IngredientList> ingredient = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectDetailIngList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rcpNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ingredient.add(new IngredientList(rs.getInt("ING_NO"),
												  rs.getInt("RCP_NO"),
												  rs.getString("ING_DISH"),
												  rs.getString("ING_METERING")
												 ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return ingredient; 
	}//e.selectDetailIngList
	
	public ArrayList<Cook> selectDetailCookList(Connection conn, int rcpNo){
		ArrayList<Cook> cook = new ArrayList<>(); 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectDetailCookList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rcpNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				cook.add(new Cook(rs.getInt("COOK_NO"),
								  rs.getInt("RCP_NO"),
								  rs.getString("COOK_CONTENT"),
								  rs.getInt("COOK_ORDER"),
								  rs.getString("COOK_PIC")
								 ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cook; 
	}//e.selectDetailCookList
	
	public ArrayList<Recipe> tagSearch(Connection conn, String[] rcpTags, int rcpTime, String rcpDishType){
		ArrayList<Recipe> tags = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("tagSearch");
		
		try {
			pstmt = conn.prepareStatement(sql);
			if(rcpTags != null ) {
				for(int i=0; i<rcpTags.length; i++) {
					//System.out.println(i+1 + "번째 인덱스 -> " + rcpTags[i]);
					pstmt.setString(i+1, "%"+rcpTags[i]+"%");
				}	
				for(int j=rcpTags.length; j<14; j++) {
					//System.out.println(j+1 + "번째 인덱스 -> NULL" );
					pstmt.setString(j+1, "%NULL%");
				}
			} else {			
				for(int i=0; i<14; i++) {
					pstmt.setString(i+1, "%NULL%");
				}
			}
			pstmt.setInt(15, rcpTime);
			pstmt.setString(16, rcpDishType);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				tags.add(new Recipe(rs.getInt("RCP_NO"),
									rs.getString("MEM_NAME"),
									rs.getString("RCP_TITLE"),
									rs.getString("RCP_CONTENT"),
									rs.getString("RCP_PIC")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return tags; 
	}//e.tagSearch
	
	public int updateRecipe(Connection conn, Recipe r) {
		int result1 = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getRcpTitle());
			pstmt.setString(2, r.getRcpDishType());
			pstmt.setString(3, r.getRcpTag());
			pstmt.setInt(4, r.getRcpTime());
			pstmt.setString(5, r.getRcpContent());
			pstmt.setString(6, r.getRcpPic());
			pstmt.setInt(7, r.getRcpNo());
			
			result1 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result1; 
		
	} //e.updateRecipe
	
	
	public int insertNewIngredientList(Connection conn, ArrayList<IngredientList> ingList) {
		int result3 = 0; 
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewIngredientList");
		
		try {
			
			for(IngredientList i : ingList) {

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, i.getRcpNo());
				pstmt.setString(2, i.getIngDish());
				pstmt.setString(3, i.getIngMetering());
				
				result3 = pstmt.executeUpdate();
				
				if(result3 == 0) {
					return 0; 
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result3; 
		
	}//e.insertNewIngredientList
	
	public int insertNewCookDetail(Connection conn, ArrayList<Cook> cookList) {
		int result5 = 0;
		
		PreparedStatement pstmt = null; 
		String sql = prop.getProperty("insertNewCookDetail");
		
		try {
			
			for(Cook c : cookList) {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, c.getRcpNo());
				pstmt.setString(2, c.getCookContent());
				pstmt.setInt(3, c.getCookOrder());
				pstmt.setString(4, c.getCookPic());
				
				result5 = pstmt.executeUpdate();
				
				if(result5 == 0) {
					return 0; 
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result5; 
	}//e.insertNewCookDetail 
	
	public int deleteIngredientList(Connection conn, int rcpNo) {
		int result2 = 0; 
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteIngredientList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rcpNo);
			
			result2 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result2; 
	}//e.deleteIngredientList
	public int deleteCook(Connection conn, int rcpNo) {
		int result4 = 0; 
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCook");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rcpNo);
			
			result4 = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result4; 
	}
	public int deleteRecipe(Connection conn, int rcpNo) {
		int result = 0; 
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteRecipe"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, rcpNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		return result; 
	}//e.deleteRecipe
	
	public int selectListCount(Connection conn) {
		int listCount = 0 ; 
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectListCount"); 
		
		try {
			stmt = conn.createStatement();
			rs= stmt.executeQuery(sql);
			
			if(rs.next()) {
				listCount = rs.getInt("LISTCOUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		return listCount; 
				
	}//e.selectListCount
	
	public ArrayList<Recipe> selectRecipeList(Connection conn, PageInfo pi){
		ArrayList<Recipe> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectRecipeList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
			int endRow = startRow + pi.getBoardLimit() -1; 
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Recipe(rs.getInt("RCP_NO"),
						            rs.getString("MEM_NAME"),
						            rs.getString("RCP_TITLE"),
						            rs.getString("RCP_CONTENT"),
						            rs.getString("RCP_PIC"),
						            rs.getString("RCP_DISH_TYPE")
						            ));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list; 
		
	}//e.selectRecipeList
	
	public ArrayList<Recipe> relationRecipe(Connection conn, String dishType){
		ArrayList<Recipe> relation = new ArrayList<>();
		
		PreparedStatement pstmt = null; 
		ResultSet rs = null; 
		
		String sql = prop.getProperty("relationRecipe");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dishType);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Recipe ct = new Recipe();
				ct.setRcpNo(rs.getInt("RCP_NO"));
				ct.setRcpPic(rs.getString("RCP_PIC"));
				
				relation.add(ct); 
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt); 
		}
		return relation; 
	}//e.
	
	public ArrayList<Recipe> myPage(Connection conn, int userNo){
		ArrayList<Recipe> myPage = new ArrayList<>(); 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		String sql = prop.getProperty("myPage");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,userNo); 
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Recipe my = new Recipe();
				my.setRcpTitle(rs.getString("RCP_TITLE"));
				my.setCreateDate(rs.getDate("CREATE_DATE"));
				my.setRcpPic(rs.getString("RCP_PIC"));
				my.setRcpNo(rs.getInt("RCP_NO"));
				myPage.add(my); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return myPage; 
	}
	public Recipe myPage2(Connection conn, int rcp){
		Recipe my = new Recipe();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		String sql = prop.getProperty("myPage2");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,rcp); 
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				my.setRcpTitle(rs.getString("RCP_TITLE"));
				my.setCreateDate(rs.getDate("CREATE_DATE"));
				my.setRcpPic(rs.getString("RCP_PIC"));
				my.setRcpNo(rs.getInt("RCP_NO")); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return my; 
	}

	public ArrayList<Recipe> todayRecipeList(Connection conn) {
		
		ArrayList<Recipe> todaytodayRecommendedRecipe = new ArrayList<Recipe>();
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("todayRecipeList");
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				todaytodayRecommendedRecipe.add(new Recipe(rs.getInt("RCP_NO"),
														   rs.getInt("USER_NO"),
														   rs.getString("MEM_NAME"),
														   rs.getString("RCP_TITLE"),
														   rs.getString("RCP_DISH_TYPE"),
														   rs.getString("RCP_TAG"),
														   rs.getInt("RCP_TIME"),
														   rs.getString("RCP_CONTENT"),
														   rs.getString("RCP_PIC"),
														   rs.getInt("COUNT"),
														   rs.getInt("SCRAP_COUNT")
														  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return todaytodayRecommendedRecipe;
		
	}

	public ArrayList<Recipe> bestRecipeList(Connection conn) {

		ArrayList<Recipe> bestRecipes = new ArrayList<Recipe>();
		
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("bestRecipeList");
		
		try {
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				bestRecipes.add(new Recipe(rs.getInt("RCP_NO"),
										   rs.getInt("USER_NO"),
										   rs.getString("MEM_NAME"),
										   rs.getString("RCP_TITLE"),
										   rs.getString("RCP_DISH_TYPE"),
										   rs.getString("RCP_TAG"),
										   rs.getInt("RCP_TIME"),
										   rs.getString("RCP_CONTENT"),
										   rs.getString("RCP_PIC"),
										   rs.getInt("COUNT"),
										   rs.getInt("SCRAP_COUNT")
										  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bestRecipes;
		
	}//e.
	
	public int insertReply(Connection conn, Reply re) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertReply"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, re.getUserNo());
			pstmt.setString(2, re.getMemName());
			pstmt.setInt(3, re.getBno());
			pstmt.setString(4, re.getReplyContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt); 
		}
		return result; 
	}//e.insertReply
	
	public ArrayList<Reply> selectReplyList(Connection conn, int bno){
		ArrayList<Reply> list = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new Reply(rs.getInt("BRE_NO"),
						           rs.getString("MEM_NAME"),
						           rs.getString("BRE_CONTENT"),
						           rs.getString("BRE_DATE")
								   ));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list; 
	}//e.selectReplyList
	
	public int replyCount(Connection conn, int rcpNo) {
		int replyCount = 0; 
		
		PreparedStatement pstmt = null;
		ResultSet rs = null; 
		
		String sql = prop.getProperty("replyCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rcpNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				replyCount = rs.getInt("CR");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return replyCount; 
	}//e.replyCount
	
	public ArrayList<Recipe> searchAll(Connection conn, String rcpTag, String rcpDishType){
		ArrayList<Recipe> search = new ArrayList<>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = prop.getProperty("searchAll"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+rcpTag+"%");
			pstmt.setString(2, "%"+rcpDishType+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				search.add(new Recipe(rs.getInt("RCP_NO"),
						   			  rs.getString("MEM_NAME"),
						   			  rs.getString("RCP_TITLE"),
						   			  rs.getString("RCP_CONTENT"),
						   			  rs.getString("RCP_PIC")
						   			  ));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		for(Recipe sh : search) {
			System.out.println("sh :" + sh);
		}
		return search; 
	}
}
