package com.kh.admin.tip.controller;

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

@WebServlet("/updateCareTip.mn")
public class CareTipUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareTipUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
	
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
				String savePath = request.getSession().getServletContext().getRealPath("/resources/careTip_upfiles/");
				
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
				
				
				int tipNo = Integer.parseInt(multiRequest.getParameter("tipNo"));
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
				t.setTipNo(tipNo);
				t.setTipTitle(tipTitle);
				t.setTipInfo(tipInfo);
				t.setTipIngredientTag(tipTagName);
				t.setTipContent(tipContent);
				if(multiRequest.getFilesystemName("reuploadTipPic")==null) {
					t.setTipPicture(multiRequest.getParameter("originTipPic"));
				}else {
					t.setTipPicture(multiRequest.getFilesystemName("reuploadTipPic"));
				}
				int result = new TipService().updateCareTip(t);
				
				if(result > 0) {
					request.setAttribute("alertMsg", "손질법 글 수정 성공 !");
					response.sendRedirect(request.getContextPath()+"/careTipDetail.tip?tno="+tipNo);
				}else {
					request.setAttribute("alertMsg", "손질법 글 수정 실패");
					request.getRequestDispatcher("views/tip/careTipList.jsp").forward(request, response);
				}
			}
			

		}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
