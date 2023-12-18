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
    
    .tags {
    	background-color : lightgray;
    	border-radius : 5px;
    	display : inline-block;
    }
</style>
</head>
<body>

<jsp:include page="../../common/header.jsp" />

    <div class="content">
        <div class="innerOuter" style="padding:5% 10%;">
            <h3 style="color:#5271FF;">코드리뷰</h3>
            
            <br>
            <br>
            <thead>
            <div>
			   <!-- 로그인 후 상태일 경우만 보여지는 글쓰기 버튼 -->
            <c:if test="${ not empty sessionScope.loginMember }"> 
	            <a class="btn" style="float:right; color:white; background:#5271FF; padding:6px;" 
	            							href="enrollForm.co">
	            	글쓰기
	            </a>
	        </c:if>
			</div>
            <br>
            <br>
                 
            <table id="cboardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="c" items="${ requestScope.list }">
	                    <tr>
	                        <td class="cno">${ c.cboardNo }</td>
	                        <td>${ c.cboardTitle } &nbsp;&nbsp;&nbsp;&nbsp;
           						<c:forEach var="t" items="${ c.tags }">
           							<span class="tags">&nbsp;#${ t }&nbsp;</span>
           						</c:forEach>
	                        </td>
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
            			
            			let cno = $(this).children(".cno").text();
            			
            			location.href = "detail.co?cno=" + cno;
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
                <div style="float: center; display: flex; margin-top: 2%; margin-bottom: 2%;">
                            <select name="hboardSort" id="hboardSort">
                                <option value="new" selected>최신순</option>
                                <option value="old">댓글많은순</option>
                                <option value="view">조회순</option>
                                <option value="salary">좋아요순</option>
                            </select>
                            &nbsp;
                            <input type="search" class="form-control form-control-lg" id="hboardSearch" name="keyword">
                            &nbsp;&nbsp;
                            <span onclick="onSearch(1);" style="height: 100%;"><svg xmlns="http://www.w3.org/2000/svg" height="3em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg></span>
                </div>
            </form>
            <br><br>
        </div>
        <br><br>

    </div>

	<script>
	    $(function(){
	      $(".card").css("display", "inline-block");
	      $(".container").css("width","0%");
	    });
	    
	    $(document).ready(function() {
	        $("#cboardSearch").val(getParameter("search"));
	        $("#cboardSort").val(getParameter("sort"));
	        tagifyAll.addTags(getParameter("tag"));
	    })
	   
	    
	   function onSearch() {
	        let cpage = 1;
	        let search = $("#cboardSearch").val();
	        let sort = $("#cboardSort").val();
	        let tag = $("#tagAllName").val();
	        tag = replaceAll(replaceAll(replaceAll(replaceAll(replaceAll(replaceAll(tag, "[", ""), "]", ""), "{", ""), "}", ""), "\"value\":", ""), "\"", "");
	        location.href='list.co?cpage='+cpage+'&search='+search+'&sort='+sort+'&tag='+tag;
	   }
	   function getParameter(name) {
	       name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	       var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
	       return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	   }
	   
	   function replaceAll(str, searchStr, replaceStr) { return str.split(searchStr).join(replaceStr); }
	   
	</script>

<jsp:include page="../../common/footer.jsp" />

</body>
</html>