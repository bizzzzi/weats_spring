package com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LeportsReserveController {
	
	@RequestMapping("/leportsReserve")
	public String reserve(HttpServletRequest request,
						  String main_img, String leports_title, String c_address, String c_detail_address,
						  String [] item_title, String [] personnelConut) {
//		String main_img = request.getParameter("main_img");
//		String leports_title = request.getParameter("leports_title");
//		String c_address = request.getParameter("c_address");
//		String c_detail_address = request.getParameter("c_detail_address");
//		String [] item_title = request.getParameterValues("item_title");
//		String [] personnelConut = request.getParameterValues("personnelConut");
		request.setAttribute("main_img", main_img);
		request.setAttribute("item_title", item_title);

		return "MainPayment";
	}
	
}

