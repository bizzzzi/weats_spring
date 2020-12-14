package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.LeportsDetailDTO;
import com.dto.LeportsReviewDTO;
import com.dto.LeportsThumbnailDTO;

@Repository
public class LeportsDAO {
	
	@Autowired
	SqlSessionTemplate template;
	
	//레포츠 메인 페이지
	public List<LeportsThumbnailDTO> leportsList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return template.selectList("leportsList", map);
	}
	
	//레포츠 상세 페이지
	public List<LeportsDetailDTO> leportsDetail(String leports_id) {
		// TODO Auto-generated method stub
		System.out.println("DAO : "+leports_id);
		List<LeportsDetailDTO> list = template.selectList("leportsDetailSelect", leports_id);
		return list;
	}
	
	//레포츠 상세 페이지 리뷰 부분
	public List<LeportsReviewDTO> reviewAll(String leports_id) {
		// TODO Auto-generated method stub
		List<LeportsReviewDTO> list = template.selectList("reviewAll", leports_id);
		return list;
	}

	//리뷰 작성 시 리뷰 cnt 증가
	public void reviewCountUp(String leports_id) {
		template.update("reviewCountUp", leports_id);
	}


	public void reviewCountDown(String leports_id) {
		template.update("reviewCountDown", leports_id);
	}

    public List<LeportsThumbnailDTO> ratingTopLeports() {
		return template.selectList("ratingTopLeports");
    }

	public List<LeportsThumbnailDTO> reserveTopLeports() {
		return template.selectList("reserveTopLeports");
	}

	public void reserveCountUp(String leports_id) {
		template.update("reserveCountUp",leports_id);
	}

	public void reserveCountDown(String leports_id) {
		template.update("reserveCountDown", leports_id);
	}
}
