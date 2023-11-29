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
<style>
    body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

</style>
</head>	
<script>
    document.addEventListener('DOMContentLoaded', function() {
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
  });
    </script>
  </head>
  <body>
    <jsp:include page="../common/header.jsp" />	
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
      Open Calendar
    </button>

   

    <div class="modal" id="myModal">
      <div class="modal-dialog modal-xl">
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
  </body>
</html>