<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table * {margin:5px;}
    table {width:100%;}
    
     .comment {
  margin-bottom: 20px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.comment .author {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.comment .author-info {
  display: flex;
  align-items: center;
}

.comment .author img {
  width: 30px; /* 이미지 크기 조절 */
  height: 30px;
  border-radius: 50%; /* 이미지를 동그랗게 만들기 위한 속성 */
  margin-right: 10px;
}

.comment .author span {
  font-weight: bold;
  color: #333;
}

.comment .actions {
  display: flex;
}

.comment .actions a {
  margin-left: 10px;
}

.comment .content {
  margin-top: 5px;
  color: #555;
}

.comment .timestamp {
  font-size: 12px;
  color: #888;
}

 .modal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      justify-content: center;
      align-items: center;
    }

    .modal-content {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      max-width: 400px; /* 모달 최대 너비 */
      width: 100%;
      box-sizing: border-box;
    }

    /* 닫기 버튼 스타일 */
    .close-btn {
      cursor: pointer;
       position: absolute;	
      top: 10px;
      right: 10px;
      font-size: 18px;
    }
    
    #delete {
    width : 100%;
    text-align: center
    }
    
	    .close-btn2 {
	  cursor: pointer;
	  position: absolute;
	  top: 10px;
	  right: 10px;
	  font-size: 24px; /* 조금 더 큰 크기로 변경 */
	  color: #333; /* 닫기 버튼 색상 변경 */
	}
	
	/* 모달 스타일 */
	.modal {
	  display: none; /* 초기에는 화면에 표시하지 않음 */
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background: rgba(0, 0, 0, 0.5); /* 반투명한 배경 */
	}
	
	.modal-content1 {
	  background-color: #fff;
	  padding: 20px;
	  border-radius: 10px; /* 둥근 테두리로 변경 */
	  max-width: 400px;
	  width: 100%;
	  margin: 10% auto; /* 화면 중앙에 표시 */
	  box-sizing: border-box;
	  position: relative; /* 상대 위치 설정 */
	}
	
	textarea {
	  width: 100%;
	  height: 100px; /* 조절 가능한 높이 */
	  margin-bottom: 10px;
	  resize: none; /* 크기 조절 비활성화 */
	}
	
	/* 확인 버튼 스타일 */
	.btn-danger {
	  background-color: #d9534f;
	  color: #fff;
	  border: none;
	  padding: 10px 20px;
	  border-radius: 5px;
	  cursor: pointer;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/alertifyjs/build/alertify.min.js"></script>
</head>
<body>
        
    <jsp:include page="../../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h3 style="color:#5271FF;">상세보기</h3>
            <br>

            <a class="btn btn-secondary" style="float:right;" href="list.fr">목록으로</a>
            <br><br>

            <table id="contentArea" align="center" class="table" style="color:#5271FF;">

                <tr>
                    <th>제목 ${ requestScope.f.fboardTitle }</th>
                </tr>
                <tr>
                    <th>작성자 ${ requestScope.f.fboardWriter }</th>
                    <th>조회수 ${ requestScope.f.fboardViews }</th>
                </tr>

                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4">
	                    <p style="height:150px;">
	                    	${ requestScope.f.fboardContent }
	                    </p>
                    </td>
                </tr>
            </table>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->

	                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
	                <a class="btn btn-danger" onclick="postFormSubmit(2);">삭제하기</a>
	                
	                <form id="postForm" action="update.fr" method="post">
	                	<input type="hidden" name="fno" 
	                				value="${ requestScope.f.fboardNo }">
	                </form>
						                
					<script>
					    function postFormSubmit(num) {
					       if (num == 1) {
					       $("#postForm").attr("action", "update.fr").submit();
				          } else if (num == 2) {
				              deletePost();
				          }
					    }
					
					    function deletePost() {
					      var confirmDelete = confirm("어디 삭제 해 보시던가?");
					      if (confirmDelete) {
					          $("#postForm").attr("action", "delete.fr").submit();
					      }
					    }
        			</script>
            
            </div>
            <br><br>

			<table id="freeReplyArea" class="table" align="center">
			    <thead>
			        <tr>
			            <c:choose>
			                <c:when test="${ empty sessionScope.loginMember }">
			                    <!-- 로그인 전: 댓글창 막기 -->
			                    <th colspan="2">
			                        <textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%;" readonly>
			                            로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용 바랍니다.
			                        </textarea>
			                    </th>
			                    <th style="vertical-align:middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
			                </c:when>
			                <c:otherwise>
			                    <th colspan="2">
			                        <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
			                    </th>
			                    <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
			                </c:otherwise>
			            </c:choose>
			        </tr>
			        <tr>
			            <td colspan="3">댓글(<span id="rcount">0</span>)</td>
			        </tr>
			    </thead>
			    <tbody>
			       
			    </tbody>
			</table>
			<br><br>
			<script>
			$(function(){
				
				// 댓글리스트 조회용 선언적 함수 호출
				selectReplyList();
				// 댓글 실시간
				setInterval(selectReplyList, 10000);
				
			});

			// 댓글 작성 요청용 ajax 요청
			function addreply(){
				if($("#content").val().trim().length != 0){
					
					$.ajax({
						url : "iinsert.bo",
						type : "get",
						data : {
							iboardNo : "${sessionScope.ib.iboardNo}",
							memberNo : "${sessionScope.loginMember.memberNo}",
							ireplyContent : $("#content").val()
						},
						success : function(result){
							
							if(result == "success"){
								
								selectReplyList();
								$("#content").val("");
							}
						},
						error : function(){
							console.log("댓글 작성용 ajax 통신 실패");
						}
					});
				} else {
					
					alertify.alert("Alert", "댓글 작성 후 등록을 요청해주세요.", function(){ alertify.success('Ok'); });
				}
			};
				
			function selectReplyList(){
			// 댓글 조회 요청용 ajax 요청
			$.ajax({
				url : "ilist.bo",
				type : "get",
				data : { ino : "${ sessionScope.ib.iboardNo}"},
				success : function(result){
					
					let resultStr = "";
					
					for(let i = 0; i < result.length; i++){
						resultStr += "<div class='comment'>"
									+ "<div class='author'>"
									+ "<div class='author-info'>"
									+ "<img src='resources/image/profile/" + result[i].memberNo + ".jpg' onerror=\"this.src='resources/image/company/signup-bg.jpg'\">"
									+ "<span>" + result[i].memberName + "</span>"
									+ "</div>"
									+ "<div class='actions'>";
						if("${sessionScope.loginMember.memberNo}" ==  parseInt(result[i].memberNo)){
						resultStr += "<a href='#' class='edit-link' onclick='openModal2()'>수정하기</a>"
							+ "<a href='#' class='delete-link' onclick='openModal()'>삭제하기</a>"
							+ "<input type='hidden' value='" + result[i].ireplyNo + "'>"
							
						} 		
									
						resultStr += "</div>"
									+ "</div>"
									+ "<div class='content'>" + result[i].ireplyContent + "</div>"
									+ "<div class='timestamp'>" + result[i].ireplyInsert + "</div>"
									+ "</div>"

						}
					
					$("#replyArea>tbody").html(resultStr);
					$("#rcount").text(result.length);
					},
					error : function(){
						console.log("댓글리스트 조회용 ajax 통신 실패!");
					}
				});
			}
			
			function openModal() {
			    document.getElementById('deleteModal').style.display = 'flex';
			    
			    // console.log(window.event.target)
			    
			    let target = window.event.target; // 방금 클릭된 삭제하기 a태그
				let ireplyNo = $(target).next().val(); // 댓글번호
				
			
				
				
				$("#ireplyNo").val(ireplyNo); // 삭제하기 모달창의 input type="hidden" id="ireplyNo" 의 밸류로 넣어버린것
			    
			}
			
			function closeModal() {
				    document.getElementById('deleteModal').style.display = 'none';
			}
			

			
			function replydelete(){
				
				$.ajax({
					url : "idelete.bo",
					type : "get",
					data : {ireplyNo:$("#ireplyNo").val()},
					success : function(result){
						
						
						alert("댓글이 삭제되었습니다.");
						selectReplyList();
						closeModal();
					},
				 	error : function(error){
				 		console.log("ajax 댓글 삭제 실패");
				 	}
				});
			}
			  
			function openModal2(){
				 document.getElementById('updateModal').style.display = 'flex';
				    
				    // console.log(window.event.target)
				    
				    let target = window.event.target; // 방금 클릭된 삭제하기 a태그
			
					let ireplyNo = $(target).siblings("input").val(); // 댓글번호
					
					
					$("#ireplyNo").val(ireplyNo); // 모달창의 input type="hidden" id="ireplyNo" 의 밸류로 넣어버린것
				
			}

		
			function closeModal2() {
			    document.getElementById('updateModal').style.display = 'none';
		}
		
			
			function updateBtn() {
				console.log( $("#updateContent").val());
				$.ajax({
					url : "iupdate.bo",
					type : "get",
					data :  {ireplyNo : $("#ireplyNo").val(),
							ireplyContent : $("#updateContent").val()},
					success : function(result){
							
							console.log(result);
							
							alert("댓글이 수정되었습니다.");
							$("#updateContent").val(result);
							
							  var none = document.getElementById('updateModal');
							  none.style.display = 'none';
						
							 selectReplyList();

					},
					error : function(error){
						console.log("ajax 수정 실패");
						alert("댓글 수정 실패");
					}	
					
				});
			};
			
		
			
			
	    </script>
	    
	    
			 <div id="deleteModal" class="modal">
			  <div class="modal-content">
			    <span class="close-btn" onclick="closeModal()">&times;</span>
			    <p>삭제하시겠습니까?</p>
			    <input type="hidden" id="ireplyNo" value="">
			    <div id="delete">
			    <button class="btn btn-danger" onclick="replydelete()" style=" width : 100px;">확인</button>
			    </div>
			  </div>
			</div>
			
			<div id="updateModal" class="modal">
			  <div class="modal-content1">
			    <span class="close-btn2" onclick="closeModal2()">&times;</span>
			    <textarea  id="updateContent" style="width : 95%; height : 80%;">${Scope.r.content}</textarea>
			    <input type="hidden" id="ireplyNo" value="">
			    <div id="delete">

			    <button class="btn btn-danger" onclick="updateBtn()" style=" width : 100px;">확인</button>
			    </div>
			  </div>
			</div>
    
    
</body>
</html>