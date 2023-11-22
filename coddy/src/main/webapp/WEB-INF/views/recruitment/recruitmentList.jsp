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
    height: 250px;
   
  }
  .new-project{
    width: 50%;
    height: 100%;  
    float: left;
  }
  .popular-project{
    width: 50%;
    height: 100%;
    float: right;
  }
  .popular-project-list{
    height: 220px;
    padding: 13px 24px;
    border: 1px lightgray solid;
    border-radius: 8px;
    box-sizing: border-box;
  }


  .popular-project-list ul{
    display: flex;
    flex-direction: column;
    margin-bottom: 0;
  }

  .popular-project-list li{
    border-bottom: 1px solid #f6f6f6;
    padding: 8px 0;
    cursor: pointer;
    list-style: none;
    height: 65px;
  }

  .popular-project-list h2{
    font-size: 14px;
    width: 100%;
    font-weight: 500;
  }

  .popular-project-list h3{
    font-size: 13px;
    color: #ccc;
    margin-top: 5px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    font-weight: 400;
  }

  .popular-project-list div{
    display: flex;
    flex-direction: row;
  }

  .content_1 h1{
    font-size: 22px;
    color: #333;
  }

  .new-project-list{
    height: 220px;
    padding: 13px 24px;
    border: 1px lightgray solid;
    border-radius: 8px;
    box-sizing: border-box;
    margin-right: 20px;
  }

  /* 이미지 영역 사이즈 조절 */
  .swiper {
      width: 80%;
      height: 200px;
  }   

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
      width : 100%;
      height : 200px;
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

                <div class="new-project-list">
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
            </div>
            
            

            <div class="popular-project">
                <h1>인기 프로젝트</h1>
                
                <div class="popular-project-list">
                    <ul>
                        <li>
                            <div>
                                <h2>Lemon</h2>
                                <span>23.11.22</span>
                            </div>
                            <h3>레시피몬스터, 레시피 커뮤니티</h3>
                        </li>
                        <li>
                            <div>
                                <h2>OurNeighborhood</h2>
                                <span>23.11.22</span>
                            </div>
                            <h3>아파트 입주민들을 위한 소통 커뮤니티</h3>
                        </li>
                        
                        <li>
                            <div>
                                <h2>Pet and Met</h2>
                                <span>23.11.22</span>
                            </div>
                            <h3>애완 동물 커뮤니티</h3>
                        </li>
                    </ul>
                </div>
            </div>

        </div>




    </div>

</body>
</html>