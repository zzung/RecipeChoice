package com.kh.admin.tip.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;

@WebServlet("/careTipDetail.mn")
public class CareTipDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareTipDetailViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int tipNo = Integer.parseInt(request.getParameter("tno"));
		
		Tip t = new TipService().selectCareTip(tipNo);
		System.out.println(t);
		request.setAttribute("t", t);
		request.getRequestDispatcher("views/tip/careTipDetail.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
