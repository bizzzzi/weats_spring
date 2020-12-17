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
	<script src="http://malsup.github.com/jquery.form.js"></script>
	<style>
		.uploadResult{
			display: flex;
			width: 30%;
		}
		.uploadResult li{
			width: 100%;
			margin: 10px;
		}
		.uploadResult li img{
			width: 100%;
		}
	</style>
</head>
<body>
	<h1>게시판</h1>
	<div class="uploadDIV">
		<form id="uploadForm" method="post" enctype="multipart/form-data">
			첫 등록된 이미지가 메인 이미지가 됩니다.
			<input type="file" name="uploadFile" class="file" multiple><br>
			<div>
				<ul class="uploadResult">
				</ul>
			</div>
		</form>

	</div>
	<form action="TradeWrite" method="POST" class="tradeForm">
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
		<input type="text" name="trade_user_name" placeholder="이름"/><br>
		<input type="text" name="trade_price" placeholder="가격"/><br>
		<div class="uploadBox">
			<input type="text" name="trade_main_img"><br>
		</div>
<%--		<input type="text" name="trade_sub_img1"><br>--%>
<%--		<input type="text" name="trade_sub_img2"><br>--%>
<%--		<input type="text" name="trade_sub_img3"><br>--%>
<%--		<input type="text" name="trade_sub_img4"><br>--%>
		<input type="submit" value="글쓰기" class="uploadBtn">
		<input type="reset" value="취소하기">
	</form>
</body>
</html>
