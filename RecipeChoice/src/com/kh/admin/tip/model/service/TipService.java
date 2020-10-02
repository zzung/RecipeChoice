package com.kh.admin.tip.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import static com.kh.user.common.JDBCTemplate.*;

import com.kh.admin.tip.model.dao.TipDao;
import com.kh.admin.tip.model.vo.Tip;

public class TipService {

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

}
