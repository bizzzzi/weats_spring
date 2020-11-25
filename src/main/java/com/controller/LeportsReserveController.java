package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;

@Controller
public class LeportsReserveController {
	
	@RequestMapping("/leportsReserve")
	public String reserve(HttpServletRequest request,
						  @ModelAttribute("main_img") String main_img, @ModelAttribute("leports_title") String leports_title,
						  @ModelAttribute("c_address") String c_address, @ModelAttribute("c_detail_address") String c_detail_address,
						  @ModelAttribute("totalPrice") String totalPrice, @ModelAttribute("reserveDay") String reserveDay,
						  @RequestParam(value="item_name") List<String> item_title,
						  @RequestParam(value="items_price") List<String> item_price,
						  @RequestParam(value="reserve_count") List<String> reserve_count) {
		request.setAttribute("item_title", item_title);
		request.setAttribute("item_price", item_price);
		request.setAttribute("reserve_count", reserve_count);
		return "MainPayment";
	}
	
}

