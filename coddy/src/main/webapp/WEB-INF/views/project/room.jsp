<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
    html, body{     
        margin: 0;
        height: 100%;
    }
    header{
        width: 100%;
        height: 8%;
        background-color: #4285f4;
    }
    .sidebar_left{
        height: 92%;
        width: 15%;
        background-color: #f2f2f2;
        float: left;
    }
    .chat_area{
        float: left;
        width: 60%;
        height: 92%;
    }
    .sidebar_right{
        height: 92%;
        width: 25%;     
        float: left;
    }

    #map_area{
        margin-top: 60px;
        text-align: center;
    }

    #map_button{
        width: 100%;
        margin-top: 50px;
    }

    #team_info{
        width: 50%;
    }
    #project_info{
        width: 49%;
    }
    #start{     
        width : 100%;
        height: 20%;
    }


    /* 카드1 */
    .card {
    width: 95%;
    height: 70px;
    background: #d7cfcf;
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: left;
    backdrop-filter: blur(10px);
    transition: 0.5s ease-in-out;
    margin: 7px;
    
    }

    .card:hover {
    cursor: pointer;
    transform: scale(1.05);
    }

    .img {
    width: 50px;
    height: 50px;
    margin-left: 10px;
    border-radius: 10px;
    background: linear-gradient(#d7cfcf, #9198e5);
    }

    .card:hover > .img {
    transition: 0.5s ease-in-out;
    background: linear-gradient(#9198e5, #712020);
    }

    .textBox {
    width: calc(100% - 90px);
    margin-left: 10px;
    color: black;
    font-family: 'Poppins' sans-serif;
    }

    .textContent {
    margin-top: 5px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    }

    .span {
    font-size: 10px;
    }

    .h1 {
    font-size: 16px;
    font-weight: bold;
    }

    .p {
    margin-top: 5px;
    font-size: 14px;
    font-weight: lighter;
    }

   



    /* 채팅 */
    .chat-card {
    width: 100%px;
    height: 100%;
    background-color: #fff;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    }

    .chat-body {
    overflow: auto;
    padding: 20px;
    height: 90%;
    }

    .message {
    margin-bottom: 10px;
    padding: 10px;
    border-radius: 5px;
    }

    .incoming {
    background-color: #e1e1e1;
    }

    .outgoing {
    background-color: #f2f2f2;
    text-align: right;
    }

    .message p {
    font-size: 14px;
    color: #333;
    margin: 0;
    }

    .chat-footer {
    padding: 10px;
    background-color: #f2f2f2;
    display: flex;
    }

    .chat-footer input[type="text"] {
    flex-grow: 1;
    padding: 5px;
    border: none;
    border-radius: 3px;
    }

    .chat-footer button {
    padding: 5px 10px;
    border: none;
    background-color: #4285f4;
    color: #fff;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s;
    }

    .chat-footer button:hover {
    background-color: #0f9d58;
    }

    @keyframes chatAnimation {
    0% {
        opacity: 0;
        transform: translateY(10px);
    }

    100% {
        opacity: 1;
        transform: translateY(0);
    }
    }

    .chat-card .message {
    animation: chatAnimation 0.3s ease-in-out;
    animation-fill-mode: both;
    animation-delay: 0.1s;
    }

    .chat-card .message:nth-child(even) {
    animation-delay: 0.2s;
    }

    .chat-card .message:nth-child(odd) {
    animation-delay: 0.3s;
    }

    #countdown{
        width: 80%;
        height: 20%;
        text-align: center;
        line-height: 170px;
        margin:auto;
    }
    
    /* 버튼 */
    #calendar_area{
        width: 100%;
        height: 10%;
    }
    #calendar_area button{
        width: 100%;
        height: 100%;
        text-align: center;
    }

    .button {
    appearance: none;
    background-color: transparent;
    border: 1px solid lightgray;
    border-radius: 0.9375em;
    box-sizing: border-box;
    color: #3B3B3B;
    cursor: pointer;
    display: inline-block;
    font-family: Roobert,-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
    font-size: 16px;
    font-weight: 600;
    line-height: normal;
    margin: 0;
    min-height: 3.75em;
    min-width: 0;
    outline: none;
    padding: 1em 2.3em;
    text-align: center;
    text-decoration: none;
    transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
    user-select: none;
    -webkit-user-select: none;
    touch-action: manipulation;
    will-change: transform;
    }

    .button:disabled {
    pointer-events: none;
    }

    .button:hover {
    color: #fff;
    background-color: #5271FF;
    box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
    transform: translateY(-2px);
    }

    #map_button:hover {
    color: #191919;
    background-color: #FEE500;
    box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
    transform: translateY(-2px);
    }

    .button:active {
    box-shadow: none;
    transform: translateY(0);
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
  
    
    
   
  });
  
    </script>
