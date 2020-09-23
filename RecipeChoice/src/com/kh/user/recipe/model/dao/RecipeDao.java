package com.kh.user.recipe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import static com.kh.user.common.JDBCTemplate.*;

public class RecipeDao {

	private Properties prop = new Properties(); 
	
	public RecipeDao() {
		
		String fileName = RecipeDao.class.getResource("/sql/recipe/recipe-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}//e.RecipeDao
	
}
