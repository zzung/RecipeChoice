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

@WebServlet("/updateKnowledge.mn")
public class KnowledgeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KnowledgeUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/knowledge_upfiles/");
			
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
			
			// 새로 이미지 업로드 할경우
			if(multiRequest.getOriginalFileName("reuploadTipPic") != null) {
				t.setTipPicture(multiRequest.getFilesystemName("reuploadTipPic"));
				
				// 기존의 파일 삭제
//				File deleteFile = new File(savePath + multiRequest.getParameter("reuploadTipPic"));
//				deleteFile.delete(); // 서버에 업로드 되어있던 기존 파일 삭제
			}else {
				t.setTipPicture(multiRequest.getFilesystemName("originTipPic"));
			}
			
			System.out.println(t);
			
			int result = new TipService().updateKnowledge(t);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "손질법 글 수정 성공 !");
				response.sendRedirect(request.getContextPath()+"/careTipDetail.mn?tno="+tipNo);
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
