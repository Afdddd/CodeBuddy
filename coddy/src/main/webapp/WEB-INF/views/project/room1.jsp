<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 대기실</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>
<link href='${ pageContext.request.contextPath }/resources/css/main.min.css' rel='stylesheet' />
<script src='${ pageContext.request.contextPath }/resources/js/main.min.js'></script>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 스와이프 -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script> -->

<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<style>
    html, body{
      height: 100%;
      margin: 0;
    }
    header{
      width: 100%;
      height: 5%;
      background-color: #5271FF;
    }
    .outer{
      width: 70%;
      height: 80%;
      margin: auto;
    }
    #content_1{
      margin-top: 20px;
      width: 100%;
      height: 35%;
      /* border: 1px solid lightgray; */
      border-radius: 10px;
      box-sizing: border-box;
      margin-bottom: 20px;
      float: left;
    }

    #content_2{
      width: 100%;
      height: 60%;
    }

    #cards{
      width: 100%;
      height: 100%;
    }

    #chat_area{
      float: left;
      width: 55%;
      height: 100%;
    }

    #content_3{
      width: 44%;
      height: 100%;
      float: right;
    }

    #countdown{
      text-align: center;
      line-height: 200px;
      width: 30%;
      height: 200px;
      display: inline-block;
    }
    #calendar_area{
      width: 68%;
      display: inline-block;
      height: 200px;
    }
    #calendar_area>button{
      width: 100%;
      height: 100%;
    }
    #map_area{
      height: 80px;
      width: 100%;
      text-align: center;
      line-height: 80px;
    }
    #map{
      height: 60px;
      width: 100%;
    }
    #map>button{
      height: 100%;
      width: 100%;
    }
    #content_6{
      height: 100px;
      margin: 0px;
    }
    #exit{
      width: 20%;
      height: 100%;
    }
    #team_info{
      width: 20%;
      height: 100%;
    }
    #project_info{
      width: 20%;
      height: 100%;
    }
    #start{
      width: 40%;
      height: 100%;
    }    
    #content_6 button{
      float: left;
    }

  
    /* 카드 */
    .card {
      width: 170px;
      height: 200px;
      background-image: linear-gradient(144deg,#8608b4, #492fed 60%,#bd6fda);
      border: none;
      border-radius: 10px;
      padding-top: 10px;
      position: relative;
      margin: auto;
      font-family: inherit;
      float: left;
      margin: 10px;
      margin-top: 30px;
    }
    .card span {
      font-weight: 600;
      color: white;
      text-align: center;
      display: block;
      padding-top: 10px;
      font-size: 1.3em;
    }

    .card .job {
      font-weight: 400;
      color: white;
      display: block;
      text-align: center;
      font-size: 1em;
      margin-bottom: 0px;
    }
    .card .img {
      width: 70px;
      height: 70px;
      background: #e8e8e8;
      border-radius: 100%;
      margin: auto;
    }
    .card button {
      padding: 8px 25px;
      display: block;
      margin: auto;
      border-radius: 8px;
      border: none;
      background: #e8e8e8;
      color: #111111;
      font-weight: 600;
    }
    .card button:hover {
      background: #212121;
      color: #ffffff;
    }

    /* 채팅 */
    .chat_card {
      width: 100%;
      height: 100%;
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .chat-header {
      background-color: #333;
      color: #fff;
      padding: 10px;
      font-size: 18px;
      border-top-left-radius: 5px;
      border-top-right-radius: 5px;
    }

    .chat-window {
      height: 78%;
      overflow-y: scroll;
    }

    .message-list {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .chat-input {
      display: flex;
      align-items: center;
      padding: 10px;
      border-top: 1px solid #ccc;
    }

    .message-input {
      flex: 1;
      border: none;
      outline: none;
      padding: 5px;
      font-size: 14px;
    }

    .send-button {
      border: none;
      outline: none;
      background-color: #333;
      color: #fff;
      font-size: 14px;
      padding: 5px 10px;
      cursor: pointer;
    }

    .send-button:hover {
      background-color: rgb(255, 255, 255);
      color: rgb(0, 0, 0);
      box-shadow: 0 4px 18px 0 rgba(0, 0, 0, 0.25);
    }

    
    .swiper{
      width: 100%;
    }
    .swiper-wrapper{
      float: left;
    }
   
</style>

<script>
  
  function open_fc() {
  var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      locale: 'ko', // 한국어 설정
      timeZone: 'Asia/Seoul',
      selectable: true,
      droppable : true,
      editable : true,
      dateClick:function(info){
        console.log(info.dateStr);
        console.dir(info);
      }

    });

  calendar.render();
};

$(function(){
  $('#calendar_modal').click(function(){
    $("#myModal").modal();
    open_fc();
  });

  console.log($(".card").children('.job').text());

  
 
});

</script>
</head>	
  </head>
  <body>
    <header>
    </header>

    <div class="outer">
      <br>
      <div id="content_1">  
       
        <div class="swiper">
          <!-- 보여지는 영역 -->
          <div class="swiper-wrapper">

              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      
              <div class="card swiper-slide">
                <div class="card-border-top">
                </div>
                <div class="img">
                </div>
                <span> 김인엽</span>
                <p class="job"> Back-End</p>
                <button> 프로필
                </button>
              </div>      

          </div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-button-next"></div>
        </div>
      </div>
          <script>
            const swiper = new Swiper('.swiper', {
                //기본 셋팅
                //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
                direction: 'horizontal',
                //한번에 보여지는 페이지 숫자
                slidesPerView: 7,
                //페이지와 페이지 사이의 간격
                spaceBetween: 10,
                //드레그 기능 true 사용가능 false 사용불가
                debugger: true,
                //마우스 휠기능 true 사용가능 false 사용불가
                mousewheel: true,                
                // 마지막 여백
                slidesOffsetAfter: 120,
                //방향표
                navigation: {
                  //다음페이지 설정
                  nextEl: '.swiper-button-next',
                  //이전페이지 설정
                  prevEl: '.swiper-button-prev',
                },
            });
          </script>
      
      
      <div id="content_2">
        <div id="chat_area">         
          <div class="chat_card">
            <div class="chat-header">Chat</div>
              <div class="chat-window">
                <ul class="message-list"></ul>
              
              </div>
              <div class="chat-input">
                  <input type="text" class="message-input" placeholder="Type your message here">
                  <button class="send-button">Send</button>
              </div>
            </div>
          </div>
        <div id="content_3">
          <div id="content_4">
            <div id="countdown">D-12</div>
            <div id="calendar_area" align="center">
              <button type="button" id="calendar_modal" class="button">
                일정관리
              </button>
              
            </div>
          </div>
          <div id="content_5">
            <div id="map_area">인천광역시 계양구 계양2동 6-2 투썸플레이스</div>
            <div id="map"><button>카카오맵</button></div>
          </div>
          <div id="content_6">
            <button id="start" >시작하기</button>            
            <button id="team_info" >팀원 정보</button>
            <button id="project_info">프로젝트 소개</button>
            <button id="exit">나가기</button>
          </div>
        </div>
      </div> 
      <div class="modal" id="myModal">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">Modal Heading</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
      
            <!-- Modal body -->
            <div class="modal-body">
              <div id='calendar'></div>
            </div>
      
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
      
          </div>
        </div>
      </div>
    </div>
   
    

  </body>
</html>