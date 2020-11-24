<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	MemberDTO dto=(MemberDTO)session.getAttribute("login");
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
	<form action="TradeWrite" method="POST">
		<input type="hidden" name="user_id" value="<%=user_id%>">
		<input type="text" name="trade_title" placeholder="제목"/>
		<input type="text" name="trade_contents" placeholder="내용"/>
		<div class="radio">
			<span>판매</span>
            <input type="radio" name="trade_type" value="판매">
			<span>대여</span>
            <input type="radio" name="trade_type" value="대여">
        </div>	
		<input type="text" name="trade_loc" placeholder="지역"/>
		<input type="text" name="trade_phone" placeholder="연락처"/>
		<div id="img_preview"><img alt="" src="fff.png"></div>
		<input type="text" name="trade_main_img" placeholder="메인 이미지">
		<input type="text" name="trade_sub_img1" placeholder="이미지"/>
		<input type="text" name="trade_sub_img2" placeholder="이미지"/>
		<input type="text" name="trade_sub_img3" placeholder="이미지"/>
		<input type="text" name="trade_sub_img4" placeholder="이미지"/>
		<input type="text" name="trade_user_name" placeholder="이름"/>
		<input type="text" name="trade_price" placeholder="가격"/>
		<input type="submit" value="글쓰기">
		<input type="reset" value="취소하기">
	</form>
</body>
</html>