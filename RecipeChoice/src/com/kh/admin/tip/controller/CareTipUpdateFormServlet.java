package com.kh.admin.tip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;

@WebServlet("/updateFormCareTip.mn")
public class CareTipUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareTipUpdateFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int tno = Integer.parseInt(request.getParameter("tno"));
		
		Tip t = new TipService().selectCareTip(tno);
		
		request.setAttribute("t", t);
		request.getRequestDispatcher("views/tip/careTipUpdateForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
