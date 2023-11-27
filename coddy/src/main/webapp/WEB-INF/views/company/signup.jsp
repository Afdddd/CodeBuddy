<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>기업 회원가입</title>
	<!-- 구글 recaptcha2 -->
    <script src='https://www.google.com/recaptcha/api.js'></script>
	<style>
		.signupOuter { width: 100%; height: 60%; }
		.signupInner { border-radius: 10px; border: 2px solid wheat; opacity: 0.7; margin-left: 5%; margin-top: 5%; margin-bottom: 5%; margin-right: 5%; width: 90%; text-align: center; text-decoration-color: coral; padding: 3%; }
		.signupOther { display: flex; }
		.signupInputs { width: 100%; }
		.fieldSets { width: 100%; border: 3px solid turquoise; padding: 3%; border-radius: 10px; }
	</style>
	<!-- .signupOther { background-image: url("${ pageContext.request.contextPath }/resources/image/company/signup-bg.jpg"); background-repeat: no-repeat; background-size : contain; }  -->
	</head>
	<body>
		<jsp:include page="../common/header.jsp" />
		<div class="content">
			<div class="signupOuter">
				<div class="signupInner">
					<h1>기업 회원가입 양식</h1>
					<form action="signup.co" method="post" onsubmit="return onSubmit();">
						<fieldset class="fieldSets">
							<legend style="width: 30%; text-decoration-color: lemonchiffon; font-size: 30px;">계정 정보 입력</legend>
							<div>
								<label for="companyId">ID</label>
								<input type="text" name="comapnyId" id="companyId" class="signupInputs form-control" placeholder="ID 입력" required>
							</div>
							<div>
								<label for="companyPwd">Password</label>
								<input type="password" name="comapnyPwd" id="companyPwd" class="signupInputs form-control" placeholder="PWD 입력" onkeyup="onPassword();" required>
							</div>
							<div>
								<label for="companyPwd2">Password 재입력</label>
								<input type="password" name="comapnyPwd2" id="companyPwd2" class="signupInputs form-control" placeholder="PWD 확인" onkeyup="onPassword();" required>
							</div>
						</fieldset><br>
						<fieldset class="fieldSets">
							<legend style="width: 30%; text-decoration-color: lemonchiffon; font-size: 30px;">회사 정보 입력</legend>
							<div>
								<label for="companyName">회사명</label>
								<input type="text" name="comapnyName" id="companyName" class="signupInputs form-control" placeholder="회사명 입력" required>
							</div>
							<div>
								<label for="companyOwner">사업주명</label>
								<input type="text" name="comapnyOwner" id="companyOwner" class="signupInputs form-control" placeholder="사업주명 입력" required>
							</div>
							<div>
								<label for="companyWorker">직원수</label>
								<input type="number" name="comapnyWorker" id="companyWorker" class="signupInputs form-control" placeholder="직원수 입력" value="1" required>
							</div>
							<div>
								<label for="companySalary">평균연봉 정보</label>
								<input type="number" name="comapnySalary" id="companySalary" class="signupInputs form-control" placeholder="평균연봉 입력" value="14000000" required>
							</div>
							<div>
								<label for="companyInfo">회사소개</label>
								<textarea name="companyInfo" id="companyInfo" class="signupInputs form-control" placeholder="간단 회사 소개"></textarea>
							</div>
							<div>
								<label for="companyEmail">Email</label>
								<input type="text" name="comapnyEmail" id="companyEmail" class="signupInputs form-control" placeholder="Email 입력 @포함" required>
							</div>
							<div>
								<label for="companyBno">사업자 등록번호</label>
								<input type="number" name="comapnyBno" id="companyBno" class="signupInputs form-control" placeholder="사업자 등록번호 입력" required>
							</div>
						</fieldset><br>
						<div class="signupOther">
							<div align="center"><div class="g-recaptcha" data-sitekey="${ sessionScope.gKey }"></div></div>
						</div>
						<div class="signupButtonArea">
							<button type="submit">가입하기</button>
							<button type="button" onclick="backToLogin();">로그인 페이지로 돌아가기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script>
			let checkId = false;
			let checkGoogle = false;
			let checkEmail = false;
			let checkPwd = false;
			let checkBno = false;
			function onSubmit() {
				checkGoogle = onGoogle();
				if(checkEmail != true) { alert("Email 인증 필요"); $("#companyEmail").focus; return false; }
				else if(checkBno != true) { alert("사업자 인증 필요"); $("#companyBno").focus; return false; }
				else if(checkGoogle != true) { alert("recaptchav2 인증 필요"); $(".g-recaptcha").focus; return false; }
				else if(checkPwd != true) { alert("비밀번호가 서로 다름"); $("#companyPwd").focus; return false; }
				else if(checkId != true) { alert("아이디 중복 체크 필요"); $("#companyId").focus; return false; }
				else { return true; }
			}
			function onPassword() { 
				if($("#companyPwd") == $("#companyPwd2")) { checkPwd = true }
				else { checkPwd = false }
			}
			function onGoogle() {
    			if (grecaptcha.getResponse().length == 0) { return false; }
				else { return true; }
            }
			function onId() {}
			function onBno() {}
			function onEmail() {}
			function backToLogin() { if(confirm("정말로 로그인 페이지로 돌아갑니까?") == true) { location.href = "/coddy/loginPage.co"; } }
		</script>
	</body>
</html>