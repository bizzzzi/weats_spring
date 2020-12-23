<%@page import="com.dto.LeportsItemDTO"%>
<%@page import="com.dto.LeportsDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
  <header class="header">
    <h1 class="partner_title">상품 상세페이지(파트너용)</h1>
  </header>
  <div class="partner_form" id="partner">
    <form method="post" class="partnerAllForm">
      <input type="hidden" name="leports_id" value="${ldto.leports_id}"> 
      <input type="hidden"  id="leports_loc" value="${ldto.leports_loc}"> 
      <input type="hidden"  id="leports_type" value="${ldto.leports_type}"> 
		<div class="formBox">
	        <div class="title">상품 이름*</div>        
	        <input type="text" name="leports_title" class="leports_title" value="${ldto.leports_title}">
	        <span id="result"></span>

	        <div class="title">상품 소개*</div>
	            <textarea name="leports_content" class="leports_content" cols="30"
	              rows="10">${ldto.leports_content}</textarea>

	        <div class="title">대표 사진*</div>
	            <input class="leports_main_img" name="leports_main_img" type="file" accept="img/*">

	        <div class="title">서브 사진</div>
	            <input class="leports_sub_img1" name="leports_sub_img1" type="file" accept="img/*">
	            <input class="leports_sub_img2" name="leports_sub_img2" type="file" accept="img/*">
	            <input class="leports_sub_img3" name="leports_sub_img3" type="file" accept="img/*">
	            <input class="leports_sub_img4" name="leports_sub_img4" type="file" accept="img/*">

			<div class="imageFlex">
				<img src="/weats/display?fileName=${ldto.leports_main_img}">
				<img src="/weats/display?fileName=${ldto.leports_sub_img1}">
				<img src="/weats/display?fileName=${ldto.leports_sub_img2}">
				<img src="/weats/display?fileName=${ldto.leports_sub_img3}">
				<img src="/weats/display?fileName=${ldto.leports_sub_img4}">
			</div>

	        <div class="title">지역 카테고리*</div>
	          <div>
	            <select name="leports_loc" id="locSelect" class="leports_loc">
	              <option value="시도">시도를 선택하세요.</option>
	              <option value="서울">서울특별시</option>
	              <option value="부산">부산광역시</option>
	              <option value="대구">대구광역시</option>
	              <option value="인천">인천광역시</option>
	              <option value="광주">광주광역시</option>
	              <option value="대전">대전광역시</option>
	              <option value="울산">울산광역시</option>
	              <option value="세종">세종특별자치시</option>
	              <option value="경기">경기도</option>
	              <option value="강원">강원도</option>
	              <option value="충청도">충청도</option>
	              <option value="전라도">전라도</option>
	              <option value="경상도">경상도</option>
	              <option value="제주">제주도</option>
	            </select>
	          </div>

	        <div class="title">레포츠 카테고리*</div>
	          <div>
	            <select name="leports_type" class="leports_type" id="typeSelect">
	              <option value="지상">지상 레포츠</option>
	              <option value="수상">수상 레포츠</option>
	              <option value="항공">항공 레포츠</option>
	              <option value="실내">실내 레포츠</option>
	            </select>
	          </div>
		</div>
      <c:forEach var="idto" items="${idto}">
      <div class="itemform">
	      <div class="item_wrap">
	      	<div class="formBox item">
		        <div class="title">레포츠 아이템 이름</div>
		          	<input type="hidden" name="leports_item_id" value="${idto.leports_item_id}">
		            <input type="text" name="leports_item_title" class="leports_item_title" value="${idto.leports_item_title}">
			</div>
			<div class="formBox item">
		        <div class="title">한줄 요약</div>
		        <input type="text" name="leports_summary" class="leports_summary" value="${idto.leports_summary}">
			</div>
		  </div>
	      <div class="item_wrap">	  
			<div class="formBox item">
		        <div class="title">가격(원)</div>
		        <input type="text" name="leports_price" class="leports_price" value="${idto.leports_price}">
			</div>
			<div class="formBox item">
		        <div class="title">최대 수용 인원</div>
		        <input type="number" name="leports_max_capacity" class="leports_max_capacity" value="${idto.leports_max_capacity}">
	      	</div>
	      </div>	
	  </div>    
      </c:forEach>
      
      <div class="partnerBtn info">
        <input class="submitBtn" type="submit" formaction="ProductUpdate" value="정보 수정" onclick="productNull()">
        <input class="cancleBtn" type="reset" value="작성 취소">
        <input class="deletetBtn" type="submit" formaction="loginCheck/CheckPartner?page=productDelete" value="상품 삭제">
      </div>
    </form>
  </div>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $(".leports_title").on("keyup", function () {
        $.ajax({
          url: 'titleDuplicateCheck',
          type: 'get',
          data: {
            title: $(".leports_title").val(),
          },
          dataType: "text",
          success: function (data, status, xhr) {
            if (data == "중복된 상품명입니다.") {
              console.log(data);
              $("#result").text(data);
            } else {
              $("#result").text(data);
            }
          },
          erorr: function (xhr, status, error) {
            console.log("error");
          }
        });
      });
    });
  </script>
  <script src="js/thumbnail.js"></script>
</body>
</html>
