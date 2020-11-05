package com.kh.user.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.user.common.MyFileRenamePolicy;
import com.kh.user.member.model.service.MemberService;
import com.kh.user.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(ServletFileUpload.isMultipartContent(request)) {
		// 용량제한
			int maxSize = 10 * 1024 * 1024 ;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/member_upfiles/");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

				String userName = multiRequest.getParameter("userName");
				String userId = multiRequest.getParameter("userId");
				String userPwd = multiRequest.getParameter("userPwd");
				String email = multiRequest.getParameter("email");
				
			if(multiRequest.getOriginalFileName("upfile")!= null) { // 넘어온 첨부파일이 있다면
				String memPic = multiRequest.getFilesystemName("upfile"); // 실제 서버에 저장된 수정명
				Member m = new Member (userId,userPwd,userName,email,memPic);
				
				Member updateMem = new MemberService().updateMember(m);
				
					if(updateMem != null) { // 정보변경 성공
						
						HttpSession session = request.getSession();
						
						session.setAttribute("loginUser", updateMem);
						
						session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
						response.sendRedirect(request.getContextPath() + "/updateForm2.me");
						
						
					}else { // 실패
						
						request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
						
						RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
						view.forward(request, response);
					}
					
					
			} else { // 이미지 파일 없을 때 수정
				
			
				Member m = new Member (userId,userPwd,userName,email);
				
				Member updateMem = new MemberService().updateMember(m);
				
				if(updateMem != null) { // 정보변경 성공
					
					HttpSession session = request.getSession();
					
					session.setAttribute("loginUser", updateMem);
					
					session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
					
					
					response.sendRedirect(request.getContextPath() + "/updateForm2.me");
					
					
				}else { // 실패
					
					request.setAttribute("errorMsg", "회원정보 수정에 실패했습니다.");
					
					RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
					view.forward(request, response);
				}
			}
		
			
		}	
	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
