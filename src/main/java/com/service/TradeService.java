package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dto.TradeCommentsDTO;
import org.apache.ibatis.session.SqlSession;
import com.dao.TradeDAO;
import com.dto.TradeDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TradeService {
	@Autowired
	TradeDAO dao;

	public List<TradeDTO> TradeList(String trade_type) {
		List<TradeDTO> list=dao.TradeList(trade_type);
		return list;
	}

	//tx처리 하
	public int TradeWrite(TradeDTO dto) {
		int num = dao.TradeWrite(dto);
		return num;
	}

	public List<TradeDTO> SelectSelf(String user_id) {
		List<TradeDTO> list=dao.SelectSelf(user_id);
		return list;
	}
	public TradeDTO TradeDetail(String trade_id) {
		TradeDTO dto=dao.TradeDetail(trade_id);
		return dto;
	}

	//tx 처리 하기
	public int CommentWrite(TradeCommentsDTO dto) {
		int num = dao.CommentWrite(dto);
		return num;
	}

	//tx 처리 하기
	public int ReCommentWrite(TradeCommentsDTO dto) {
		System.out.println("service대댓글"+dto);
		String trade_comment_id=dto.getTrade_comment_id();
		int num = dao.ReCommentWrite(dto);
		return num;
	}

	public List<TradeCommentsDTO> CommentList(String trade_id){
		List<TradeCommentsDTO> list=dao.CommentList(trade_id);
		System.out.println("service: 댓굴"+ list);
		return list;
	}


	public String CommentRegidate(String trade_comment_id) {
		String regidate=dao.CommentRegidate(trade_comment_id);
		return regidate;
	}

	//tx처리 하기
	public int CommentDel(String trade_comment_id) {
		int result=dao.CommentDel(trade_comment_id);
		return result;
	}
	//tx 처리하기
	public int CommentDel2(String trade_comment_level) {
		int result=dao.CommentDel2(trade_comment_level);
		return result;
	}

	public int CommentUpdate(HashMap<String,String> map){
		int result = dao.CommentUpdate(map);
		return result;
	}

	public int TradeDelete(String trade_id){
		int result = dao.TradeDelete(trade_id);
		return result;
	}

	public int TradeUpdate(TradeDTO dto){
		int result = dao.TradeUpdate(dto);
		return result;
	}
}
