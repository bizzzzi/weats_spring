
document.querySelector('.userPasswdReg').addEventListener("keypress", (e) => {
    const capsLockDiv = document.querySelector('.capsLockDiv');
    console.log(document.querySelector('.userPasswdReg').value.length);
    if(((e.keyCode >= 65 && e.keyCode <= 90) && !e.shiftKey) || ((e.keyCode >= 97 && e.keyCode <= 122) && e.shiftKey)) {
        capsLockDiv.style.display = 'block';
    } else {
        capsLockDiv.style.display = 'none';
    }
})

function regPw() {
    const regDiv = document.querySelector(".regDiv");
    const pwVal = pw.value;
    console.log(pwVal.length);
    const num = pwVal.search(/[0-9]/g);
    const eng = pwVal.search(/[a-z]/ig);
    const spe = pwVal.search(/[`~!@#$%^&*|\\\'\";:\/?]/gi);

    if(pwVal.search(/\s/) != -1) {
        regDiv.innerText = "공백없이 입력해주세요.";
        regDiv.style.display = 'block';
        return false;
    } else if(pwVal.length < 8 || pwVal.length > 15) {
        regDiv.innerText = "비밀번호를 8~15 자리이내로 입력해주세요.";
        regDiv.style.display = 'block';
        return false;
    } else if((num < 0 && eng < 0) || (eng < 0 && spe < 0) || (eng < 0 && spe < 0 && num < 0)) {
        regDiv.innerText = "영문, 숫자 혹은 특수문자 중 2가지 이상을 조합하여 입력해주세요.";
        regDiv.style.display = 'block';
        return false;
    } else {
        regDiv.style.display = 'none';
    }
}

// 적용 페이지에 추가
//<div class="capsLockDiv" style="display: none"><b>CapsLock</b>이 켜져있습니다.</div>

