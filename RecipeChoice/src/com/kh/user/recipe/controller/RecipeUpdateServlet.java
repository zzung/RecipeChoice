package com.kh.user.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.user.common.MyFileRenamePolicy;
import com.kh.user.recipe.model.service.RecipeService;
import com.kh.user.recipe.model.vo.Cook;
import com.kh.user.recipe.model.vo.IngredientList;
import com.kh.user.recipe.model.vo.Recipe;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class RecipeUpdateServlet
 */
@WebServlet("/update.rp")
public class RecipeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 10 * 1024 * 1024;

			String savePath = request.getSession().getServletContext().getRealPath("/resources/recipe_upfiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			// 1.
			int userNo = Integer.parseInt(multiRequest.getParameter("userNo"));
			String memName = multiRequest.getParameter("memName");
			String rcpTitle = multiRequest.getParameter("title");
			String rcpDishType = multiRequest.getParameter("dishType");

			String[] rcpTags = multiRequest.getParameterValues("tag");
			String rcpTag = "";
			if (rcpTags != null) {
				rcpTag = String.join(",", rcpTags);
			}

			int rcpTime = Integer.parseInt(multiRequest.getParameter("time"));
			String rcpContent = multiRequest.getParameter("content");
			String rcpPic = multiRequest.getFilesystemName("reUpfile");
			
			Recipe r = new Recipe();
			if(multiRequest.getFilesystemName("reUpfile") != null) {
				
				r.setUserNo(userNo);
				r.setMemName(memName);
				r.setRcpTitle(rcpTitle);
				r.setRcpDishType(rcpDishType);
				r.setRcpTag(rcpTag);
				r.setRcpTime(rcpTime);
				r.setRcpContent(rcpContent);
				r.setRcpPic(multiRequest.getFilesystemName("reUpfile"));
				
				if(multiRequest.getParameter("originFileNo") != null) {
					r.setRcpNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					File deleteFile = new File(savePath + multiRequest.getParameter("originFileName"));
					deleteFile.delete(); 
				}
			}


			// 2.
			String[] ingDishs = multiRequest.getParameterValues("dish");
			String[] ingMeterings = multiRequest.getParameterValues("metering");

			ArrayList<IngredientList> ingList = new ArrayList<>();

			for (int i = 0; i < ingDishs.length; i++) {
				IngredientList ingredient = new IngredientList();
				ingredient.setIngDish(ingDishs[i]);
				ingredient.setIngMetering(ingMeterings[i]);

				ingList.add(ingredient);
			}

			// 3.
			String[] cookContents = multiRequest.getParameterValues("recipeDetail");
			ArrayList<Cook> cookList = new ArrayList<>();
			
			for(int i = 0; i<cookContents.length;i++) {
				String cookPic = multiRequest.getFilesystemName("reRecipeWritePic" + (i +1));

				Cook c = new Cook();
				
				if(multiRequest.getFilesystemName("reRecipeWritePic" + (i +1)) != null) {
					c.setCookContent(cookContents[i]);
					c.setCookOrder(i+1);
					c.setCookPic(cookPic);
					
					if(multiRequest.getParameter("cookOrder") != null) {
						c.setCookOrder(Integer.parseInt(multiRequest.getParameter("cookOrder")));
						
						File deleteFile = new File(savePath + multiRequest.getFilesystemName("cookPic"));
						deleteFile.delete(); 
					} else {
						c.setCookOrder(i+1);
					}
					
					cookList.add(c);

				}
				
			}
			
			int result = new RecipeService().insertRecipe(r, ingList, cookList);

			if (result > 0) {

				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "게시글 수정 완료되었습니다.");

				response.sendRedirect(request.getContextPath() + "/detail.rp?=rcpNo" + r.getRcpNo());

			} else {

				request.setAttribute("errorMsg", "작성글 등록에 실패하였습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);

				}

			} // e.if

		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
