const form = document.querySelector(".supportForm");
const UpBtn = document.querySelector(".supportUpdate");
const delBtn = document.querySelector(".supportDelete");

const s_question = document.querySelector(".s_question");
const s_answer = document.querySelector(".s_answer");

const answerSubmit = document.querySelector(".answerSubmit");

if(UpBtn){
    UpBtn.addEventListener("click", (e) => {
        nullCheck(e);
        form.action = 'supportUpdate';
        UpBtn.type = 'submit';
    })
}

if(delBtn){
    delBtn.addEventListener("click", () => {
        form.action = 'supportDelete';
        delBtn.type = 'submit';
    })
}

if(answerSubmit){
    answerSubmit.addEventListener("click",nullCheck);
}

//support detail update
function nullCheck(e){
    if(s_question.value.length===0){
        console.log(s_question)
        alert("제목을 입력해주세요")
        e.preventDefault()
        s_question.focus();
    }
    else if(s_answer.value.length===0){
        alert("답변을 입력해주세요")
        e.preventDefault()
        s_answer.focus();
    }
}


