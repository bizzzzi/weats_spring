<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

  <body>
    <div class="w_modal w_hidden">
      <div class="w_modal_overlay"></div>
      <div class="w_modal_content">
        <div class="weather_nav">
          <ul>
            <li class="active"><a onclick="weatherMap(1835847)">서울</a></li>
            <li><a onclick="weatherMap(1843561)">인천</a></li>
            <li><a onclick="weatherMap(1841610)">경기</a></li>
            <li><a onclick="weatherMap(1843125)">강원</a></li>
            <li><a onclick="weatherMap(1845105)">충청</a></li>
            <li><a onclick="weatherMap(1902028)">경상</a></li>
            <li><a onclick="weatherMap(1838519)">부산</a></li>
            <li><a onclick="weatherMap(1845788)">전라</a></li>
            <li><a onclick="weatherMap(1846265)">제주</a></li>
          </ul>
        </div>
      <ul class="weatherInfo">
      </ul>
        <button class="w_closeModal">close</button>
      </div>
    </div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
