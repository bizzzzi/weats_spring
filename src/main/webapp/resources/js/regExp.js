
// document.querySelector('.userPasswdReg').addEventListener("keypress", (e) => {
//     const capsLockDiv = document.querySelector('.capsLockDiv');
//     console.log(document.querySelector('.userPasswdReg').value.length);
//     if(((e.keyCode >= 65 && e.keyCode <= 90) && !e.shiftKey) || ((e.keyCode >= 97 && e.keyCode <= 122) && e.shiftKey)) {
//         capsLockDiv.style.display = 'block';
//     } else {
//         capsLockDiv.style.display = 'none';
//     }
// })

function checkCapsLock(event)  {
    const capsLockSign = document.querySelector('.capsLockSign');
    const capsLockLogin = document.querySelector('.capsLockLogin');
    const capsLockDiv = document.querySelector('.capsLockDiv');


    if (event.getModifierState("CapsLock")) {
        if (capsLockDiv != null) capsLockDiv.style.display = 'inline-block';
        else {
            capsLockSign.style.display = 'inline-block';
            capsLockLogin.style.display = 'inline-block';
        }
    }else {
        if (capsLockDiv != null) capsLockDiv.style.display = 'none';
        else {
            capsLockSign.style.display = 'none';
            capsLockLogin.style.display = 'none';
        }
       regPw();
    }
}

function regPw() {
    const signUpBtn = document.querySelector('.SignUpBtn');
    const pw = document.querySelector(".userPasswdReg");
    const regDiv = document.querySelector(".regDiv");
    const pwVal = pw.value;
    console.log(pwVal.length);
    const reg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,15}$/.test(pwVal);
    if(pwVal.search(/\s/) !== -1) {
        regDiv.innerText = "공백없이 입력해주세요.";
        regDiv.style.display = 'inline-block';
        signUpBtn.type = "button";
        return false;
    } else if(pwVal.length < 8 || pwVal.length > 15) {
        regDiv.innerText = "비밀번호를 8~15 자리이내로 입력해주세요.";
        regDiv.style.display = 'inline-block';
        signUpBtn.type = "button";
        return false;
    }else if (!reg) {
        console.log("else if");
        regDiv.innerText = "영문, 숫자 혹은 특수문자 중 2가지 이상을 조합하여 입력해주세요.";
        regDiv.style.display = 'inline-block';
        signUpBtn.type = "button";
        return false;
    } else {
        console.log("else");
        regDiv.style.display = 'none';
        signUpBtn.type = "submit";
    }
}

// 적용 페이지에 추가
//<div class="capsLockDiv" style="display: none"><b>CapsLock</b>이 켜져있습니다.</div>

