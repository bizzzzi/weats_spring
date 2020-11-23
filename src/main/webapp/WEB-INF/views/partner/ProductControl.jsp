<%@page import="java.util.List"%>
<%@page import="com.dto.LeportsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 class="main_title">예약 관리</h1>
  <hr>
  <div class="product_control_table">
    <ul class="subject">
      <li>상품 이미지</li>
      <li>상품명</li>
    </ul>
    <%
/*     LeportsDTO ldto=(LeportsDTO)session.getAttribute("leports");
    String leports_id=ldto.getLeports_id(); */
    
	List<LeportsDTO> list=(List<LeportsDTO>)session.getAttribute("leports_list");
	for(int i=0; i<list.size(); i++){
		LeportsDTO dto=list.get(i);
	String leports_title=dto.getLeports_title();
	String leports_main_img=dto.getLeports_main_img();
	String leports_id=dto.getLeports_id();
%>
<input type="hidden" name="leports_id" value="<%=leports_id%>">
    <ul class="content">
      <li class="product_img"><img src="#" alt="상품 대표 이미지"><a href="ProductDetailSelectServlet?leports_id=<%=leports_id %>"><%=leports_main_img %></a></li>
      <li class="product_name"><a href="#"><%=leports_title %></a></li>
    </ul>
  </div>

  <%} %>
</body>
</html>