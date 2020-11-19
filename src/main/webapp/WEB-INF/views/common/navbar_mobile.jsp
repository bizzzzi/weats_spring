<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="navbarM">
	<ul class="navbarM_menu">
		<li><a href="#">추천</a></li>
		<li class="topmenuM_leports"><a href="LeportsListServlet?category=byType">레포츠&nbsp;<i class="fas fa-angle-down"></i></a>
			<ul class="submenuM_leports">
				<li><a href="LeportsListServlet?category=byType">종류별 레포츠</a></li>
				<li><a href="LeportsListServlet?category=byRegion">지역별 레포츠</a></li>
			</ul>
		</li>
		<li class="topmenuM_trade"><a href="#">중고거래&nbsp;<i class="fas fa-angle-down"></i></a>
			<ul class="submenuM_trade">
				<li><a href="#">판매</a></li>
				<li><a href="#">구매</a></li>
				<li><a href="#">대여</a></li>
			</ul>
		</li>
		<li><a href="#">고객센터</a></li>
	</ul>
	<div class="navbarM_login">
		<a href="#">로그인</a>
	</div>
	<div class="navbarM_signUp">
		<a href="#">회원가입</a>
	</div>
</div>