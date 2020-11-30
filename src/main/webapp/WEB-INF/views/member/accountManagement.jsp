<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	MemberDTO dto = (MemberDTO) session.getAttribute("login");
	String username = dto.getUser_name();
	String useremail = dto.getUser_email();
%>
<form>
	<div class="userName">
		<span>이름:</span>
		<span><%=username %></span>
	</div>
	<div class="userEmail">
		<span>이메일</span>
		<span><%=useremail %></span>
	</div>
	<div>
		<a href="passwdCheckredirect?page=delete">회원탈퇴</a>
		<a href="passwdCheckredirect?page=pwchange">비밀번호 변경</a>
	</div>
</form>
