// //answer form
// let answerSubmit = document.querySelector(".questionSubmit");
// let s_question = document.querySelector(".s_question");
// let s_answer = document.querySelector(".s_answer");
//
// function nullCheck3(e){
//     if(s_question.value.length===0){
//         console.log(s_question)
//         alert("제목을 입력해주세요")
//         e.preventDefault()
//         s_question.focus();
//     }
//     else if(s_answer.value.length===0){
//         alert("답변을 입력해주세요")
//         e.preventDefault()
//         s_answer.focus();
//     }
// }
//
// answerSubmit.addEventListener("click", nullCheck3);
//
//question form
let questionSubmit = document.querySelector(".questionSubmit");
let user_email = document.querySelector(".user_email");
let q_title = document.querySelector(".q_title");
let q_content = document.querySelector(".q_content");
let user_name = document.querySelector(".user_name");
let q_phone = document.querySelector(".q_phone");

function nullCheck(e){
    if(user_email.value.length===0){
        console.log(user_email)
        alert("이메일을 입력해주세요")
        e.preventDefault()
        user_email.focus();
    }
    else if(user_name.value.length===0){
        alert("이름을 입력해주세요")
        e.preventDefault()
        user_name.focus();
    }
    else if(q_title.value.length===0){
        alert("제목을 입력해주세요")
        e.preventDefault()
        q_title.focus();
    }
    else if(q_phone.value.length===0){
        alert("전화번호를 입력해주세요")
        e.preventDefault()
        q_phone.focus();
    }
    else if(q_content.value.length===0){
        alert("내용을 입력해주세요")
        e.preventDefault()
        q_content.focus();
    }
}
//
questionSubmit.addEventListener("click", nullCheck);
//
// //support detail update
// function nullCheck(e){
//     if(s_question.value.length===0){
//         console.log(s_question)
//         alert("제목을 입력해주세요")
//         e.preventDefault()
//         s_question.focus();
//     }
//     else if(s_answer.value.length===0){
//         alert("답변 입력해주세요")
//         e.preventDefault()
//         s_answer.focus();
//     }
// }
//
//
