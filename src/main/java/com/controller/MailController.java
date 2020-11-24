package com.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.encrypt.SHA256;
import com.service.MemberService;

@Controller
public class MailController {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/mailSending")
	public void mailSending(HttpServletRequest request, HttpSession session) {
		System.out.println("test1");
		String setfrom = "weats";
		String tomail = "";
		String title = "";
		String content = "";
		
		Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
		System.out.println(redirectMap);
		if(redirectMap != null) {
			System.out.println("test2");
			tomail = (String)session.getAttribute("tomail");
			title = (String) redirectMap.get("title");
			content = (String) redirectMap.get("content");
			System.out.println("mainSending");
		}
		
		try {
			System.out.println("test3");
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println("test4");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/checkEmail")
	public String mailCheck(HttpSession session, RedirectAttributes rttr) {
		String user_email = (String) session.getAttribute("tomail");
		String code = (String) session.getAttribute("code");
		
		boolean rightCode = SHA256.getEncrypt(user_email, "cos").equals(code) ? true : false;
		String next = "";
		if(rightCode) {
			System.out.println(user_email);
			service.user_verifyUpdate(user_email);
			rttr.addFlashAttribute("mesg", "회원가입 성공");
			session.removeAttribute("tomail");
			session.removeAttribute("code");
			next = "redirect:/";
		} else {
			next = "mailSending";
		}
		return next;
	}
}
