const pw = document.querySelector('.userPasswd');


pw.addEventListener("keypress", (e) => {
    const capsLockDiv = document.querySelector('.capsLockDiv');
    if(((e.keyCode >= 65 && e.keyCode <= 90) && !e.shiftKey) || ((e.keyCode >= 97 && e.keyCode <= 122) && e.shiftKey)) {
        capsLockDiv.style.display = 'block';
    } else {
        capsLockDiv.style.display = 'none';
    }
})

// 적용 페이지에 추가
//<div class="capsLockDiv" style="display: none"><b>CapsLock</b>이 켜져있습니다.</div>

