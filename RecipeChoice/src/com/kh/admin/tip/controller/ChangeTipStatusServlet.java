package com.kh.admin.tip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.management.model.service.ManagementService;
import com.kh.admin.tip.model.service.TipService;
import com.kh.user.member.model.vo.Member;

@WebServlet("/changeTipStatus.mn")
public class ChangeTipStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeTipStatusServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int tno = Integer.parseInt(request.getParameter("tno"));

		int result = new TipService().enableStatus(tno);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "상태 변경 완료 !");
			response.sendRedirect(request.getContextPath()+"/careTipList.mn?tno="+tno);
		}else {
			request.setAttribute("alertMsg", "상태 변경에 실패했습니다 !");
			request.getRequestDispatcher("views/tip/careTipList.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
