<%@page import="java.util.List"%>
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
  <link rel="stylesheet" href="css/partner.css">
</head>
 <body>
  <header class="header">
    <a href="MainPartner">메인으로 이동</a>
    <h1 class="main_title">등록한 상품</h1>
    <hr>
  </header>
    <div class="product_control_table wrap">
      <ul class="thead subject">
        <li>상품 이미지 </li>
        <li>상품명 </li>
      </ul>
    <c:forEach var="ldto" items="${leportsAddList}" varStatus="status">
      <input type="hidden" name="leports_id" value="${ldto.leports_id}" />
      <ul class="tbody content">
        <li class="product_img product"><a href="ProductDetail?leports_id=${ldto.leports_id}">
            <img src="images/${ldto.leports_main_img}" alt="상품 대표 이미지" style="width:400px"></a></li>
        <li class="product_name product"><a href="ProductDetail?leports_id=${ldto.leports_id}">${ldto.leports_title} </a>
        </li>
      </ul>
  </div>
  </c:forEach>
 </body>
</html>