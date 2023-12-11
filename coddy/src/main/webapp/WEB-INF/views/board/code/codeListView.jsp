<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#cboardList {margin: 0 auto;}

    #pagingArea {width:fit-content; margin:auto;}
    
    #searchForm {
        width:80%;
        margin:auto;
    }
    #searchForm>* {
        float:left;
        margin:5px;
    }
    .select {width:20%;}
    .text {width:53%;}
    .searchBtn {width:20%;}
</style>
</head>
<body>

<jsp:include page="../../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h3 style="color:#5271FF;">코드리뷰</h3>
            
           
            <br>
            <br>
            <thead>
            <div class="codeList" align="left">
			    <a href="list.co?cpage=${requestScope.pi.currentPage}&sort=createdAtDesc">• 최신순</a>
			    <a href="list.co?cpage=${requestScope.pi.currentPage}&sort=mostAnswers">• 답변많은순</a>
			    <a href="list.co?cpage=${requestScope.pi.currentPage}&sort=mostLikes">• 좋아요순</a>
			     <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <c:if test="${ not empty sessionScope.loginMember }"> 
	            <a class="btn" style="float:right; color:white; background:#5271FF; padding:6px;" 
	            							href="enrollForm.co">
	            	글쓰기
	            </a>
	        </c:if>
			</div>
            <br>
                 
            <table id="cboardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th></th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="c" items="${ requestScope.list }">
	                    <tr>
	                        <td class="bno">${ c.cboardNo }</td>
	                        <td>${ c.cboardTitle }</td>
	                        <td>${ c.cboardWriter }</td>
	                        <td>${ c.cboardViews }</td>
	                        <td>${ c.cboardInsert }</td>
	                        <td>
	                        	<c:if test="${ not empty c.originName }">
	                        		★
	                        	</c:if>
	                        </td>
	                    </tr>
	            	</c:forEach>
                </tbody>
            </table>
            
            <br>
            
            <script>
            	$(function() {
            		
            		$("#cboardList>tbody>tr").click(function() {
            			
            			let bno = $(this).children(".bno").text();
            			
            			location.href = "detail.co?bno=" + bno;
            		});
            	});
            </script>

            <div id="pagingArea">
                <ul class="pagination">
                
                	<c:choose>
                		<c:when test="${ requestScope.pi.currentPage eq 1 }">
	                    	<li class="page-item disabled">
	                    		<a class="page-link" href="#">Previous</a>
	                    	</li>
                    	</c:when>
                    	<c:otherwise>
	                    	<li class="page-item">
	                    		<a class="page-link" href="list.co?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
	                    	</li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${ requestScope.pi.startPage }" 
                    					 end="${ requestScope.pi.endPage }"
                    					step="1">
                    	<li class="page-item">
                    		<a class="page-link" href="list.co?cpage=${ p }">${ p }</a>
                    	</li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
		                    <li class="page-item disabled">
		                    	<a class="page-link" href="#">Next</a>
		                    </li>
		                </c:when>
		                <c:otherwise>
		                    <li class="page-item">
		                    	<a class="page-link" href="list.co?cpage=${ requestScope.pi.currentPage + 1 }">Next</a>
		                    </li>
		                </c:otherwise>
                	</c:choose>
                
                </ul>
            </div>

            <br clear="both"><br>

            <form id="searchForm" action="" method="get" align="center">
                <div class="select">
                    <select class="custom-select" name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                </div>
                <div class="text">
                    <input type="text" class="form-control" name="keyword">
                </div>
                <button type="submit" class="searchBtn btn btn-secondary">검색</button>
            </form>
            <br><br>
        </div>
        <br><br>

    </div>

</body>
</html>