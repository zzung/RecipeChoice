package com.kh.admin.tip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;

@WebServlet("/deleteCareTip.mn")
public class CareTipDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareTipDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int tipNo = Integer.parseInt(request.getParameter("tno"));
		
		int result = new TipService().deleteCareTip(tipNo);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "글 삭제 성공 !");
			response.sendRedirect(request.getContextPath() + "/careTipList.mn");
		}else {
			request.setAttribute("alertMsg", "글 삭제 실패");
			request.getRequestDispatcher(request.getContextPath()+"/careTipList.mn").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
