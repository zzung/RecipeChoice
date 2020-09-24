package com.kh.user.reply.model.service;

import static com.kh.user.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.user.reply.model.dao.ReplyDao;
import com.kh.user.reply.model.vo.Reply;

public class ReplyService {


	public int replyMaxCount(int bno, String boardType) {
		
		Connection conn = getConnection();
		
		int replyCount = new ReplyDao().replyMaxCount(conn, bno, boardType);
		
		close(conn);
		
		return replyCount;
	}

	public ArrayList<Reply> selectReplyList(int bno, String boardType, int start, int maxReply) {
		
		Connection conn = getConnection();
		
		ArrayList<Reply> replyList = new ReplyDao().selectReplyList(conn, bno, boardType, start, maxReply);
		
		close(conn);
		
		return replyList;
	}

	public int replyTopNo(int bno, String boardType) {
		
		Connection conn = getConnection();
		
		int topReplyNo = new ReplyDao().replyTopNo(conn, bno, boardType);
		
		close(conn);
		
		return topReplyNo;
	}

	public int replyUpdate(int replyNo, String replyContent) {
		
		Connection conn = getConnection();
		
		int result = new ReplyDao().replyUpdate(conn, replyNo, replyContent);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollBack(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteReply(int replyNo) {
		
		Connection conn = getConnection();
		
		int result = new ReplyDao().deleteReply(conn, replyNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollBack(conn);
		}
		
		close(conn);
		
		return result;
	}
	
}
