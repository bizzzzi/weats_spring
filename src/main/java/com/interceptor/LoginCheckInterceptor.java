package com.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Map;

@Component
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	//	/loginCheck/** 장바구니, 마이페이지, 장바구니에서 삭제, 수량 업데이트, 주문 등 회원 전용 메뉴에서 선동작
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle() 호출");
		HttpSession session=request.getSession();
		if(session.getAttribute("login")==null) {//로그인 검사
			session.setAttribute("mesg","로그인이 필요합니다.");
			response.sendRedirect("../");
			//loginForm_desktop.jsp
			return false;
		}else {
			return true;//로그인 정보가 있는 경우 작업 계속 진행
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
