package com.kh.admin.management.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.management.model.service.ManagementService;
import com.kh.user.member.model.vo.Member;

@WebServlet("/changeStatus.mn")
public class ChangeStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeStatusServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userNo = Integer.parseInt(request.getParameter("uno"));
		Member m = new ManagementService().selectMember(userNo);
		
		// status : Y --> N
		if(m.getStatus().equals("Y")) {
			
			int result = new ManagementService().disableStatus(userNo);
			if(result>0) {
				request.getSession().setAttribute("alertMsg", "상태 변경 완료 !");
				response.sendRedirect(request.getContextPath()+"/memberDetail.mn?uno="+userNo);
			}else {
				request.getSession().setAttribute("alertMsg", "상태 변경에 실패했습니다 !");
				request.getRequestDispatcher(request.getContextPath()+"/memberList.mn").forward(request, response);
			}
		
		// status : N --> Y	
		}else { 
			
			int result = new ManagementService().enableStatus(userNo);
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "상태 변경 완료 !");
				response.sendRedirect(request.getContextPath()+"/memberDetail.mn?uno="+userNo);
			}else {
				request.setAttribute("alertMsg", "상태 변경에 실패했습니다 !");
				request.getRequestDispatcher("views/management/memberListManagement.jsp").forward(request, response);
			}
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
