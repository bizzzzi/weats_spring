package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.encrypt.SHA256;
import com.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
		
	@RequestMapping("/userJoin")
	public String userJoin(String user_name, String user_email, String user_pw
			, HttpSession session, RedirectAttributes rttr) {
		
		String salt = SHA256.generateSalt();
		user_pw = SHA256.getEncrypt(user_pw,salt);
		System.out.println(salt);
		System.out.println(user_pw);
		
		MemberDTO dto = new MemberDTO();
		dto.setUser_name(user_name);
		dto.setUser_email(user_email);
		dto.setUser_pw(user_pw);
		dto.setSalt(salt);
		
		int n = service.userJoin(dto);
		String next = null;
		if(n != 0) {
			String code = SHA256.getEncrypt(user_email, "cos");
			String localhost = "http://localhost:8080/weats/";
			String content = "다음 링크에 접속하여 이메일 인증  "
					+ "<a href='"+localhost+"checkEmail?code="+code+"'>이메일 인증하기</a>" ;
			
			String title = "weats 이메일 인증";
			session.setAttribute("tomail", user_email);
			session.setAttribute("code", code);
			rttr.addFlashAttribute("content", content);
			rttr.addFlashAttribute("title", title);
			next = "redirect:mailSending";
			
		} else {
			rttr.addFlashAttribute("mesg", "회원가입 실패, 다시 시도해주세요.");
			next = "redirect:/";
		}
		
		return next;
	}
	
	@RequestMapping(value="/emailCheck", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String emailCheck(String user_email) {
		int n = service.emailCheck(user_email);
		String mesg = "이메일 사용가능";
		if (n == 1) {
			mesg = "이메일 중복";
		}
		return mesg;
	}
	
	
}
