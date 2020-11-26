package com.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dto.LeportsDetailDTO;
import com.dto.LeportsReviewDTO;
import com.dto.LeportsThumbnailDTO;
import com.service.LeportsService;

@Controller
public class LeportsController {
	 
	@Autowired
	LeportsService service;
	
	@RequestMapping("/leportsList")
	public String leportsList(String category, String type, String loc, String selectAlign
			, HttpSession session, HttpServletRequest request) {
		
		if(type == null && loc == null) type = "all";
		
		request.setAttribute("align", selectAlign);
		session.setAttribute("category", category);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("loc", loc);
		
		List<LeportsThumbnailDTO> xxx = service.leportsList(map); //레포츠 전체 출력(레포츠 아이디 중복 포함)
		
		List<LeportsThumbnailDTO> list = new ArrayList<LeportsThumbnailDTO>(); //중복 제거해서 담을 리스트
		if(xxx.size() != 0) {
			LeportsThumbnailDTO dto = xxx.get(0); //전체 받아온 리스트에서 0번째 리스트를 dto객체에 주입
			list.add(dto);//주입받은 객체를 중복 제거 할 리스트에 주입
			for(LeportsThumbnailDTO x: xxx) { //전체 리스트 사이즈만큼 반복
				if(x.getLeports_id().equals(dto.getLeports_id())) { //전체 리스트의 첫번 째 객체랑 주입받은 객체랑 비교
				} else {
					dto = x; //다르면 list에 있는 객체를 ddd에 대입
					list.add(dto); //바뀐 ddd객체를 중복 제거 리스트에 주입
				}
			}
		}
		if(selectAlign == null || selectAlign.equals("defalut")) {
			System.out.println("null :  "+list);
		} else if(selectAlign.equals("maxPrice")) {
			Collections.sort(list, (a, b) -> b.getLeports_price() - a.getLeports_price());
		}else if(selectAlign.equals("minPrice")) {
			Collections.sort(list, (a, b) -> a.getLeports_price() - b.getLeports_price());
		} else if(selectAlign.equals("review")){
			Collections.sort(list, (a, b) -> b.getReview_cnt() - a.getReview_cnt());
		}
		
		request.setAttribute("leportsList", list);
		return "/MainLeports";
	}
	
	@RequestMapping("/leportsDetail")
	public String leportsDetail(String leports_id, HttpServletRequest request) {
		List<LeportsDetailDTO> list = service.leportsDetail(leports_id);
		request.setAttribute("leportsDetail", list);
		
		List<LeportsReviewDTO> reviewList = service.reviewAll(leports_id);
		request.setAttribute("leportsReview", reviewList);
		System.out.println(reviewList);
		
		return "/MainLeportsDetail";
	}
}
