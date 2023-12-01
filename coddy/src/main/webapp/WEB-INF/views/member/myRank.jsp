<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.menu {
	  list-style-type: none;
	  margin-right: 10px;
	  margin-left: 0px;
	  padding-left: 0px;
	  width: 15%;
	  height: 100%;
	  overflow: auto;
	}
	
	.menu li a {
	  display: block;
	  color: #000;
	  padding: 8px 16px;
	  text-decoration: none;
	}
	
	.menu li a.active {
	  background-color: #5271FF;
	  color: white;
	}
	
	.menu li a:hover:not(.active) {
	  background-color: #5271FF;
	  color: white;
	}
	
	#pagingArea {width:fit-content; margin:auto;}
	
	table td {
      font-weight: normal;
    }
	

	
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
 	<div class="container">
           
    <hr>
    <br>
    <div style="display: flex;">
					
      <ul class="menu" style="padding-left:0px;">
      <br>
        <li><a href="#">마이페이지</a></li>
        <hr>
        <li><a href="#">나의 평가</a></li>
        <hr>
        <li><a href="#">참여한 프로젝트</a></li>
        <li><a href="#">찜한 프로젝트</a></li>
        <li><a href="#">찜한 채용공고</a></li>
        <hr>
        <li><a href="#">작성한 게시글</a></li>
        <li><a href="#">작성한 댓글</a></li>
      </ul>

      <div style="height:800px;
                  width:1000px;
                  padding:15px;">
        <h4><b>김개발</b>님의 별점은 <b>★★★★</b> 입니다.</h4>
	      <div style="height:600px;
	                  width:900px;
	                  border: 1px solid lightgray;
	                  border-radius: 15px;
	                  margin-top:20px;
	                  padding:45px;">
	                		 
      	  <br>
            <table>
              <tr>
			    <th><b>${ requestScope.c.memberName }베르</b></th>
			  </tr>
			  <tr>
			    <td style="color: gray;">${ requestScope.c.cboardTitle }중고거래 웹사이트 개발 프로젝트•</td>
			    <td style="color: gray;">${ requestScope.c.cboardInsert }23-11-29</td>
			  </tr>
			  <tr>
			    <td>"프론트를 정말 잘 깎으세요"</td>
			  </tr>
            </table>
            <hr>
            
            <table>
              <tr>
			    <th><b>${ requestScope.c.memberName }루나</b></th>
			  </tr>
			  <tr>
			    <td style="color: gray;">${ requestScope.c.cboardTitle }중고거래 웹사이트 개발 프로젝트•</td>
			    <td style="color: gray;">${ requestScope.c.cboardInsert }23-11-29</td>
			  </tr>
			  <tr>
			    <td>"프론트를 정말 잘 깎으세요"</td>
			  </tr>
            </table>
            <hr>
            
            <table>
              <tr>
			    <th><b>${ requestScope.c.memberName }까뮈</b></th>
			  </tr>
			  <tr>
			    <td style="color: gray;">${ requestScope.c.cboardTitle }중고거래 웹사이트 개발 프로젝트•</td>
			    <td style="color: gray;">${ requestScope.c.cboardInsert }23-11-29</td>
			  </tr>
			  <tr>
			    <td>"프론트를 정말 잘 깎으세요"</td>
			  </tr>
            </table>
            <hr>
            <br>
                		 
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
			                    <a class="page-link" href="myRank.me?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
			                </li>
			            </c:otherwise>
			        </c:choose>
			
			        <c:forEach var="p" begin="${ requestScope.pi.startPage }"
			                   end="${ requestScope.pi.endPage }" step="1">
			            <li class="page-item">
			                <a class="page-link" href="myRank.me?cpage=${ p }">${ p }</a>
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
                		
             </div>
           </div>
         </div>
     </div>
</body>
</html>