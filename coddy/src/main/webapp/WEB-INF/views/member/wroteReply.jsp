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
	
	
	
	.container input {
	  position: absolute;
	  opacity: 0;
	  cursor: pointer;
	  height: 0;
	  width: 0;
	}
	
	.container {
	  display: block;
	  position: relative;
	  cursor: pointer;
	  user-select: none;
	  transition: 100ms;
	}
	
	.checkmark {
	  top: 0;
	  left: 0;
	  height: 2em;
	  width: 2em;
	  transition: 100ms;
	  animation: dislike_effect 400ms ease;
	}
	
	.container input:checked ~ .checkmark path {
	  fill: #FF5353;
	  stroke-width: 0;
	}
	
	.container input:checked ~ .checkmark {
	  animation: like_effect 400ms ease;
	}
	

	
	@keyframes like_effect {
	  0% {
	    transform: scale(0);
	  }
	
	  50% {
	    transform: scale(1.2);
	  }
	
	  100% {
	    transform: scale(1);
	  }
	}
	
	@keyframes dislike_effect {
	  0% {
	    transform: scale(0);
	  }
	
	  50% {
	    transform: scale(1.2);
	  }
	
	  100% {
	    transform: scale(1);
	  }
	  
	}
	
	/* Hide the default checkbox */
	.container input {
	  display: none;
	}
	
	.container {
	  display: block;
	  position: relative;
	  cursor: pointer;
	  user-select: none;
	  -webkit-tap-highlight-color: transparent;
	}
	
	/* Create a custom checkbox */
	.checkmark {
	  position: relative;
	  top: 0;
	  left: 0;
	  right: 0;
	  height: 1.3em;
	  width: 1.3em;
	  background-color: #2196F300;
	  border-radius: 0.25em;
	  transition: all 0.25s;
	}
	
	/* When the checkbox is checked, add a blue background */
	.container input:checked ~ .checkmark {
	  background-color: #5271FF;
	}
	
	/* Create the checkmark/indicator (hidden when not checked) */
	.checkmark:after {
	  content: "";
	  position: absolute;
	  transform: rotate(0deg);
	  border: 0.1em solid black;
	  left: 0;
	  right: 0;
	  top: 0;
	  width: 1.05em;
	  height: 1.05em;
	  border-radius: 0.25em;
	  transition: all 0.25s, border-width 0.1s;
	}
	
	/* Show the checkmark when checked */
	.container input:checked ~ .checkmark:after {
	  left: 0.45em;
	  top: 0.25em;
	  width: 0.25em;
	  height: 0.5em;
	  border-color: #fff0 white white #fff0;
	  border-width: 0 0.15em 0.15em 0;
	  border-radius: 0em;
	  transform: rotate(45deg);
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
        
	      <div style="height:600px;
	                  width:900px;
	                  border: 1px solid lightgray;
	                  border-radius: 15px;
	                  margin-top:20px;
	                  padding:45px;">
	                  
	              
	       <div id="board-list">
          	<br><br><br>
              <div class="container">
                  <table class="board-table">
                      <!-- 
                      <tbody th:if="${list.isEmpty()}">
					    <tr>
					        <td colspan="4">
					            조회된 리스트가 없습니다.
					        </td>
					    </tr>
					  </tbody>
					   -->
					  <tbody th:if="${not list.isEmpty()}">
					  	 <tr>
						    <td>${ requestScope.c.cboardContent }프로젝트 시작 3일 후에 참여해도 될까요?</td>
						  </tr>
						  <tr>
						    <td style="color: gray;">${ requestScope.c.cboardTitle }중국어 학습 웹사이트 팀원 모집합니다•</td>
						    <td style="color: gray;">${ requestScope.c.cboardInsert }23-11-29</td>
						  </tr>
					  </tbody>
					  </table>
					  <hr>
					  
					  <table>
					    <tbody>
					        <tr>
					            <td>
					                <label class="container">
					                    <input checked="checked" type="checkbox">
					                    <div class="checkmark"></div>
					                </label>
					            </td>
					            <td>
					                <span>c언어 사용 가능한가요?</span>
					            </td>
					        </tr>
					        <tr>
					            <td style="color: gray;">${requestScope.c.cboardTitle}[OurNeighborhood]아파트입주민 커뮤니티•</td>
					            <td style="color: gray;">${requestScope.c.cboardInsert}23-11-28</td>
					        </tr>
					    </tbody>
					  </table>
					  <hr>
					  
					  <table>
					   <tbody>
					  	 <tr>
						    <td>${ requestScope.c.cboardContent }채팅확인 부탁드립니다.</td>
						  </tr>
						  <tr>
						    <td style="color: gray;">${ requestScope.c.cboardTitle }음악에 맞는 제목 찾아주는 기능•</td>
						    <td style="color: gray;">${ requestScope.c.cboardInsert }23-11-29</td>
						  </tr>
					  </tbody>
					  </table>
					  <hr>
                  
                  
                  
                  
	      
	      <br><br>            
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
	  
	  <script>
        document.addEventListener("DOMContentLoaded", function () {
            // 클릭한 메뉴에 대한 상태를 세션 스토리지에서 가져와서 active 클래스를 추가
            var activeMenu = sessionStorage.getItem("activeMenu");
            if (activeMenu) {
                document.getElementById(activeMenu).classList.add("active");
            }

            // 메뉴 클릭 시 상태를 세션 스토리지에 저장
            document.querySelectorAll('.menu li a').forEach(function (menuLink) {
                menuLink.addEventListener('click', function () {
                    var menuId = this.id;
                    sessionStorage.setItem("activeMenu", menuId);

                    // 모든 메뉴에서 active 클래스 제거
                    document.querySelectorAll('.menu li a').forEach(function (menuLink) {
                        menuLink.classList.remove("active");
                    });

                    // 클릭한 메뉴에 active 클래스 추가
                    this.classList.add("active");
                });
            });
        });
    </script>
	  
</body>
</html>