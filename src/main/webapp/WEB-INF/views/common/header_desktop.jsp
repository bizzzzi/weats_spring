<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="/weats/">Weats</a>
      <button
        class="navbar-toggler"
        type="button"
        data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
      <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <a class="nav-link" href="RecommendList">추천</a>
          </li>
          <c:set var="path" value="${pageContext.request.contextPath}" />
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="${path}/leportsList?category=byType" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              레포츠
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="${path}/leportsList?category=byLoc">지역별 레포츠</a>
              <a class="dropdown-item" href="${path}/leportsList?category=byType">종류별 레포츠</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="${path}/TradeList" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 중고거래 </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="${path}/TradeList?trade_type=판매">판매</a>
              <a class="dropdown-item" href="${path}/TradeList?trade_type=대여">대여</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${path}/MainCustomer">고객센터</a>
          </li>
        </ul>
	    <ul class="navbar-nav">
	      <li class="nav-item dropdown">
	        <a class="nav-link modalOpenBtn" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="weatherMap(1835847)" >
              <i class="fas fa-cloud-sun"></i>
            </a>
<%--	        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">--%>
<%--	          <a class="dropdown-item modalOpenBtn" href="#">서울</a>--%>
<%--	          <a class="dropdown-item modalOpenBtn2" href="#">인천</a>--%>
<%--	          <a class="dropdown-item modalOpenBtn3" href="#">제주</a>--%>
<%--	        </div>--%>
	      </li>
	     </ul>
        <% MemberDTO dto = (MemberDTO)session.getAttribute("login"); if(dto != null){ String username = dto.getUser_name(); int partner_verify = dto.getPartner_verify(); int
        admin_verify=dto.getAdmin_verify(); if(admin_verify==1){ %>
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 관리자 </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="${path}/admin">관리자 페이지</a>
              <a class="dropdown-item" href="${path}/logout">로그아웃</a>
            </div>
          </li>
        </ul>
        <%}else if(partner_verify == 0){ %>
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <%= username %> </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="${path}/MainMemberMyPage">마이페이지</a>
              <a class="dropdown-item" href="partnerForm">파트너등록</a>
              <a class="dropdown-item" href="${path}/logout">로그아웃</a>
            </div>
          </li>
        </ul>
        <% }else if(partner_verify != 0){ %>
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%= username %> 파트너 </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="${path}/MainMemberMyPage">마이페이지</a>
              <% if(partner_verify==1){ %>
              <a class="dropdown-item" href="#">파트너 승인 대기</a>
              <% } else if(partner_verify==2){%>
              <a class="dropdown-item" href="${path}/partnerCheck/MainPartner">파트너 페이지</a>
              <%}%>
              <a class="dropdown-item" href="${path}/logout">로그아웃</a>
            </div>
          </li>
        </ul>
        <% }}else{ %>
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-user-circle"></i> </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item loginOpenBtn" href="#">로그인</a>
              <a class="dropdown-item signUpOpenBtn" href="#">회원가입</a>
            </div>
          </li>
        </ul>
        <% } //end if~else %>
      </div>
    </nav>




		
		
