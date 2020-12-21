<%@page import="com.dto.PartnerDTO"%>
<%@page import="com.dto.MemberDTO"%>
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
    <h1 class="partner_title">상품 등록</h1>
  </header>
 
  <div class="partner_form">
    <form action="LeportsAdd" method="post" class="partnerAllForm">
   
   		<div class="formBox">
	        <div class="title">상품 이름 *</div>
	            <input type="text" name="leports_title" class="leports_title" placeholder="ex) 서핑강습 2시간">
	            <span id="result"></span>

        <div class="title">상품 소개 *</div>      
            <textarea name="leports_content" class="leports_content" cols="30" rows="7"></textarea>
    
	        <div class="title">대표 사진 *</div>     
	            <input class="leports_main_img" name="leports_main_img" type="file" accept="img/*" required>

        <div class="title">서브 사진</div>    
            <input class="leports_sub_img1" name="leports_sub_img1" type="file" accept="img/*">       
            <input class="leports_sub_img2" name="leports_sub_img2" type="file" accept="img/*">     
            <input class="leports_sub_img3" name="leports_sub_img3" type="file" accept="img/*">    
            <input class="leports_sub_img4" name="leports_sub_img4" type="file" accept="img/*">
  
	        <div class="title">지역 카테고리 *</div>      
	          <div>
	            <select name="leports_loc" class="leports_loc">
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
	              <option value="충청">충청북도</option>
	              <option value="충청">충청남도</option>
	              <option value="전라">전라북도</option>
	              <option value="전라">전라남도</option>
	              <option value="경상">경상북도</option>
	              <option value="경상">경상남도</option>
	              <option value="제주">제주도</option>
	            </select>
	          </div>

	        <div class="title">레포츠 카테고리 *</div>     
	          <div>
	            <select name="leports_type" class="leports_type">
	              <option value="지상">지상 레포츠</option>
	              <option value="수상">수상 레포츠</option>
	              <option value="항공">항공 레포츠</option>
	              <option value="실내">실내 레포츠</option>
	            </select>
	          </div>
	    </div>      
	    <div class="partnerBtn">
       		<input class="submitBtn" type="submit" disabled="disabled" value="다음" onclick="productNull()">
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
              $(".submitBtn").attr("disabled", "disabled");
            } else {
              $("#result").text(data);
              $(".submitBtn").removeAttr("disabled");
            }
          },
          erorr: function (xhr, status, error) {
            console.log("error");
          }
        });
      });
    });
  </script>
</body>
</html>
