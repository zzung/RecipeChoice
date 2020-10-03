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
	 * 레시피 화면 밑에 랜덤으로 추천 4가지 뜨게끔
	 * 
	 * @return
	 */
	public ArrayList<Recipe> selectRecipeList() {
		Connection conn = getConnection();

		ArrayList<Recipe> list = new RecipeDao().selectRecipeList(conn);

		close(conn);

		return list;

	}

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

	public ArrayList<Recipe> tagSearch(String[] rcpTags) {
		Connection conn = getConnection();

		ArrayList<Recipe> tags = new RecipeDao().tagSearch(conn, rcpTags);

		close(conn);

		return tags;
	}

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
	
	public int deleteContent(int rcpNo) {
		Connection conn = getConnection(); 
		
		int result1 = new RecipeDao().deleteRecipe(conn, rcpNo);
		int result2 = new RecipeDao().deleteIngredientList(conn, rcpNo);
		int result3 = new RecipeDao().deleteCook(conn, rcpNo); 
		
		if(result1>0 && result2>0 && result3>0) {
			commit(conn);
		} else {
			rollBack(conn); 
		}
		close(conn);
		return result1*result2*result3; 
	}
}
