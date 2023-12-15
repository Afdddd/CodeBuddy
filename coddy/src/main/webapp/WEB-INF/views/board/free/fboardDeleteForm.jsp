<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>아이고, 삭제하시게?</title>
	<style>
		.pw {
			width: 500px;
			height: 32px;
			font-size: 15px;
			border: 0;
			border-radius: 15px;
			outline: none;
			padding-left: 10px;
			background-color: rgb(233, 233, 233);
		}
	</style>
	</head>
	<body>
		<jsp:include page="../../common/header.jsp" />
		<div class="content">
			<form action="delete.fr" method="post">
				<div align="center" style="text-align: center; border: 1px solid rosybrown; border-radius: 10px; height: 300px; padding: 100px;">
					<input type="hidden" name="fboardNo" value="${sessionScope.f.fboardNo}">
					<input type="hidden" name="fboardWriter" value="${sessionScope.f.fboardWriter}">
					<span>비밀번호를 입력해주세요 : </span>
					<input type="password" class="pw" name="password">
					<br><br><br><br><br>
					<button type="submit" class="btn btn-primary btn-danger">
						<span class="spinner-grow spinner-grow-sm"></span>&nbsp;&nbsp;입력완료
					</button>
				</div>
			</form>
		</div>
		<jsp:include page="../../common/footer.jsp" />
	</body>
</html>