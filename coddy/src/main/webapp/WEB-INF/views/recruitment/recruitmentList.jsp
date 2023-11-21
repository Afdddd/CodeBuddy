<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집</title>
<style>
  
  .content_1{
    width: 1200px;
    height: 40%;
    border: 1px solid black;
  }
  .new-project{
    width: 650px;
    height: 100%;
    border: 1px solid black;
    float: left;
  }
  .content_1 h1{
    font-size: 22px;
    color: #333;
  }

  /* 이미지 영역 사이즈 조절 */
  .swiper {
      width: 100%;
      height: 100%;
  }   

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
      width : 100%;
      height : 100%;
  }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
      color : white;
      /* display : none;  */
    }

 
  

</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />	
    <div class="content">
        <div class="content_title">
            <h2>프로젝트 팀원 모집</h2>
        </div>
        <div class="content_1">
            <div class="new-project">
                <h1>신규 프로젝트</h1>
                <div class="swiper">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide"><img src="resources/image/001.png"></div>
                        <div class="swiper-slide"><img src="resources/image/002.png"></div>
                        <div class="swiper-slide"><img src="resources/image/003.png"></div>
                    </div>
              
                    <!-- If we need pagination -->
                    <div class="swiper-pagination"></div>
                
                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                
                    <!-- If we need scrollbar -->
                    <div class="swiper-scrollbar"></div>
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
            </div>

            

            <div class="popular-project">
                <h1>인기 프로젝트</h1>

            </div>

        </div>




    </div>

</body>
</html>