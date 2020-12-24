<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
<title>weats</title>
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
	<form action="${path}/TradeUpdate" method="POST" class="tradeForm">
		<input type="hidden" name="trade_id" value="${dto.trade_id}"/>
		<h3>수정하기</h3>
		<hr>
		<div class="radio">
			<span>판매</span>
			<input type="radio" name="trade_type" class="trade_type" value="판매" <c:if test="${dto.trade_type eq '판매'}">checked</c:if>>
			<span>대여</span>
            <input type="radio" name="trade_type" class="trade_type" value="대여" <c:if test="${dto.trade_type eq '대여'}">checked</c:if>>
        </div>
		<br>
		<input type="text" class="form-control trade_title" name="trade_title" placeholder="제목을 입력해 주세요." value="${dto.trade_title}"/><br>
		<div class="trade_write_info">
			<input type="text" class="form-control trade_first_row_info trade_user_name" name="trade_user_name" placeholder="이름" value="${dto.trade_user_name}"/>
			<input type="text" class="form-control trade_phone" name="trade_phone" placeholder="연락처" value="${dto.trade_phone}"/>
		</div>
		<br>
		<textarea class="form-control trade_contents" rows="10" name="trade_contents" placeholder="내용을 입력해 주세요." >${dto.trade_contents}</textarea><br>
		<div class="trade_write_info">
			<input type="text" class="form-control trade_first_row_info trade_loc" name="trade_loc" placeholder="지역" value="${dto.trade_loc}"/>
			<input type="text" class="form-control trade_price" name="trade_price" placeholder="가격" value="${dto.trade_price}"/><br>
		</div>
		<div class="uploadDIV">
			<br>
			<form id="uploadForm" method="post" enctype="multipart/form-data">
				<div class="form-control" style="height: auto">
					<label for="ex_file" class="ex_file">업로드</label> 첫 등록된 이미지가 메인 이미지가 됩니다.
					<input type="file" name="uploadFile" class="file" multiple style="display: none" id="ex_file"><br>
					<div>
						<ul class="uploadResult">
							<c:if test="${dto.trade_main_img != null}">
								<li><img src="/weats/display?fileName=${dto.trade_main_img}"><span data-name="trade_main_img" data-file=\'${dto.trade_main_img}\' data-type="image">X</span></li>
							</c:if>
							<c:if test="${dto.trade_sub_img1 != null}">
								<li><img src="/weats/display?fileName=${dto.trade_sub_img1}"><span data-name="trade_sub_img1" data-file=\'${dto.trade_sub_img1}\' data-type="image">X</span></li>
							</c:if>
							<c:if test="${dto.trade_sub_img2 != null}">
								<li><img src="/weats/display?fileName=${dto.trade_sub_img2}"><span data-name="trade_sub_img2" data-file=\'${dto.trade_sub_img2}\' data-type="image">X</span></li>
							</c:if>
							<c:if test="${dto.trade_sub_img3 != null}">
								<li><img src="/weats/display?fileName=${dto.trade_sub_img3}"><span data-name="trade_sub_img3" data-file=\'${dto.trade_sub_img3}\' data-type="image">X</span></li>
							</c:if>
							<c:if test="${dto.trade_sub_img4 != null}">
								<li><img src="/weats/display?fileName=${dto.trade_sub_img4}"><span data-name="trade_sub_img4" data-file=\'${dto.trade_sub_img4}\' data-type="image">X</span></li>
							</c:if>
						</ul>
					</div>
					<div class="uploadBox" style="height: 0">
						<input type="hidden" name="trade_main_img" class="trade_main_img" value="${dto.trade_main_img}"><br>
						<input type="hidden" name="trade_sub_img1" value="${dto.trade_sub_img1}"><br>
						<input type="hidden" name="trade_sub_img2" value="${dto.trade_sub_img2}"><br>
						<input type="hidden" name="trade_sub_img3" value="${dto.trade_sub_img3}"><br>
						<input type="hidden" name="trade_sub_img4" value="${dto.trade_sub_img4}"><br>
					</div>
				</div>
				<div class="trade_btns">
					<input type="submit" class="btn btn-primary tradeSubmit" value="글쓰기">
					<input type="reset" class="btn btn-primary" value="취소하기">
				</div>
			</form>
		</div>

	</form>
</body>
</html>
