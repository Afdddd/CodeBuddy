<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- swiper.js 라이브러리추가 (cdn) -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <!-- JavaScript(Alertify) -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- CSS(Alertify) -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme(Alertify) -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme(Alertify) -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    <!-- chat.js -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <!-- datepicker range -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <!-- 데이터피커쪽 관련-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- TWAK 키값 -->
    <script src="${ pageContext.request.contextPath }/resources/js/twak.js"></script>
    <!-- 구글 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <style>
      /* div{border:1px solid red;} */
        #footer {
            width:80%;
            height:200px;
            margin:auto;
            margin-top:50px;
            display : flex;
        }
        #footer-1 {
        	
            width:65%;
            height:100%;
            border-top:1px solid lightgray;
            border-bottom : 1px solid lightgray;
        }
        #footer-2 {
        width:35%; 
        height:100%;
        border-top:1px solid lightgray;
        border-bottom : 1px solid lightgray;
        }
        #footer-1, #footer-2 {padding-left:50px;}
        #footer-1>a {
            text-decoration:none;
            font-weight:600;
            margin:10px;
            line-height:40px;
            color:black;
        }
        #footer-2>p {
            margin:0;
            padding:10px;
            font-size:13px;
        }
        #p2 {text-align:center;}
        
        ul{
        	list-style:none;
        }

        td {
        	padding-top : 30px;
        	text-align : center
        }
        
        .td1 {
        	padding-right : 15px;
        	font-family: 'Noto Sans KR', sans-serif;
font-family: 'Noto Serif KR', serif;
        	
        }
        .td2 {
       font-family: 'Noto Sans KR', sans-serif;
font-family: 'Noto Serif KR', serif;
        }
     
        
    </style>
</head>
<body>

    <div id="footer">
        <div id="footer-1">
			<table>
				<tr>
					<td style="padding-right : 30px;"><b>Creators</b></td>
					<td class="td1">|</td>
					<td class="td1">김인엽</td>
					<td class="td1">| </td>
					<td class="td1">봉영훈</td>
					<td class="td1">|</td>
					<td class="td1">김효중</td>
					<td class="td1">|</td>
					<td class="td1">정은지</td>
					<td class="td1">|</td>
					<td class="td1">한영욱</td>
				</tr>
				<tr>
					<td style="padding-right : 30px;"><b>Reference</b></td>
					<td style="padding-right : 15px;"> |</td>
					<td class="td2"><a href="https://letspl.me/">LET'SPL</a></td>
					<td >|</td>
					<td class="td2"><a href="https://holaworld.io/">HOLA</a></td>
					<td>|</td>
					<td class="td2"><a href="https://www.inflearn.com/">Inflearn</a></td>
					
				</tr>
				<tr>
					<td style="padding-right : 30px;"><b>Compete</b></td>
					<td style="padding-right : 15px;"> |</td>
					<td><a href="#">Meetgo</a></td>
					<td>|</td>
					<td><a href="#">윤석이형네</a></td>
					<td>|</td>
					<td><a href="#">원진이네</a></td>
				</tr>
			</table>
        </div>
        <!-- 
			<ul>
				<li style="padding-top : 35px;"><b>Creators</b></li><br>
				<li><b>Reference</b></li><br>
				<li><b>Compete</b></li><br>
			</ul>
			 -->
        <div id="footer-2">
            <p id="p1">
            	<br>
            	사업자 : ??? <br>
            	Contact : 010-1516-5162 <br>
                Address : 서울특별시 영등포구 선유동2로 57 이레빌딩 <br>
            </p>
            <br>
            <div style="text-align : center;">
            <img src="resources/image/logo.png" style="height : 50px; width:100px;">
            </div>
        </div>
    </div>

</body>
</html>