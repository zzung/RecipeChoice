package com.kh.user.recipe.model.service;

import static com.kh.user.common.JDBCTemplate.close;
import static com.kh.user.common.JDBCTemplate.commit;
import static com.kh.user.common.JDBCTemplate.getConnection;
import static com.kh.user.common.JDBCTemplate.rollBack;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.user.recipe.model.dao.RecipeDao;
import com.kh.user.recipe.model.vo.Cook;
import com.kh.user.recipe.model.vo.Count;
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.PageInfo;
import com.kh.user.recipe.model.vo.Recipe;
import com.kh.user.reply.model.vo.Reply;

public class RecipeService {
	/**
	 * 레시피 작성
	 * 
	 * @param r          레시피 적성 전반적인 내용/대표이미지
	 * @param ingredient 재료리스트에 들어갈 내용들
	 * @param c          재료 순서 등 디데일 내용
	 * @return
	 */
	public int insertRecipe(Recipe r, ArrayList<IngredientList> ingList, ArrayList<Cook> cookList) {
		Connection conn = getConnection();

		int result1 = new RecipeDao().insertRecipe(conn, r);
		int result2 = new RecipeDao().insertIngredientList(conn, ingList);
		int result3 = new RecipeDao().insertCookDetail(conn, cookList);

		if (result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollBack(conn);
		}

		close(conn);
		return result1 * result2 * result3;
	}// e.insertRecipe

	/**
	 * 레시피 화면 총 게시글 보여주기 위한 조회
	 * 
	 * @return
	 */
	public int totalCount() {
		Connection conn = getConnection();

		int totalCount = new RecipeDao().totalCount(conn);

		close(conn);

		return totalCount;
	} // e.totalCount

	/**
	 * 레시피 디테일 뷰 에서 레시피 DB에서 가져오기
	 * 
	 * @param rcpNo 레시피번호
	 * @return
	 */
	public Recipe selectDetailRecipeList(int rcpNo) {
		Connection conn = getConnection();

		Recipe r = new RecipeDao().selectDetailRecipeList(conn, rcpNo);

		close(conn);

		return r;
	}// e. selectRecipeList

	/**
	 * 레시피 디테일 뷰에서 DB 재료리스트에서 가져오기
	 * 
	 * @param rcpNo 레시피번호
	 * @return
	 */
	public ArrayList<IngredientList> selectDetailIngList(int rcpNo) {
		Connection conn = getConnection();

		ArrayList<IngredientList> ingredient = new RecipeDao().selectDetailIngList(conn, rcpNo);

		close(conn);

		return ingredient;
	}// e.selectDetailIngList

	/**
	 * 레시피 디테일 뷰에 DB 조리법 가져오기
	 * 
	 * @param rcpNo 레시피번호
	 * @return
	 */
	public ArrayList<Cook> selectDetailCookList(int rcpNo) {
		Connection conn = getConnection();

		ArrayList<Cook> cook = new RecipeDao().selectDetailCookList(conn, rcpNo);

		close(conn);

		return cook;

	}// e.
	/**
	 * 레시피 디테일뷰 화면에서 태그 목록 보여주는 것 
	 * @param rcpTags
	 * @return
	 */
	public ArrayList<Recipe> tagSearch(String[] rcpTags) {
		Connection conn = getConnection();

		ArrayList<Recipe> tags = new RecipeDao().tagSearch(conn, rcpTags);

		close(conn);

		return tags;
	}
	/**
	 * 레시피 작서 수정 하는 것 
	 * @param r
	 * @param ingList
	 * @param cookList
	 * @return
	 */
	public int updateRecipe(Recipe r, ArrayList<IngredientList> ingList, ArrayList<Cook> cookList) {
		Connection conn = getConnection();

		int result1 = new RecipeDao().updateRecipe(conn, r);
		
		int result2 = new RecipeDao().deleteIngredientList(conn, r.getRcpNo()); 
		int result3 = 0; 
		if(result2 > 0) {
			result3 = new RecipeDao().insertNewIngredientList(conn,ingList); 
			
			if(result2 > 0 && result3 > 0) {
				commit(conn);
			}else {
				rollBack(conn); 
			}
		}
		
		int result4 = new RecipeDao().deleteCook(conn,r.getRcpNo());
		int result5 = 0;
		if(result4>0) {
			
			result5 = new RecipeDao().insertNewCookDetail(conn, cookList);
			
			if(result4>0 && result5>0) {
				commit(conn);
			}else {
				rollBack(conn); 
			}
		}
		

		if (result1 > 0 && result2 > 0 && result3 > 0 && result4>0 && result5>0) {
			commit(conn);
		} else {
			rollBack(conn);
		}

		close(conn);
		return result1 * result2 * result3 * result4 * result5;
	}// e.insertRecipe
	/**
	 * 레시피 작성 한거 삭제 할때 status = 'N'
	 * @param rcpNo
	 * @return
	 */
	public int deleteRecipe(int rcpNo) {
		Connection conn = getConnection(); 
		
		int result = new RecipeDao().deleteRecipe(conn, rcpNo);

		if(result>0) {
			commit(conn);
		} else {
			rollBack(conn); 
		}
		close(conn);
		return result;
	}//e.deleteRecipe
	/**
	 * 레시피 게시글 갯수 조회용 
	 * @return 총갯수 
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		
		int listCount = new RecipeDao().selectListCount(conn);
		
		close(conn);
		
		return listCount; 
	}//e.selectListCount
	
	public ArrayList<Recipe> selectRecipeList(PageInfo pi){
		Connection conn = getConnection();
		
		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn, pi); 
		
		close(conn);
		
		return list; 
	}//e.selectList
	
	public ArrayList<Recipe> relationRecipe(String dishType){
		Connection conn = getConnection();

		ArrayList<Recipe> relation = new RecipeDao().relationRecipe(conn, dishType);
		
		close(conn);
		
		return relation; 
	}//e.relationRecipe
	
	public ArrayList<Recipe> myPage(int userNo){
		Connection conn = getConnection();
		
		ArrayList<Recipe> myPage = new RecipeDao().myPage(conn, userNo);
		
		close(conn);
		
		return myPage; 
	}

	public ArrayList<Recipe> todayRecipeList() {
		
		Connection conn = getConnection();
		
		ArrayList<Recipe> todaytodayRecommendedRecipe = new RecipeDao().todayRecipeList(conn);
		
		close(conn);
		
		return todaytodayRecommendedRecipe;
		
	}

	public ArrayList<Recipe> bestRecipeList() {

		Connection conn = getConnection();
		
		ArrayList<Recipe> bestRecipes = new RecipeDao().bestRecipeList(conn);
		
		close(conn);
		
		return bestRecipes;
		
	}
	
	public int insertReply(Reply re) {
		Connection conn = getConnection();
		
		int result = new RecipeDao().insertReply(conn, re);
		
		if(result>0) {
			commit(conn);
		} else {
			rollBack(conn); 
		}
		close(conn);
		
		return result; 
	}
	
	public ArrayList<Reply> selectReplyList(int bno){
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new RecipeDao().selectReplyList(conn, bno);
		
		close(conn);
		
		return list; 
	}
}
