<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- swiper.js 라이브러리추가 (cdn) -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <style>
        div {box-sizing:border-box;}
        #header {
            width:1200px;
            height:100px;
            padding-top:20px;
            margin:auto;
        }
        #header>div {width:100%; margin-bottom:10px;}
        #header_1 {height:40%;}
        #header_2 {height:60%;}

        #header_1>div{
            height:100%;
            float:left;
        }
        #header_1_left {width:15%; }
        #header_1_center {width:55%;}
        #header_1_right {width:30%;}
        #header_1_right {text-align:center; line-height:35px; font-size:12px; text-indent:35px; text-align: right;}
        #header_1_right>a {margin:5px;}
        #header_1_right>a:hover {cursor:pointer;}

        #header_1_center>ul {width:100%; height:100%; list-style-type:none; margin:auto; padding:0;}
        #header_1_center>ul>li {float:left; width:15%; height:100%; line-height:55px; text-align:center;}
        #header_1_center>ul>li a {text-decoration:none; color:black; font-size:18px; font-weight:900;}


        #header a {text-decoration:none; color:black;}

        /* 세부페이지마다 공통적으로 유지할 style */ 
        .content {          
            width:1200px;
            height: 1800px;
            margin:auto;
        }
       
        .content_title h2{           
            color: #42495b;
            font-size: 1.75rem;
            line-height: 1.5;
            font-weight: 500;	
            margin-bottom: 40px;
            margin-top: 20px;
        }
        
        #header_1_left>img{
            width:150px;
            height:100px;
            float: left;
            position:absolute;
            top: 0px;
             }
        

    </style>
</head>


<body>

    <div id="header">
        <div id="header_1">
            <div id="header_1_left">
                <img src="resources/image/logo.png">
            </div>
            <div id="header_1_center">
                <ul>
                    <li><a href="list.rec">모집</a></li>
                    <li><a href="">코드리뷰</a></li>
                    <li><a href="">자유</a></li>
                    <li><a href="">소개</a></li>
                    <li><a href="">채용공고</a></li>
                </ul>
            </div>
            <div id="header_1_right">
            
            
               
                <c:choose>
                <c:when test="${empty sessionScope.loginMember and empty sessionScope.nickname}">
	                <a href="">회원가입</a>
	                <a data-toggle="modal" data-target="#loginModal">로그인</a> <!-- 모달의 원리 : 이 버튼 클릭시 data-target에 제시되어있는 해당 아이디의 div요소를 띄워줌 -->
                </c:when>
               
               	<c:otherwise>
               		<c:choose>
               		
	               		<c:when test="${not empty sessionScope.loginMember}">
	               			
		               		<label>${sessionScope.loginMember.memberName}님 환영합니다</label> &nbsp;&nbsp;
		                    <a href="">마이페이지</a>
		                    <a href="">로그아웃</a>
	               		</c:when>
               		
               			<c:otherwise>
               		
		                    <label>${sessionScope.nickname}님 환영합니다</label> &nbsp;&nbsp;
		                    <a href="">마이페이지</a>
		                    <a href="https://kauth.kakao.com/oauth/logout?client_id=434a3f9dc86927696ab077de9855f5c5&logout_redirect_uri=http://localhost:8082/coddy/kakaoLogout.me">로그아웃</a>
	               	 	</c:otherwise>
               	 	</c:choose>
                </c:otherwise>
               </c:choose>
            </div>
        </div>       
    </div>

    <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Login</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="login.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <label for="userId" class="mr-sm-2">ID : </label>
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="memberId"> <br>
                        <label for="userPwd" class="mr-sm-2">Password : </label>
                        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter Password" id="userPwd" name="memberPwd">
                        
                        <div align="center">
                            <button type="submit" class="btn btn-primary">로그인</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                    
                    
                           
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <div align="center" style="margin:auto;">                          
                            <a href="https://kauth.kakao.com/oauth/authorize?client_id=434a3f9dc86927696ab077de9855f5c5&redirect_uri=http://localhost:8082/coddy/kakaoLogin.me&response_type=code">
                               <img src="resources/image/login/kakao_login.png" style="width: 100%; height: 100%;">
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
    
    <br clear="both">
</body>
</html>