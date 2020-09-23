package com.kh.user.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.kh.user.board.model.service.BoardService;
import com.kh.user.board.model.vo.Reply;

/**
 * Servlet implementation class ReplyAppendServlet
 */
@WebServlet("/replyAppend.bo")
public class ReplyAppendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyAppendServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int topReplyNo = Integer.parseInt(request.getParameter("topReplyNo"));
		int replyCount = Integer.parseInt(request.getParameter("replyCount"));
		int maxReply = Integer.parseInt(request.getParameter("maxReply"));
		
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		
		int replyCountUpdate = new BoardService().replyMaxCount(bno);
		
		request.setAttribute("replyCount", replyCountUpdate);
		
		if(replyCount == replyCountUpdate) {
			int topReplyNoUpdate = new BoardService().replyTopNo(bno);
			
			if(topReplyNo == topReplyNoUpdate) {
				replyList = new BoardService().selectReplyList(bno, maxReply + 1, maxReply + 10);
			} else {
				topReplyNo = topReplyNoUpdate;
				replyList = new BoardService().selectReplyList(bno, 1, maxReply + 10);
			}
			
		} else {
			replyCount = replyCountUpdate;
			replyList = new BoardService().selectReplyList(bno, 1, maxReply + 10);
		}
		
		Gson gson = new Gson();
		
		JsonArray jsonArray = new JsonArray();
		
		jsonArray.add(gson.toJson(replyList));
		jsonArray.add(gson.toJson(topReplyNo));
		jsonArray.add(gson.toJson(replyCount));
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jsonArray);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
