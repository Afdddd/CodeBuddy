<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>관리자 회원 추가</title>
	</head>
	<body class="sb-nav-fixed">
		<jsp:include page="../common/adminMenuBar.jsp" />
		<div id="readArea" style="display: none;">
			<div>
				<fieldset align="center">
					<legend>임시 회원가입 페이지</legend>
					아이디 : <input type="text" name="memberId" id="memberId"><br>
					비밀번호 : <input type="password" name="memberPwd" id="memberPwd"><br>
					이메일 : <input type="email" name="memberEmail" id="memberEmail"><br>
					이름 : <input type="text" name="memberName" id="memberName"><br>
					설명 : <textarea name="memberInfo" id="memberInfo" cols="30" rows="10"></textarea>
				</fieldset>
			</div>
			<div align="center">
				<button type="button" onclick="onSign();">가입시키기</button>
				<button type="button" onclick="location.href='/coddy'">집으로</button>
			</div>
		</div>
		<script>
			function onSign() {
				$.ajax({
					type : "POST",
					url : "insertForce.me",
					data : {memberId: $("#memberId").val(), memberPwd: $("#memberPwd").val(), memberEmail: $("#memberEmail").val(), memberName: $("#memberName").val(), memberInfo: $("#memberInfo").val()},
					success : function(result) { alert(result); },
					error : function(xhr, status, error) { alert(error); }
				});
			};
		</script>
	</body>
</html>