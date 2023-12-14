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
        
<jsp:include page="../../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h3 style="color:#5271FF;">수정</h3>
            <br>

            <form id="freeUpdateForm" method="post" action="update.fr" enctype="multipart/form-data">
            	<input type="hidden" name="fBoardNo" value="${ requestScope.f.fBoardNo }">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${ requestScope.f.fBoardTitle }" name="fboardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ requestScope.f.fBoardWriter }" readonly></td>
                    </tr>

                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="fboardContent" required>${ requestScope.f.fboardContent }</textarea></td>
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
    
        <jsp:include page="../../common/footer.jsp" />    
</body>
</html>