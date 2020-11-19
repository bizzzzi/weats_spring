<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="header">
	<div class="logo">
		<h2><a href="main.jsp">Acorn</a></h2>
	</div>
	<ul class="nav">
		<li><a href="RecommendServlet">추천</a></li>
		<li class="topmenu"><a href="LeportsListServlet?category=byType">레포츠&nbsp;<i class="fas fa-angle-down"></i></a>
			<ul class="submenu">
				<li><a href="LeportsListServlet?category=byLoc">지역별 레포츠</a></li>
				<li><a href="LeportsListServlet?category=byType">종류별 레포츠</a></li>
			</ul>
		</li>
		<li class="topmenu"><a href="TradeListServlet">중고거래&nbsp;<i class="fas fa-angle-down"></i></a>
			<ul class="submenu">
				<li><a href="TradeListServlet?category=판매">판매</a></li>
				<li><a href="TradeListServlet?category=대여">대여</a></li>
			</ul>
		</li>
		<li><a href="#">고객센터</a></li>
	</ul>
	<div class="login">
		<a class="ico" href="#"><i class="fas fa-user-circle"></i></a>
<%
	MemberDTO dto = (MemberDTO)session.getAttribute("login");
   
   if(dto != null){
    String username = dto.getUser_name();
    int partner_verify = dto.getPartner_verify();
    if(partner_verify == 0){
%>
		안녕하세요.<%= username %>님.
		<div class="nav">
			<ul>
				<li class="mypageOpenBtn"><a href="MainMemberMyPage.jsp">마이페이지</a></li>
				<li><a href="MainPartnerForm.jsp">파트너등록</a></li>
				<li class="logoutOpenBtn"><a href="MemberLogoutServlet">로그아웃</a></li>
			</ul>
		</div>
<%
    }else{
%>
		안녕하세요.<%= username %>파트너님.
		<div class="nav">
			<ul>
				<li class="mypageOpenBtn"><a href="#">마이페이지</a></li>
				<li class="productRegisterOpenBtn"><a href="MainPartner.jsp">파트너 페이지</a></li>
				<li class="logoutOpenBtn"><a href="MemberLogoutServlet">로그아웃</a></li>
			</ul>
		</div>
<%
}}else{
%>
		<div class="nav">
			<ul>
				<li class="loginOpenBtn"><a href="#">로그인</a></li>
				<li class="signUpOpenBtn"><a href="#">회원가입</a></li>
				<!-- <li><a href="#">파트너 등록하기</a></li> -->
			</ul>
		</div>
<%
} //end if~else
%>
	</div>
</div>



		
		
