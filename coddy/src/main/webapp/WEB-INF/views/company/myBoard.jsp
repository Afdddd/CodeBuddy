<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>${sessionScope.loginCompany.companyName}가 작성한 취업공고</title>
	<style>
		.tableArea { width: 100%; height: 80%; margin-left: 10px; }
		.pageArea { width: 100%; height: 20%; }
	</style>
	</head>
	<body>
		<jsp:include page="../common/header.jsp" />
		<div class="content">
			<div style="display: flex; width: 100%;">
                <jsp:include page="./companyMenuBar.jsp" />
				<div style="margin-left: 20%;">
					<div class="tableArea">
						<table border="1">
							<thead>
								<th>글번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>채용시작</th>
								<th>채용마감</th>
								<th>장소</th>
								<th>태그</th>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty requestScope.list}">
										<tr>
											<td>글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td>2</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="pageArea">

					</div>
				</div>
            </div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</body>
</html>