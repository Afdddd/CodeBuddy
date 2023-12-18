<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


  .innerOuter {
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
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
        
           ul {
            list-style:none;
        }   
	
	
	.board-table {
	  font-size: 13px;
	  width: 600px;
	  border-top: 1px solid #ccc;
	  border-bottom: 1px solid #ccc;
	}
	
	.board-table th {
	  text-align: center;
	}
	
	.board-table th, .board-table td {
	  padding: 14px 0;
	}
	
	.board-table tbody td {
	  border-top: 1px solid #e7e7e7;
	  text-align: center;
	}
	
	.board-table tbody th {
	  padding-left: 28px;
	  padding-right: 14px;
	  border-top: 1px solid #e7e7e7;
	  text-align: left;
	}
	
	.board-table tbody th p{
	  display: none;
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
	
	

</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
 	       <div class="innerOuter">
            <h2>찜한 채용공고</h2>
            <br>
            <hr>
            <br>
            <div style="display: flex;">
					

                <ul class="menu" style="padding-left:0px; width : 230px;">
                    <br>
                    <li><a href="myPage.se">마이페이지</a>
                        <ul style="width : 210px;">
                        	<li><a href="pwdChange.me">- 비밀번호 변경</a></li>
                        	<li><a href="delete.me">- 회원 탈퇴</a></li>
                        </ul>
                    </li>
                    <hr>
                    <li><a href="#">참여한 프로젝트</a></li>
                    <li><a href="#">찜한 프로젝트</a></li>
                    <li><a href="likedRecruit.me">찜한 채용공고</a></li>
                    <hr>
                    <li><a href="written.ro">작성한 게시글</a></li>
                    <li><a href="wroteReply.me">작성한 댓글</a></li>
                </ul>

      </ul>

	       <div id="board-list">
          	<br><br><br>
              <div class="container">
                  <table class="board-table">
                      <thead>
                      <tr>
                          <th scope="col" class="th-liked"></th>
                          <th scope="col" class="th-num"></th>
                          <th scope="col" class="th-title">제목</th>
                          <th scope="col" class="th-date">작성일</th>
                      </tr>
                      </thead>
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
						 <tr th:each="b : ${list}" id="table-content">
							 <td>
							    <label class="container">
							        <input checked="checked" type="checkbox">
							        <div class="checkmark">
							            <svg viewBox="0 0 256 256">
							                <rect fill="none" height="256" width="256"></rect>
							                <path d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z" stroke-width="20px" stroke="#FFF" fill="none"></path>
							            </svg>
							        </div>
							    </label>
							 </td>
						     <td th:text="${h.hboardNo}">01</td>
					         <td th:style="'text-align: left; padding-left: 100px; padding-right: 100px'" th:text="${h.hboardTitle}">[SAMSUNG] 2023년 하반기 신입사원 공채 모집</td>
					         <td th:text="${h.hboardInsert}">2023-11-30</td>
						 </tr>
					  </tbody>
                  </table>
	      
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