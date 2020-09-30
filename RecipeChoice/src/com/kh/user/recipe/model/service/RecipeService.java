package com.kh.user.recipe.model.service;

import static com.kh.user.common.JDBCTemplate.commit;
import static com.kh.user.common.JDBCTemplate.getConnection;
import static com.kh.user.common.JDBCTemplate.rollBack;
import static com.kh.user.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.user.recipe.model.dao.RecipeDao;
import com.kh.user.recipe.model.vo.Cook;
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.Recipe;

public class RecipeService {
	/**
	 * 레시피 작성
	 * @param r 			레시피 적성 전반적인 내용/대표이미지
	 * @param ingredient	재료리스트에 들어갈 내용들
	 * @param c				재료 순서 등 디데일 내용 
	 * @return
	 */
		public int insertRecipe(Recipe r, ArrayList<IngredientList> ingList, ArrayList<Cook> cookList) {
		Connection conn = getConnection();
		
		int result1 = new RecipeDao().insertRecipe(conn, r);
		int result2 = new RecipeDao().insertIngredientList(conn, ingList);
		int result3 = new RecipeDao().insertCookDetail(conn, cookList); 
		
		
		if(result1>0 && result2>0 && result3>0) {
			commit(conn);
		} else {
			rollBack(conn); 
		}
		
			close(conn); 
		return result1*result2*result3;
	}// e.insertRecipe
		/**
		 * 레시피 화면 밑에 랜덤으로 추천 4가지 뜨게끔 
		 * @return
		 */
		public ArrayList<Recipe> selectRecipeList(){
			Connection conn = getConnection(); 
			
			ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn);
			
			close(conn);
			
			return list; 
			
		}
		/**
		 * 레시피 화면 총 게시글 보여주기 위한 조회
		 * @return
		 */
		public int totalCount() {
			Connection conn = getConnection();
			
			int totalCount = new RecipeDao().totalCount(conn);
			
			close(conn);
			
			return totalCount; 
		} //e.totalCount
		
		/**
		 * 레시피 디테일 뷰 에서 레시피 DB에서 가져오기 
		 * @param rcpNo
		 * @return
		 */
		public Recipe selectDetailRecipeList(int rcpNo) {
			Connection conn = getConnection();
			
			Recipe r = new RecipeDao().selectDetailRecipeList(conn, rcpNo);
			
			close(conn); 
			
			return r; 
		}//e. selectRecipeList
		/**
		 * 레시피 디테일 뷰에서 DB 재료리스트에서 가져오기 
		 * @param rcpNo
		 * @return
		 */
		public ArrayList<IngredientList> selectDetailIngList(int rcpNo){
			Connection conn = getConnection();
			
			ArrayList<IngredientList> ingredient = new RecipeDao().selectDetailIngList(conn, rcpNo); 
			
			close(conn);
			
			return ingredient; 
		}//e.selectDetailIngList
}
