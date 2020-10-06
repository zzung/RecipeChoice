package com.kh.admin.tip.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;
import com.kh.user.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/insertCareTip.mn")
public class CareTipInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareTipInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 10 * 1024 * 1024;

			String savePath = request.getSession().getServletContext().getRealPath("/resources/careTip_upfiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			String tipPic = multiRequest.getFilesystemName("tipPic");
			
			String tipTitle = multiRequest.getParameter("tipTitle");
			String tipInfo = multiRequest.getParameter("tipInfo");
			String tipContent = multiRequest.getParameter("summernote");
			
			String tipTag1 = multiRequest.getParameter("tipTag1");
			String tipTag2 = multiRequest.getParameter("tipTag2");
			String tipTag3 = multiRequest.getParameter("tipTag3");
			
			String tipTagName = "";
			
			if(!tipTag1.equals("null")) {
				tipTagName += tipTag1;
			}
			if(!tipTag2.equals("null")) {
				tipTagName += ","+tipTag2;
			}
			if(!tipTag3.equals("null")) {
				tipTagName += ","+tipTag3;
			}
			
			if(tipTagName.equals("")) {
				tipTagName="선택없음";
			}
			
			Tip t = new Tip();
			t.setTipTitle(tipTitle);
			t.setTipInfo(tipInfo);
			t.setTipIngredientTag(tipTagName);
			t.setTipPicture(tipPic);
			t.setTipContent(tipContent);
			
			int result = new TipService().insertCareTip(t);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "손질법 게시판에 글등록 성공!");
				response.sendRedirect(request.getContextPath()+"/careTipList.mn");
			}else {
				request.setAttribute("alertMsg","손질법 게시판에 글등록 실패");
				request.getRequestDispatcher("views/tip/careTipList.jsp").forward(request, response);
				
				if (t != null) {
					File failedFile = new File(savePath + t.getTipPicture());
					failedFile.delete();
				}
	
			}
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
