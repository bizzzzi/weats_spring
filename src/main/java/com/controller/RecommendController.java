package com.controller;

import com.dto.LeportsThumbnailDTO;
import com.service.LeportsService;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class RecommendController {

	@Autowired
	LeportsService leportsService;

	@RequestMapping(value="/Recommend")
	public String mainRecommend() {
		return "MainRecommend"; //MainRecommend.jsp
	}

	@RequestMapping(value="/RecommendList")
	public String topLeports(Model model) {
		List<LeportsThumbnailDTO> ratingList = leportsService.ratingTopLeports(); //레포츠 전체 출력(레포츠 아이디 중복 포함)
		List<LeportsThumbnailDTO> reserveList = leportsService.reserveTopLeports();
 		List<LeportsThumbnailDTO> xlist = new ArrayList<LeportsThumbnailDTO>(); //중복 제거해서 담을 리스트
 		List<LeportsThumbnailDTO> ylist = new ArrayList<LeportsThumbnailDTO>(); //중복 제거해서 담을 리스트
		if(ratingList.size() != 0) {
			LeportsThumbnailDTO xDto = ratingList.get(0); //전체 받아온 리스트에서 0번째 리스트를 dto객체에 주입
			LeportsThumbnailDTO yDto = reserveList.get(0); //전체 받아온 리스트에서 0번째 리스트를 dto객체에 주입
			xlist.add(xDto);//주입받은 객체를 중복 제거 할 리스트에 주입
			ylist.add(yDto);//주입받은 객체를 중복 제거 할 리스트에 주입
			for(LeportsThumbnailDTO x: ratingList) { //전체 리스트 사이즈만큼 반복
				if(!x.getLeports_id().equals(xDto.getLeports_id())) { //전체 리스트의 첫번 째 객체랑 주입받은 객체랑 비교
					xDto = x; //다르면 list에 있는 객체를 ddd에 대입
					xlist.add(xDto); //바뀐 ddd객체를 중복 제거 리스트에 주입
				}
			}
			for(LeportsThumbnailDTO y: reserveList) { //전체 리스트 사이즈만큼 반복
				if(!y.getLeports_id().equals(yDto.getLeports_id())) { //전체 리스트의 첫번 째 객체랑 주입받은 객체랑 비교
					yDto = y; //다르면 list에 있는 객체를 ddd에 대입
					ylist.add(yDto); //바뀐 ddd객체를 중복 제거 리스트에 주입
				}
			}
			List<LeportsThumbnailDTO> topRatingList = new ArrayList<>(xlist.subList(0,10)); //레포츠 데이터 쌓이면 12로 바꿔야함
			List<LeportsThumbnailDTO> topReserveList = new ArrayList<>(ylist.subList(0,10));//레포츠 데이터 쌓이면 12로 바꿔야함
			model.addAttribute("ratingList", topRatingList);
			model.addAttribute("reserveList", topReserveList);

		}
		return "MainRecommend"; //MainRecommend.jsp
	}
}
