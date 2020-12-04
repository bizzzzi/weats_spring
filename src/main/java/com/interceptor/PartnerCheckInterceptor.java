package com.interceptor;

import com.dto.MemberDTO;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class PartnerCheckInterceptor extends HandlerInterceptorAdapter {
	//	/partnerCheck/** 일반회원, 파트너 승인대기 중인 회원 접근 제한
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle(): partner_verify 체크");
		HttpSession session=request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		if(dto.getPartner_verify()!=2) {//파트너 키 검사
			session.setAttribute("mesg","파트너 등록이 필요합니다.");
			response.sendRedirect("../");
			return false;
		}else {//파트너키 ==2
			return true;//작업 계속 진행
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
	
}
