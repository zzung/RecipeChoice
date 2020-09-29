package com.kh.user.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.user.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class EditorImageUploadServlet
 */
@WebServlet("/editorImageUpload.bo")
public class EditorImageUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditorImageUploadServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/image/board/");
	    int size = 10 * 1024 * 1024; 
		
		String fileName = null;
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new MyFileRenamePolicy());
		@SuppressWarnings("rawtypes")
		Enumeration files = multi.getFileNames();
		
		ArrayList<String> urlList = new ArrayList<String>();
		
		while(files.hasMoreElements()) {
			String file = (String)files.nextElement(); 
			fileName = multi.getFilesystemName(file); 
			urlList.add("resources/image/board/" + fileName);
		}
		
		Gson gson = new Gson();
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(gson.toJson(urlList));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
