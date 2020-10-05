package com.kh.admin.tip.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.user.common.JDBCTemplate.*;

import com.kh.admin.tip.model.dao.TipDao;
import com.kh.admin.tip.model.vo.Tip;

public class TipService {

	/*------------------- 재료손질법 게시판 관련 -----------------------------*/
	
	public ArrayList<Tip> selectCareTipList() {
		
		Connection conn = getConnection();
		ArrayList<Tip> careTipList = new TipDao().selectCareTipList(conn);
		
		return careTipList;
	}

	public Tip selectCareTip(int tipNo) {

		Connection conn = getConnection();
		Tip t = new TipDao().selectCareTip(conn,tipNo);
		
		return t;
	}

	public int insertCareTip(Tip t) {

		Connection conn = getConnection();
		int result = new TipDao().insertCareTip(conn, t);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateCareTip(Tip t) {

		Connection conn = getConnection();
		int result = new TipDao().updateCareTip(conn, t);
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteCareTip(int tipNo) {

		Connection conn = getConnection();
		int result = new TipDao().deleteCareTip(conn,tipNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public int enableStatus(int tno) {
		
		Connection conn = getConnection();
		int result = new TipDao().enableStatus(conn, tno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public int increaseTipCount(int tno) {

		Connection conn = getConnection();
		int result = new TipDao().increaseTipCount(conn,tno);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	
	/*------------------- 재료에 대한 상식 게시판 관련 -----------------------------*/
	
	public ArrayList<Tip> selectKnowledgeList() {

		Connection conn = getConnection();
		ArrayList<Tip> knowledgeList = new TipDao().selectKnowledgeList(conn);
		
		return knowledgeList;
	}

	public Tip selectKnowledge(int tno) {

		Connection conn = getConnection();
		Tip t = new TipDao().selectKnowledge(conn, tno);
		
		return t;
	}

	public int updateKnowledge(Tip t) {

		Connection conn = getConnection();
		int result = new TipDao().updateKnowledge(conn, t);
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertKnowledge(Tip t) {

		Connection conn = getConnection();
		int result = new TipDao().insertKnowledge(conn, t);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteKnowledge(int tipNo) {
		
		Connection conn = getConnection();
		int result = new TipDao().deleteKnowledge(conn,tipNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollBack(conn);
		}
		close(conn);
		
		return result;
	}


}
