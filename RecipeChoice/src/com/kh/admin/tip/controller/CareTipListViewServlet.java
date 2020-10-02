package com.kh.admin.tip.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.tip.model.service.TipService;
import com.kh.admin.tip.model.vo.Tip;

@WebServlet("/careTipList.mn")
public class CareTipListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CareTipListViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Tip> careTipList = new TipService().selectCareTipList();
		System.out.println(careTipList);
		
		request.setAttribute("careTipList", careTipList);
		request.getRequestDispatcher("views/tip/careTipList.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
