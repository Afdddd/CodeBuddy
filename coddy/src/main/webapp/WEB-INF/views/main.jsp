<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coddy</title>
<!-- swiper.js 라이브러리추가 (cdn) -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
    /* 이미지 영역 사이즈 조절 */
    .swiper {
        width: 1200px;
        height: 500px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
        /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
    }
    </style>

</head>

<body>
<jsp:include page="common/header.jsp" />	
 <div id="content_1">
        <!-- Slider main container -->
        <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
                <!-- Slides -->
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2017/04/11/15/55/animals-2222007__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/12/06/09/15/maple-1079235__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/09/01/19/53/pocket-watch-1637396__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2016/05/27/08/51/mobile-phone-1419275__480.jpg"></div>
                <div class="swiper-slide"><img src="https://cdn.pixabay.com/photo/2015/09/01/09/32/alphabet-916673__480.jpg"></div>
            </div>
        
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
            <!-- If we need scrollbar -->
            <div class="swiper-scrollbar"></div>
        </div>
    </div>

    <script>
        // 슬라이더 동작 정의
        const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
        }); 
    </script>

</body>
</html>