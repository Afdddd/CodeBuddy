<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #freeUpdateForm>table {width:100%;}
    #freeUpdateForm>table * {margin:5px;}
</style>
</head>
<body>
        
    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h3 style="color:#5271FF;">수정</h3>
            <br>

            <form id="freeUpdateForm" method="post" action="freeUpdate.fr" enctype="multipart/form-data">
            	<input type="hidden" name="fBoardNo" value="${ requestScope.b.fBoardNo }">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${ requestScope.b.fBoardTitle }" name="boardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ requestScope.b.fBoardWriter }" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reupfile">
                            
                            <c:if test="${ not empty requestScope.b.originName }">
	                            현재 업로드된 파일 : 
	                            <a href="${ requestScope.b.changeName }" 
	                               download="${ requestScope.b.originName }">
									${ requestScope.b.originName }
								</a>
								<!-- 기존의 첨부파일이 있다라는 뜻 -->
								<input type="hidden" name="originName" value="${ requestScope.b.originName }">
								<input type="hidden" name="changeName" value="${ requestScope.b.changeName }">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required>${ requestScope.b.boardContent }</textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>