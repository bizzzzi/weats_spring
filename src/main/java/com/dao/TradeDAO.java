package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dto.TradeCommentsDTO;
import com.dto.TradeDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TradeDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public List<TradeDTO> TradeList(String trade_type) {
		List<TradeDTO> list=template.selectList("selectTrade",trade_type);
		return list;
	}
	public int TradeWrite(TradeDTO dto) {
		int num = template.insert("tradeWrite",dto);
		return num;
	}
	public List<TradeDTO> SelectSelf(String user_id) {
		List<TradeDTO> list=template.selectList("selectSelf",user_id);
		return list;
	}
	public TradeDTO TradeDetail(String trade_id){
		TradeDTO dto=template.selectOne("selectItem",trade_id);
		return dto;
	}
	public int CommentWrite(TradeCommentsDTO dto) {
		int num=template.insert("CommentWrite",dto);
		return num;
	}
	public int ReCommentWrite(TradeCommentsDTO dto) {
		System.out.println("dao대댓글"+dto);
		return template.insert("ReCommentWrite",dto);
	}
	public List<TradeCommentsDTO> CommentList(String trade_id) {
		List<TradeCommentsDTO> list=template.selectList("CommentList",trade_id);
		return list;
	}
	public String CommentRegidate(String trade_comment_id) {
		String regidate=template.selectOne("CommentRegidate",trade_comment_id);
		return regidate;
	}
	
	public int CommentDel(String trade_comment_id) {
		int result=template.delete("CommentDel",trade_comment_id);
		return result;
	}
	
	public int CommentDel2(String trade_comment_level) {
		int result=template.delete("CommentDel2",trade_comment_level);
		return result;
	}

	public int CommentUpdate(HashMap<String,String> map){
		int result = template.insert("CommentUpdate",map);
		return result;
	}
	
}
