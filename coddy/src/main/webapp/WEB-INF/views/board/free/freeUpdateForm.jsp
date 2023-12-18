<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="resources/js/UploadAdapter.js"></script>
    <title>글 수정</title>
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
                <input type="hidden" name="fBoardNo" value="${ requestScope.f.fboardNo }">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="fboardTitle" class="form-control" value="${ requestScope.f.fboardTitle }" name="fboardTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ sessionScope.loginMember.memberName }" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="file">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reupfile">
                            
                            <c:if test="${ not empty requestScope.f.fboardChange }">
                                현재 업로드된 파일 : 
                                <a href="${ requestScope.f.fboardChange }" 
                                   download="${ requestScope.f.fboardOrigin }">
                                    ${ requestScope.f.fboardOrigin }
                                </a>
                                <!-- 기존의 첨부파일이 있다는 뜻 -->
                                <input type="hidden" name="originName" value="${ requestScope.f.fboardOrigin }">
                                <input type="hidden" name="changeName" value="${ requestScope.f.fboardChange }">
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td>
                            <textarea id="content" class="form-control" rows="10" style="resize:none;" name="fboardContent" required>${ requestScope.f.fboardContent }</textarea>
                        </td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정완료</button>
                    <button type="button" class="btn btn-danger" onclick="history.back();">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>
    
    <jsp:include page="../../common/footer.jsp" />    
</body>
</html>