</head>
<body>
    <header>
        <div>
            나가기
        </div>
    </header>
    <div class="sidebar_left">
        <div class="card">
            <div class="img"></div>
            <div class="textBox">
              <div class="textContent">
                <p class="h1">김인엽</p>
                <span class="span">방장</span>
              </div>
                <p class="p">PM</p>               
            </div>
        </div>
        <div class="card">
            <div class="img"></div>
            <div class="textBox">
              <div class="textContent">
                <p class="h1">봉영훈</p>
                <span class="span"></span>
              </div>
                <p class="p">Back-End</p>               
            </div>
        </div>
        <div class="card">
            <div class="img"></div>
            <div class="textBox">
              <div class="textContent">
                <p class="h1">김효중</p>
                <span class="span"></span>
              </div>
                <p class="p">Back-End</p>               
            </div>
        </div>
        <div class="card">
            <div class="img"></div>
            <div class="textBox">
              <div class="textContent">
                <p class="h1">정은지</p>
                <span class="span"></span>
              </div>
                <p class="p">Front-End</p>               
            </div>
        </div>
        <div class="card">
            <div class="img"></div>
            <div class="textBox">
              <div class="textContent">
                <p class="h1">한영욱</p>
                <span class="span"></span>
              </div>
                <p class="p">Designer</p>               
            </div>
        </div>
    </div>

    <div class="chat_area">
        <div class="chat-card">
            <div class="chat-body" id="chat_body">
              <!-- 동적으로 메세지 로드 -->
            </div>
            <div class="chat-footer">
              <input placeholder="Type your message" type="text" id="chat_input">
              <button>Send</button>
            </div>
          </div>        
    </div>
    
    <div class="sidebar_right">
        <div id="countdown">D-12</div>
        <div id="calendar_area">
            <button  id="calendar_modal" class="button">
                일정관리
            </button>            
        </div>
        <div id="map_area">인천광역시 계양구 계양2동 6-2 투썸플레이스</div>
        <button id="map_button" class="button" >카카오맵</button>         
        <button id="team_info" class="button">팀원 정보</button>
        <button id="project_info" class="button">프로젝트 소개</button>
        <button id="start" class="button">시작하기</button>  

    </div>

    <!-- 달력 모달 -->

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

      <script>

        // 메세지 입력해서 전송
      $(document).on("keydown", ".chat-footer>input", function(e){
          if(e.keyCode == 13 && !e.shiftKey){
            e.preventDefault();
            const message = $(this).val();

            let search3 = $('.chat-footer>input').val();
                
            if(search3.replace(/\s|  /gi, "").length == 0){ // 문자 공백 확인
                  return false;
                  $('.chat-footer>input').focus();
            }
            
            sendMessage(message);
            clearText();
          }
      });

      function clearText() {
            $('.chat-footer>input').val('');
            return false;
      };


      $(function(){
          connect();         

          $.ajax({
              url:"room.rec",
              type:"get",
              data: {
                roomId : roomId
              },
              success : function(data){
                console.log("메세지 불러오기 성공");
                console.log(data);
              
                for(var i=0; i<data.length; i++){
                  console.log(data);
                  checkLR(data[i]);
                }
                $('.chat-body').scrollTop($('.chat-body').prop('scrollHeight')); // 스크롤 아래로
              },
              error : function(){
                console.log("메세지 불러오기 실패");
              }

            });
        });

          let roomId = 1; //${requestScope.projectNo}; 프로젝트 번호

          let webSocket;

          function connect(){

            
            // 웹소켓 주소
            var wsUri = "ws://localhost:8082/coddy/chat.do";

            // 소켓 객체 생성
            webSocket = new WebSocket(wsUri);

            // 웹소켓에 이벤트가 발생했을때 호출될 함수
            webSocket.onopen = onOpen;
            webSocket.onmessage = onMessage;
          }


          // 웹소켓에 연결되었을 때 호출될 함수
          function onOpen(){
            // ENTER-CHAT 이라는 메세지를 보내고 채팅방이 존재하지 않는다면 채팅방을 생성, 존재한다면 채팅방 입장
            const data = {
              "roomId" : roomId,
              "memberNo" : "${sessionScope.loginMember.memberNo}",
              "memberName" : "${sessionScope.loginMember.memberName}",
              "message": "ENTER-CHAT"
            };

            let jsonData = JSON.stringify(data);
            webSocket.send(jsonData);
          }

          //  메세지 전송 함수
          function sendMessage(message){

            const data={
              "roomId" : roomId,
              "memberNo" : "${sessionScope.loginMember.memberNo}",
              "memberName" : "${sessionScope.loginMember.memberName}",
              "message" : message 
            };
            
            let jsonData = JSON.stringify(data);
            webSocket.send(jsonData);
          }

          // 메세지 수신
          function onMessage(evt){

            let receive = evt.data.split(",");
            const data = {
              "memberNo" : receive[0],
              "memberName" : receive[1],
              "message" : receive[2]
            };
            
            checkLR(data);
            $('.chat-body').scrollTop($('.chat-body').prop('scrollHeight')); // 스크롤 아래로
          }

          // 내가 보낸 메세지인지 확인
          function checkLR(data){ 
            let div;
            if("${loginMember.memberNo}" != data.memberNo){
            div = $("<div class='message incoming'>"
                  + "<div>"+ data.memberName + "</div>"
                      +"<p>"+ data.message +"</p>"
                    +"</div>");
            }else{
              div = $("<div class='message outgoing'>"
                    + "<div>"+ data.memberName + "</div>"
                            +"<p>"+ data.message +"</p>"
                          +"</div>");
            }
            $("#chat_body").append(div);
          }

          
      </script>
</body>
</html>