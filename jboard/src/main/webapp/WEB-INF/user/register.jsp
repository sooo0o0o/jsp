<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/jboard/js/daumPostcode.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function(){
		
		//아이디 중복 체크
		const btnCheckUid = document.getElementById('btnCheckUid');
		const uidResult = document.getElementsByClassName('uidResult')[0];
		
		btnCheckUid.onclick = function(){
			
			//데이터 전송
			const uid = formRegister.uid.value;
			fetch('/jboard/user/check.do?type=uid&value='+uid)
				.then(response => response.json())
				.then((data) => {
					console.log(data);
					
					if(data.count > 0){
						//이미 사용중인 아이디
						uidResult.innerText = '이미 사용중인 아이디 입니다.';
						uidResult.style.color = 'red';
					}else{
						//사용 가능한 아이디
						uidResult.innerText = '사용 가능한 아이디 입니다.';
						uidResult.style.color = 'green';
					}
				})
				.catch((err) => {
					console.log(err);
				});
		}
		
		
		//별명 중복 체크
		const btnCheckNick = document.getElementById('btnCheckNick');
		const nickResult = document.getElementsByClassName('NickResult')[0];
		
		btnCheckNick.onclick = async function(){
			
			const value = formRegister.nick.value;
			
			try{
				const response = await fetch('/jboard/user/check.do?type=nick&value='+value);
				const data = await response.json();
				console.log(data);
				
				if(data.count > 0){
					nickResult.innerText = '이미 사용중인 별명입니다.';
					nickResult.style.color = 'red';
				}else{
					nickResult.innerText = '사용 가능한 별명 입니다.';
					nickResult.style.color = 'green';
				}
			}catch(err){
				console.log(err);
			}
		}
		
		
		
		//이메일 인증 처리
		
		const btnSendEmail = document.getElementById('btnSendEmail');
		const emailResult = document.querySelector('.emailResult');
		const auth = document.querySelector('.auth');
		
		btnSendEmail.onclick = async function(){
			const value = formRegister.email.value;
			
			const response = await fetch('/jboard/user/check.do?type=email&value='+value);
			const data = await response.json();
			
			if(data.count > 0){
				emailResult.innerText = '이미 사용중인 이메일입니다.';
				emailResult.style.color = 'red';
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
				}else{
					emailResult.innerText = '유효한 인증코드가 아닙니다.';
					emailResult.style.color = 'red';
				}
		}
	
	
	
	
	});
</script>

        <main id="user">
            <section class="register">
                <form action="/jboard/user/register.do" method="post" name="formRegister" enctype="application/x-www-form-urlencoded">
                    <h2 class="tit">사이트 이용정보 입력</h2>
                    <table border="1">                        
                        <tr>
                            <td>아이디</td>
                            <td>
                                <input type="text" name="uid" placeholder="아이디 입력"/>
                                <button type="button" id="btnCheckUid"><img src="../images/chk_id.gif" alt="중복확인"/></button>
                                <span class="uidResult"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password" name="pass1" placeholder="비밀번호 입력"/></td>
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/></td>
                        </tr>
                    </table>

                    <h2 class="tit">개인정보 입력</h2>
                    <table border="1">                        
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력"/>                        
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                                <input type="text" name="nick" placeholder="별명 입력"/>
                                <button type="button" id="btnCheckNick"><img src="../images/chk_id.gif" alt="중복확인"/></button>
                                <span class="nickResult"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <input type="email" name="email" placeholder="이메일 입력"/>
                                <button type="button" id="btnSendEmail"><img src="../images/chk_auth.gif" alt="인증번호 받기"/></button>
                                <span class="emailResult"></span>
                                <div class="auth">
                                    <input type="text" name="auth" placeholder="인증번호 입력"/>
                                    <button type="button" id="btnAuthEmail"><img src="../images/chk_confirm.gif" alt="확인"/></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td><input type="text" name="hp" placeholder="휴대폰 입력"/></td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <input type="text" name="zip" placeholder="우편번호"/>
                                <button type="button"><img src="../images/chk_post.gif" alt="우편번호찾기"/></button>
                                <input type="text" name="addr1" placeholder="주소 검색"/>
                                <input type="text" name="addr2" placeholder="상세주소 입력"/>
                            </td>
                        </tr>
                    </table>

                    <div>
                        <a href="/jboard/user/login.html" class="btn btnCancel">취소</a>
                        <input type="submit" value="회원가입" class="btn btnRegister"/>
                    </div>

                </form>

            </section>
        </main>
 <%@ include file="./_footer.jsp" %>