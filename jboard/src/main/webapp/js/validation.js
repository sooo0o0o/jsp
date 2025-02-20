//유효성 검사에 사용할 정규표현식
	const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
	const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
	const reName  = /^[가-힣]{2,10}$/;
	const reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
	const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;


	document.addEventListener('DOMContentLoaded', function(){
		
		//유효성 검사에 사용할 상태변수
		let isUidOk = false;
		let isPassOk = false;
		let isNameOk = false;
		let isNickOk = false;
		let isEmailOk = false;
		let isHpOk = false;		
		
	
		//아이디 중복 체크
		const btnCheckUid = document.getElementById('btnCheckUid');
		const uidResult = document.getElementsByClassName('uidResult')[0];
		
		btnCheckUid.onclick = function(){
			
			//데이터 전송
			const value = formRegister.uid.value;
			
			//1. 아이디 유효성 검사
			if(!value.match(reUid)){	
				uidResult.innerText = '아이디 형식이 맞지 않습니다.';
				uidResult.style.color = 'red';
				isUidOk = false;
				return;	//처리종료
			}
			
			//아이디 중복 체크
			fetch('/jboard/user/check.do?type=uid&value='+value)
				.then(response => response.json())
				.then((data) => {
					console.log(data);
					
					if(data.count > 0){
						//이미 사용중인 아이디
						uidResult.innerText = '이미 사용중인 아이디 입니다.';
						uidResult.style.color = 'red';
						isUidOk = false;
					}else{
						//사용 가능한 아이디
						uidResult.innerText = '사용 가능한 아이디 입니다.';
						uidResult.style.color = 'green';
						isUidOk = true;
					}
				})
				.catch((err) => {
					console.log(err);
				});
		}
		
		//2. 비밀번호 유효성 검사
		const passResult = document.getElementsByClassName('passResult')[0];
		
		formRegister.pass2.addEventListener('focusout', function(){
			const value1 = formRegister.pass1.value;
			const value2 = formRegister.pass2.value;
			
			if(!value1.match(rePass)){
				passResult.innerText = ' 숫자, 영문자, 특수문자 조합 8자리 이상입니다.';
				passResult.style.color = 'red';
				isPassOk = false;
				return;
			}
			
			if(value1 === value2){
				passResult.innerText = '사용 가능한 비밀번호 입니다.';
				passResult.style.color = 'green';
				isPassOk = true;
			}else {
				passResult.innerText = '비밀번호가 일치하지 않습니다.';
				passResult.style.color = 'red';
				isPassOk = false;
			}
			
			
			
		});
		
		//3. 이름 유효성 검사
		const nameResult = document.getElementsByClassName('nameResult')[0];
		
		formRegister.name.addEventListener('focusout',function(){
			const value = this.value;
			
			if(!value.match(reName)){
				nameResult.innerText = '이름을 확인해주세요.';
				nameResult.style.color = 'red';
				isNameOk = false;
			}else{
				nameResult.innerText = '';
				isNameOk = true;
				
			}
		});
		
		
		//별명 중복 체크 (+ 4. 별명 유효성 검사)
		const btnCheckNick = document.getElementById('btnCheckNick');
		const nickResult = document.getElementsByClassName('nickResult')[0];
		
		btnCheckNick.onclick = async function(){
			
			const value = formRegister.nick.value;
			
			if(!value.match(reNick)){
				nickResult.innerText = '유효하지 않은 별명입니다.';
				nickResult.style.color = 'red';
				isNickOk = false;
				return;
			}
			
			try{
				const response = await fetch('/jboard/user/check.do?type=nick&value='+value);
				const data = await response.json();
				console.log(data);
				
				if(data.count > 0){
					nickResult.innerText = '이미 사용중인 별명입니다.';
					nickResult.style.color = 'red';
					isNickOk = false;
				}else{
					nickResult.innerText = '사용 가능한 별명 입니다.';
					nickResult.style.color = 'green';
					isNickOk = true;
				}
			}catch(err){
				console.log(err);
			}
		}
		
		
		
		//이메일 인증 처리(5. 이메일 유효성 검사)
		
		const btnSendEmail = document.getElementById('btnSendEmail');
		const emailResult = document.querySelector('.emailResult');
		const auth = document.querySelector('.auth');
		let preventDoubleClick = false;
		
		btnSendEmail.onclick = async function(){
			const value = formRegister.email.value;
			
			//이중 클릭 방지
			if(preventDoubleClick){
				return;
			}
			
			if(!value.match(reEmail)){
				emailResult.innerText = '이메일을 다시 확인해주세요.';
				emailResult.style.color = 'red';
				isEmailOk = false;
				return;
			}
			
			preventDoubleClick = true;
			const response = await fetch('/jboard/user/check.do?type=email&value='+value);
			const data = await response.json();
			
			if(data.count > 0){
				emailResult.innerText = '이미 사용중인 이메일입니다.';
				emailResult.style.color = 'red';
				isEmailOk = false;
			}else{
				//인증번호 입력 필드 출력
				auth.style.display = 'block';
			}
			
		}
		
		
		const btnAuthEmail = document.getElementById('btnAuthEmail');
		btnAuthEmail.onclick = async function(){
			
				const value = formRegister.auth.value;
				//const jsonData = {"authCode":value};
				
				//폼 데이터 생성
				const formData = new URLSearchParams();
				formData.append("authCode", value);
				
				//서버 전송
				const response = await fetch('/jboard/user/check.do',{
										method: 'POST',
										header: {'Content-Type': "application/x-www-form-urlencoded"},
										body: formData
									});
				
				
				const data = await response.json();
				console.log(data);
				
				if(data.result > 0){
					emailResult.innerText = '이메일이 인증 되었습니다.';
					emailResult.style.color = 'green';
					isEmailOk = true;
				}else{
					emailResult.innerText = '유효한 인증코드가 아닙니다.';
					emailResult.style.color = 'red';
					isEmailOk = false;
				}
		}//btnAuthEmail.onclick end
	
		
		//6. 휴대폰 유효성 검사
		const hpResult = document.getElementsByClassName('hpResult')[0];
		
		formRegister.hp.addEventListener('focusout', async function(){
			const value = this.value;
			
			if(!value.match(reHp)){
				hpResult.innerText = '휴대폰 번호가 유효하지 않습니다.';
				hpResult.style.color = 'red';
				isHpOk = false;
				return;
			}else{
				hpResult.innerText = '';
				isHpOk = true;
			}
			
			//휴대폰 번호 중복 체크
			const response = await fetch('/jboard/user/check.do?type=hp&value='+value);
			const data = await response.json();
			
			if(data.count > 0){
				hpResult.innerText = '이미 사용중인 번호입니다.';
				hpResult.style.color = 'red';
				isHpOk = false;
			}else{
				hpResult.innerText = '';
				isHpOk = true;
			}
			
			
		});
		
		
		
		//최종 폼 전송 이벤트
		formRegister.onsubmit = function(e){
			//1. 아이디 유효성 검사 결과
			if(!isUidOk){
				return false;	//폼 전송 취소
			}
			
			//2. 비밀번호 유효성 검사 결과
			if(!isPassOk){
				return false;
			}
			
			//3. 이름 유효성 검사 결과
			if(!isNameOk){
				return false;
			}
			
			//4. 별명 유효성 검사 결과
			if(!isNickOk){
				return false;
			}
			
			//5. 이메일 유효성 검사 결과
			if(!isEmailOk){
				return false;
			}
			
			//6. 휴대폰 유효성 검사 결과
			if(!isHpOk){
				return false;
			}
			
			return true;	//폼 전송 시작
		}
		
		
		
	
	});
