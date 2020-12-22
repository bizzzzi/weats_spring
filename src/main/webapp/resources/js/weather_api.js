const modalOpenBtn = document.querySelector(".modalOpenBtn");
const w_modal = document.querySelector(".w_modal");
const w_closeModal = document.querySelector(".w_closeModal");
const w_modal_overlay = document.querySelector(".w_modal_overlay");
modalOpenBtn.addEventListener("click", () => {
  w_modal.classList.remove("w_hidden");
});

w_closeModal.addEventListener("click", () => {
  w_modal.classList.add("w_hidden");
});

w_modal_overlay.addEventListener("click", () => {
  w_modal.classList.add("w_hidden");
});


let day_Temp = [];
let day_max_temp = "";
let day_min_temp = "";
let xxx = "";
let day_date = "";
let day_icon = "";
let day_description = "";

let cityId = "";

const weatherBtn = $(".weather_nav li");
weatherBtn.find("a").click(function(){
  weatherBtn.removeClass("active");
  $(this).parent().addClass("active");
})

function weatherMap(j){
  cityId = j;
  console.log(cityId);
  $.getJSON(
      "http://api.openweathermap.org/data/2.5/forecast?id="+cityId+"&APPID=16a506c18e709c0825fe9ca2f478e451&units=metric&lang=kr",
      function (data) {
        let cityName = data.city.name;
        let result = "";
        // 하루치 기온을 출력한 뒤 배열 내에서 최소 최대 구하기
        for (let i = 0; i < 40; i++) {
          if (i < 8) {
            day_Temp.push(data.list[i].main.temp);
          } else if (i >= 8 && i < 16) {
            day_Temp.push(data.list[i].main.temp);
          } else if (i >= 16 && i < 24) {
            day_Temp.push(data.list[i].main.temp);
          } else if (i >= 24 && i < 32) {
            day_Temp.push(data.list[i].main.temp);
          } else {
            day_Temp.push(data.list[i].main.temp);
          }

          if(i===7 || i===15 || i===23 || i===31 || i ===39){
            weatherTemp(i);
            result += weatherBox(day_max_temp, day_min_temp, day_date, day_icon, day_description);
            day_Temp = [];
          }
        }
        $(".weatherInfo").replaceWith("<ul class='weatherInfo'>"+result+"</ul>");
        $(".city").append(cityName);
        console.log(cityName);

        function weatherTemp(idx){
          day_max_temp = Math.max.apply(null, day_Temp);
          day_min_temp = Math.min.apply(null, day_Temp);
          if(idx < 8){
            xxx = data.list[0].dt_txt;
            day_icon = data.list[0].weather[0].icon;
            day_description = data.list[0].weather[0].description;
          }else if(idx >= 8 && idx < 16){
            xxx = data.list[8].dt_txt;
            day_icon = data.list[8].weather[0].icon;
            day_description = data.list[8].weather[0].description;
          }else if(idx >= 16 && idx < 24){
            xxx = data.list[16].dt_txt;
            day_icon = data.list[16].weather[0].icon;
            day_description = data.list[16].weather[0].description;
          }else if(idx >= 24 && idx < 32){
            xxx = data.list[24].dt_txt;
            day_icon = data.list[24].weather[0].icon;
            day_description = data.list[24].weather[0].description;
          }else {
            xxx = data.list[32].dt_txt;
            day_icon = data.list[32].weather[0].icon;
            day_description = data.list[32].weather[0].description;
          }
          day_date = xxx.substring(0, 10);
        }
      });
}
function weatherBox(day_max_temp, day_min_temp, day_date, day_icon, day_description){
  let str = "";
  str += "<li class='day'>"+
      "<span class='day_date'>"+day_date+"</span>"+
      "<div>"+
      " <span class='day_icon'>"+
      "<img src='http://openweathermap.org/img/wn/"+day_icon+".png'>"+
      "</span><br>"+
      "<span class='day_max_temp'>최고: "+day_max_temp+"</span><br>"+
      "<span class='day_min_temp'>최: "+day_min_temp+"</span><br>"+
      "<span class='day_description'>"+day_description+"</span>"+
      "</div>"+
      "</li>";
  return str;
}


