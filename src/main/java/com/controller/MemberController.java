package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.encrypt.SHA256;
import com.encrypt.UserVerify;
import com.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	UserVerify userVerify;

	@RequestMapping("/userJoin")
	public String userJoin(String user_name, String user_email, String user_pw
			, HttpSession session, RedirectAttributes rttr) {
		
		String salt = SHA256.generateSalt();
		user_pw = SHA256.getEncrypt(user_pw,salt);
		
		MemberDTO dto = new MemberDTO();
		dto.setUser_name(user_name);
		dto.setUser_email(user_email);
		dto.setUser_pw(user_pw);
		dto.setSalt(salt);
		
		int n = service.userJoin(dto);
		String next = null;
		if(n != 0) {
			String code = SHA256.getEncrypt(user_email, "cos");
			String localhost = "http://125.141.55.162:8080/weats/";
			String content = "다음 링크에 접속하여 이메일 인증  <a href='"+localhost+"join/checkEmail?code="+code+"'>이메일 인증하기</a>" ;
			
			String title = "weats 이메일 인증";
			session.setAttribute("tomail", user_email);
			session.setAttribute("code", code);
			rttr.addFlashAttribute("content", content);
			rttr.addFlashAttribute("title", title);
			next = "redirect:/mailSending";
			System.out.println("test");
		} else {
			rttr.addFlashAttribute("mesg", "회원가입 실패, 다시 시도해주세요.");
			next = "redirect:/";
		}
		System.out.println(next);
		return next;
	}

	@PostMapping("/findPasswd")
	public String findPasswd(String user_email, HttpSession session, RedirectAttributes rttr) {
		String code = SHA256.getEncrypt(user_email, "cos");
		String localhost = "http://125.141.55.162:8080/weats/";
		String content = "비밀번호를 변경하시려면 링크를 클릭해주세요.  <a href='"+localhost+"password/checkEmail?code="+code+"'>비밀번호 변경하기</a>" ;
		String title = "weats 비밀번호 찾기 이메일 인증";
		System.out.println("비밀번호 찾을 이메일 : "+user_email);
		session.setAttribute("tomail", user_email);
		session.setAttribute("code", code);
		rttr.addFlashAttribute("content", content);
		rttr.addFlashAttribute("title", title);
		return "redirect:/mailSending";
	}
	
	//이메일 전송 완료후 페이지
	@RequestMapping("/mailCheck")
	public String mailCheck(@ModelAttribute("user_email") String user_email) {
		return "mailCheck";
	}
	
	@RequestMapping(value="/emailCheck", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String emailCheck(String user_email) {
		int n = service.emailCheck(user_email);
		System.out.println(n);
		String mesg = "이메일 사용가능";
		if (n != 0) {
			mesg = "이메일 중복";
		}
		return mesg;
	}
	
	@RequestMapping("/login")
	public String login(String user_email, String user_pw, HttpSession session, RedirectAttributes rttr) {
		System.out.println(user_email+"\t"+user_pw);
		MemberDTO dto = userVerify.verify(user_email, user_pw);
		System.out.println(dto);
		String next = "";
		if(dto != null) {
			if(dto.getAdmin_verify() == 0 && dto.getUser_verify() == 1) {
			dto.setUser_pw(null);//session에 비밀번호 미저장
			rttr.addFlashAttribute("mesg", "로그인 성공");
			session.setAttribute("login", dto);
			next = "redirect:/PartnerKeyCheck"; /* 파트너 verify 컨트롤러로 이동하게 수정 필요 */
			} else if(dto.getAdmin_verify() == 0 && dto.getUser_verify() == 0 ){
				String code = SHA256.getEncrypt(dto.getUser_email(), "cos");
				String localhost = "http://125.141.55.162:8080/weats/";
				String content = "다음 링크에 접속하여 이메일 인증  <a href='"+localhost+"join/checkEmail?code="+code+"'>이메일 인증하기</a>" ;
				String title = "weats 이메일 인증";
				session.setAttribute("tomail", user_email);
				session.setAttribute("code", code);
				rttr.addFlashAttribute("content", content);
				rttr.addFlashAttribute("title", title);
				next = "redirect:/loginMailSending";
			} else if(dto.getAdmin_verify() == 1){
				dto.setUser_pw(null);//session에 비밀번호 미저장
				rttr.addFlashAttribute("mesg", "로그인 성공");
				session.setAttribute("login", dto);
				next = "redirect:/admin"; /* 파트너 verify 컨트롤러로 이동하게 수정 필요 */
			}
		} else {
			rttr.addFlashAttribute("mesg", "로그인 실패");
			next = "redirect:/";
		}
		return next;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {
		session.removeAttribute("login");
		rttr.addFlashAttribute("mesg", "로그아웃");
		return "redirect:/";
	}
	
}
