<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO dto = (MemberDTO) session.getAttribute("login");
	String username = dto.getUser_name();
%>
<b><%= username %> 님의 마이페이지</b><br>
<a href="MainAccountManagement.jsp">계정관리</a>
<a href="MyPageServlet?page='reserve'">나의 예약내역</a>
<a href="MyPageServlet?page='trade'">나의중고거래</a>
<a href="MyPageServlet?page='qna'">나의문의내역</a>
		