package com.kh.admin.tip.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.kh.user.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/tipEditorImageUpload.mn")
public class CareTipEditorImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CareTipEditorImageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/ggulTip_upfiles/summernote");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			Enumeration files = multiRequest.getFileNames();
			String file = (String)files.nextElement();
			String fileName = multiRequest.getFilesystemName(file);
			
			String uploadPath = request.getContextPath()+"/resources/ggulTip_upfiles/summernote/"+fileName;
			
			JSONObject job = new JSONObject();
			job.put("url", uploadPath);
			response.setContentType("application/json");
			response.getWriter().print(job.toJSONString());
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
