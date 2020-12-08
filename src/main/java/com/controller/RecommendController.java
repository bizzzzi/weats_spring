package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RecommendController {

	@RequestMapping(value="/Recommend")
	public String mainRecommend() {
		return "MainRecommend"; //MainRecommend.jsp
	}
}
