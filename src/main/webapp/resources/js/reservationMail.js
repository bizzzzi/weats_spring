//예약 완료 메일
$(".successMailForm").on("submit", function() {
  $.ajax({
    type : "POST",
    url : "loginCheck/successMail", // 서버 주소
    data : {
      reservation_id : $(".reservation_id").val(), // 전송 데이터
      user_email : $(".rs_email").val(), // 전송 데이터
      user_name : $(".rs_name").val(), // 전송 데이터
      item_name : $(".rs_item_name").val(), // 전송 데이터
      total_price : $(".rs_totalPrice").val(), // 전송 데이터

    },
    success : function(data, status, xhr) {
      console.log("success");
    },
    error : function(xhr, status, error) {
      console.log("error");
    }
  });

});

//예약 취소 메일
$(".cancelMailForm").on("submit", function() {
  $.ajax({
    type : "POST",
    url : "loginCheck/cancelMail", // 서버 주소
    data : {
      reservation_id : $(".reservation_id").val(), // 전송 데이터
      user_email : $(".rs_email").val(), // 전송 데이터
      item_name : $(".rs_item_name").val(), // 전송 데이터
      total_price : $(".rs_totalPrice").val(), // 전송 데이터

    },
    success : function(data, status, xhr) {
      console.log("success");
    },
    error : function(xhr, status, error) {
      console.log("error");
    }
  });
});
