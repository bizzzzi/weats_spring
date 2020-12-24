
// 사업자 등록 번호 유효성 검사

function checkBusinessNumber() {
	const partnerLicenseNum = document.querySelector('.partner_license_num');
	const messageBox = document.querySelector('.partner_license_num_alert');
	const value  = partnerLicenseNum.value.split('').map(Number); // 배열 요소를 숫자로 변환
	
    if (value.length === 10) {
        var multiply = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5);
        var checkSum = 0;

        for (var i = 0; i < multiply.length; ++i) {
            checkSum += multiply[i] * value[i];
        }

        checkSum += parseInt((multiply[8] * value[8]) / 10, 10);
        
        let a =  Math.floor(value[9]) === (10 - (checkSum % 10));
    
        if(!a){
        	const partnerFormBtn = document.querySelector('.partnerFormBtn');
        	partnerFormBtn.type = 'button'; // input타입을 button으로 변경하여 폼 제출을 막아줌
        	partnerFormBtn.addEventListener('click',()=>{
        	  partnerLicenseNum.value = "";
            partnerLicenseNum.focus();
        	})
        	messageBox.style.display = 'block';
        }else{
        	partnerFormBtn.type = 'submit';
        }
    }else{
    	partnerFormBtn.type = 'submit';
    	messageBox.style.display = 'none';
    }
}











