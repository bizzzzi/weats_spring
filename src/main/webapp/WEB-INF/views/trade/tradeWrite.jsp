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
			width: 100%;
			margin-top: 30px;
		}
		.uploadResult li{
			width: 30%;
			margin: 10px;
		}
		.uploadResult li img{
			width: 100%;
			height: 60%;
			object-fit: cover;
		}
		.ex_file{
			color: black;
			border: 1px solid rgba(0, 0, 0, 0.15);
			border-radius: 0.25rem;
			background-clip: padding-box;
			margin: 0;
			padding: 1px 10px;
		}

	</style>
</head>
<body>
	<form action="TradeWrite" method="POST" class="tradeForm">
		<h3>중고거래 글쓰기</h3>
		<hr>
		<div class="radio">
			<span>판매</span>
            <input type="radio" name="trade_type" value="판매">
			<span>대여</span>
            <input type="radio" name="trade_type" value="대여">
        </div>
		<br>
		<input type="text" class="form-control" name="trade_title" placeholder="제목을 입력해 주세요."/><br>
		<div class="trade_write_info">
			<input type="text" class="form-control trade_first_row_info" name="trade_loc" placeholder="지역"/>
			<input type="text" class="form-control" name="trade_phone" placeholder="연락처"/>
		</div>
		<br>
		<textarea class="form-control" rows="10" name="trade_contents" placeholder="내용을 입력해 주세요."></textarea><br>
		<div class="trade_write_info">
			<input type="text" class="form-control trade_first_row_info" name="trade_user_name" placeholder="이름"/>
			<input type="text" class="form-control" name="trade_price" placeholder="가격"/><br>
		</div>
		<div class="uploadDIV">
			<br>
			<form id="uploadForm" method="post" enctype="multipart/form-data">
				<div class="form-control" style="height: auto">
					<label for="ex_file" class="ex_file">업로드</label> 첫 등록된 이미지가 메인 이미지가 됩니다.
					<input type="file" name="uploadFile" class="file" multiple style="display: none" id="ex_file"><br>
					<div>
						<ul class="uploadResult">
						</ul>
					</div>
					<div class="uploadBox" style="height: 0">
						<input type="hidden" name="trade_main_img"><br>
						<input type="hidden" name="trade_sub_img1"><br>
						<input type="hidden" name="trade_sub_img2"><br>
						<input type="hidden" name="trade_sub_img3"><br>
						<input type="hidden" name="trade_sub_img4"><br>
					</div>
				</div>
				<div class="trade_btns">
					<input type="submit" class="btn btn-primary" value="글쓰기">
					<input type="reset" class="btn btn-primary" value="취소하기">
				</div>
			</form>
		</div>

	</form>
</body>
</html>
