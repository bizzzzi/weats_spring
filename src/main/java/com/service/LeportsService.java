package com.service;
import java.util.List;
import java.util.Map;

import com.dto.KakaoPayDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.LeportsDAO;
import com.dto.LeportsDetailDTO;
import com.dto.LeportsReviewDTO;
import com.dto.LeportsThumbnailDTO;

@Service
public class LeportsService {
	
	@Autowired
	LeportsDAO dao;
	
	//레포츠 메인페이지에 들어갈 데이터
	public List<LeportsThumbnailDTO> leportsList(Map<String, String> map) {
		// TODO Auto-generated method stub
		System.out.println(map);
		return dao.leportsList(map);
	}

	//레포츠 상세 페이지에 들어갈 데이터 
	public List<LeportsDetailDTO> leportsDetail(String leports_id) {
		// TODO Auto-generated method stub
		List<LeportsDetailDTO> list = null;
		list = dao.leportsDetail(leports_id);
		return list;
	}
	
	
	//레포츠 상세페이지 리뷰 데이터
	public List<LeportsReviewDTO> reviewAll(String leports_id) {
		List<LeportsReviewDTO> list = null;
		
			list = dao.reviewAll(leports_id);
		return list;
	}

}
