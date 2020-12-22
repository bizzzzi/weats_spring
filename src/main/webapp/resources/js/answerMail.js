const path = document.querySelector(".path").value;
const tomail = document.querySelector(".tomail").value;
console.log(path);
if(path.search("adminCheck") !== -1){
    $(".answerForm").on("submit", function() {
        console.log('xxxxx');
        $.ajax({
            type : "POST",
            url : "answerMail", // 서버 주소
            data : {
                user_email : tomail, // 전송 데이터
            },
            dataType : "text", // 응답 데이터 타입
            success : function(data, status, xhr) {
                console.log("success");
            },
            error : function(xhr, status, error) {
                console.log("error");
            }
        });

    });
}
