package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LeportsReserveController {
	
	@RequestMapping("/loginCheck/leportsReserve")
	public String reserve(Model model,
						  @ModelAttribute("main_img") String main_img, @ModelAttribute("leports_title") String leports_title,
						  @ModelAttribute("c_address") String c_address, @ModelAttribute("c_detail_address") String c_detail_address,
						  @ModelAttribute("totalPrice") String totalPrice, @ModelAttribute("reserveDay") String reserveDay,
						  @ModelAttribute("totalPersonnelConut") String totalPersonnelConut,
						  @RequestParam(value="item_name") List<String> item_title,
						  @RequestParam(value="items_price") List<String> item_price,
						  @RequestParam(value="reserve_count") List<String> reserve_count) {
		model.addAttribute("item_title", item_title);
		model.addAttribute("item_price", item_price);
		model.addAttribute("reserve_count", reserve_count);
		return "MainPayment";
	}
	
}

