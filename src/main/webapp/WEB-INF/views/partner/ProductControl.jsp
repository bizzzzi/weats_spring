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
</head>
<body>
<a href="MainPartner">파트너 메인</a>
<h1 class="main_title">등록한 상품</h1>
  <hr>
  <div class="product_control_table">
    <ul class="subject">
      <li>상품 이미지</li>
      <li>상품명</li>
    </ul>
   <%--  <%
/*     LeportsDTO ldto=(LeportsDTO)session.getAttribute("leports");
    String leports_id=ldto.getLeports_id(); */
    
	List<LeportsDTO> list=(List<LeportsDTO>)session.getAttribute("leports_list");
	for(int i=0; i<list.size(); i++){
		LeportsDTO dto=list.get(i);
	String leports_title=dto.getLeports_title();
	String leports_main_img=dto.getLeports_main_img();
	String leports_id=dto.getLeports_id();
%> --%>
<c:forEach var="ldto" items="${leportsAddList}" varStatus="status">
<input type="hidden" name="leports_id" value="${ldto.leports_id}">
    <ul class="content">
      <li class="product_img"><a href="ProductDetail?leports_id=${ldto.leports_id}"><img src="images/${ldto.leports_main_img}" alt="상품 대표 이미지" style="width:400px"></a></li>
      <li class="product_name"><a href="ProductDetail?leports_id=${ldto.leports_id}">${ldto.leports_title}</a></li>
    </ul>
  </div>
</c:forEach>
<%--   <%} %> --%>
</body>
</html>