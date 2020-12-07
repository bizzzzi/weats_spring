<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form>
   <div><!-- 메인이미지 넣을공간 -->
      <img src="#" />
   </div>
   <c:forEach var="review" items="${reviewList}" varStatus="statue">
      ${review.leports_title}<br>

   </c:forEach>
   레포츠타이틀<br>
   내가준평점<br>
   리뷰작성날짜<br>
   <input type="button" value="리뷰수정" />
   <input type="button" value="리뷰삭제" />
</form>
