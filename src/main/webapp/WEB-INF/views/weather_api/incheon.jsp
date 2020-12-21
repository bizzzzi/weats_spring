<%@page import="com.dto.LeportsThumbnailDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
  $.getJSON(
    'http://api.openweathermap.org/data/2.5/forecast?id=1846265&APPID=16a506c18e709c0825fe9ca2f478e451&units=metric',
    function (data) {
      let cityName = data.city.name;
      
      // 하루치 기온을 출력한 뒤 배열 내에서 최소 최대 구하기
      let day1_temp = [];
      let day2_temp = [];
      let day3_temp = [];
      let day4_temp = [];
      let day5_temp = [];

      for (let i = 0; i < 40; i++) {
        if (i < 8) {
          day1_temp.push(data.list[i].main.temp);  
        } else if (i >= 8 && i < 16) {
          day2_temp.push(data.list[i].main.temp);
        } else if (i >= 16 && i < 24) {
          day3_temp.push(data.list[i].main.temp);
        } else if (i >= 24 && i < 32) {
          day4_temp.push(data.list[i].main.temp);
        } else {
          day5_temp.push(data.list[i].main.temp);
        }
      }

      // day1
      let day1_max_temp = Math.max.apply(null, day1_temp);
      console.log(day1_max_temp);
      let day1_min_temp = Math.min.apply(null, day1_temp);
      let xxx = data.list[0].dt_txt;
      let day1_date = xxx.substring(0, 10);
      let day1_icon = data.list[0].weather[0].icon;
      let day1_description = data.list[0].weather[0].description;
      // day2
      let day2_max_temp = Math.max.apply(null, day2_temp);
      let day2_min_temp = Math.min.apply(null, day2_temp);
      let xxx2 = data.list[8].dt_txt;
      let day2_date = xxx2.substring(0, 10);
      let day2_icon = data.list[8].weather[0].icon;
      let day2_description = data.list[8].weather[0].description;
      // day3
      let day3_max_temp = Math.max.apply(null, day3_temp);
      let day3_min_temp = Math.min.apply(null, day3_temp);
      let xxx3 = data.list[16].dt_txt;
      let day3_date = xxx3.substring(0, 10);
      let day3_icon = data.list[16].weather[0].icon;
      let day3_description = data.list[16].weather[0].description;
      // day4
      let day4_max_temp = Math.max.apply(null, day4_temp);
      let day4_min_temp = Math.min.apply(null, day4_temp);
      let xxx4 = data.list[24].dt_txt;
      let day4_date = xxx4.substring(0, 10);
      let day4_icon = data.list[24].weather[0].icon;
      let day4_description = data.list[24].weather[0].description;
      // day5
      let day5_max_temp = Math.max.apply(null, day5_temp);
      let day5_min_temp = Math.min.apply(null, day5_temp);
      let xxx5 = data.list[32].dt_txt;
      let day5_date = xxx5.substring(0, 10);
      let day5_icon = data.list[32].weather[0].icon;
      let day5_description = data.list[32].weather[0].description;

      $(".city").append(cityName);
      // day1
      $(".day1_max_temp").append(day1_max_temp);
      $(".day1_min_temp").append(day1_min_temp);
      $(".day1_date").append(day1_date);
      $(".day1_icon").append("<img src='http://openweathermap.org/img/wn/" + day1_icon + ".png'>");
      $(".day1_description").append(day1_description);
      // day2
      $(".day2_max_temp").append(day2_max_temp);
      $(".day2_min_temp").append(day2_min_temp);
      $(".day2_date").append(day2_date);
      $(".day2_icon").append("<img src='http://openweathermap.org/img/wn/" + day2_icon + ".png'>");
      $(".day2_description").append(day2_description);
      // day3
      $(".day3_max_temp").append(day3_max_temp);
      $(".day3_min_temp").append(day3_min_temp);
      $(".day3_date").append(day3_date);
      $(".day3_icon").append("<img src='http://openweathermap.org/img/wn/" + day3_icon + ".png'>");
      $(".day3_description").append(day3_description);
      // day4
      $(".day4_max_temp").append(day4_max_temp);
      $(".day4_min_temp").append(day4_min_temp);
      $(".day4_date").append(day4_date);
      $(".day4_icon").append("<img src='http://openweathermap.org/img/wn/" + day4_icon + ".png'>");
      $(".day4_description").append(day4_description);
      // day5
      $(".day5_max_temp").append(day5_max_temp);
      $(".day5_min_temp").append(day5_min_temp);
      $(".day5_date").append(day5_date);
      $(".day5_icon").append("<img src='http://openweathermap.org/img/wn/" + day5_icon + ".png'>");
      $(".day5_description").append(day5_description);
    });

</script>

<body>
  <div class="w_modal w_hidden">
    <div class="w_modal_overlay2"></div>
    <div class="w_modal_content">
      <ul>
        <li class="day">
          <span class="day1_date"></span>
          <div>
            <span class="day1_icon"></span>
            <span class="day1_max_temp"></span>
            <span class="day1_min_temp">/ </span>
            <span class="day1_description"></span>
          </div>
        </li>
        <li class="day">
          <span class="day2_date"></span>
          <div>
            <span class="day2_icon"></span>
            <span class="day2_max_temp"></span>
            <span class="day2_min_temp">/ </span>
            <span class="day2_description"></span>
          </div>
        </li>
        <li class="day">
          <span class="day3_date"></span>
          <div>
            <span class="day3_icon"></span>
            <span class="day3_max_temp"></span>
            <span class="day3_min_temp">/ </span>
            <span class="day3_description"></span>
          </div>
        </li>
        <li class="day">
          <span class="day4_date"></span>
          <div>
            <span class="day4_icon"></span>
            <span class="day4_max_temp"></span>
            <span class="day4_min_temp">/ </span>
            <span class="day4_description"></span>
          </div>
        </li>
        <li class="day">
          <span class="day5_date"></span>
          <div>
            <span class="day5_icon"></span>
            <span class="day5_max_temp"></span>
            <span class="day5_min_temp">/ </span>
            <span class="day5_description"></span>
          </div>
        </li>
      </ul>
     <button class="w_closeModal2">close</button>
    </div>
  </div>
  
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>