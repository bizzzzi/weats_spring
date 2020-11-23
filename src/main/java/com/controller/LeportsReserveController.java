package com.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LeportsReserveController {
	
	@RequestMapping("/leportsReserve")
	public String reserve(@RequestParam Map<String, ?> map) {
		System.out.println(map);
		
		return null;
	}
	
}
