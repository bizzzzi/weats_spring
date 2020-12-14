<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	MemberDTO dto=(MemberDTO)session.getAttribute("a");
    	String user_id="";
    	if(dto!=null){
    		user_id=dto.getUser_id();
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시판</h1>
	<form action="TradeWrite" method="POST" enctype="multipart/form-data">
		<input type="text" name="trade_title" placeholder="제목"/><br>
		<input type="text" name="trade_contents" placeholder="내용"/><br>
		<div class="radio">
			<span>판매</span>
            <input type="radio" name="trade_type" value="판매">
			<span>대여</span>
            <input type="radio" name="trade_type" value="대여">
        </div>	
		<input type="text" name="trade_loc" placeholder="지역"/><br>
		<input type="text" name="trade_phone" placeholder="연락처"/><br>
<%--		<div id="img_preview"><img alt="" src="fff.png"></div><br>--%>
		<input type="file" name="uploadFile" placeholder="메인 이미지" multiple><br>
		<input type="text" name="trade_user_name" placeholder="이름"/><br>
		<input type="text" name="trade_price" placeholder="가격"/><br>
		<input type="submit" value="글쓰기" class="uploadBtn">
		<input type="reset" value="취소하기">
	</form>
</body>
</html>
