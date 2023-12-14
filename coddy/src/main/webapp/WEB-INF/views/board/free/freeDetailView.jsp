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
	            <c:if test="${ not empty sessionScope.loginUser and sessionScope.loginUser.userId eq requestScope.f.fboardWriter }">
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
            	</c:if>
            </div>
            <br><br>

			<table id="freeReplyArea" class="table" align="center">
			    <thead>
			        <tr>
			            <c:choose>
			                <c:when test="${ empty sessionScope.loginUser }">
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
			    <tbody id="replyArea">
			        <!-- 댓글 목록이 들어갈 자리 -->
			            <c:forEach var="reply" items="${replyList}">
				        <tr>
				            <th>${reply.replyWriter}</th>
				            <td>${reply.replyContent}</td>
				            <td>${reply.createDate}</td>
				        </tr>
				    	</c:forEach>
				    <!-- 댓글이 없는 경우 -->
				    <c:if test="${empty replyList}">
				        <tr>
				            <td colspan="3">댓글이 없습니다.</td>
				        </tr>
				    </c:if>
			    </tbody>
			</table>
			
			<script>
			    $(function () {
			        // 댓글리스트 조회용 선언적 함수 호출
			        selectReplyList();
			
			        // 만약, 댓글이 실시간으로 달리는걸 보고싶다면?
			        setInterval(selectReplyList, 1000);
			    });
			
			    function addReply() {
			        // 댓글 작성 요청용 ajax 요청
			
			        // 댓글내용이 있는지 먼저 검사 후
			        // 댓글 내용 중 공백 제거 후 길이가 0 이 아닌 경우
			        // => textarea 가 form 태그 내부에 있지 않음
			        // (required 속성으로 필수 입력값임을 나타낼 수 없음)
			        if ($("#content").val().trim().length != 0) {
			
			            $.ajax({
			                url: "rinsert.fr",
			                type: "post", // 변경: 댓글 등록은 POST 방식 사용
			                data: { // Ajax 요청 또한 Spring 에서 커맨드 객체 방식 사용 가능
			                    refBoardNo: ${ requestScope.f.fboardNo },
			                    replyWriter: "${ sessionScope.loginUser.userId }",
			                    replyContent: $("#content").val()
			                },
			                success: function (result) {
			
			                    if (result == "success") {
			                        // 댓글 작성 성공 시
			                        selectReplyList();
			                        $("#content").val("");
			                    }
			
			                },
			                error: function () {
			                    console.log("댓글 작성용 ajax 통신 실패!");
			                }
			            });
			
			        } else {
			
			            alertify.alert("Alert", "댓글 작성 후 등록을 요청해주세요.", function () {
			                alertify.success('Ok');
			            });
			        }
			    }
			
			    function selectReplyList() {
			        // 해당 게시글에 딸린 댓글 조회 요청용 ajax 요청
			        $.ajax({
			            url: "rlist.fr",
			            type: "get",
			            data: { fno: ${ requestScope.f.fboardNo } },
			            success: function (result) {
			                // console.log(result);
			                let resultStr = "";
			                for (let i = 0; i < result.length; i++) {
			                    resultStr += "<tr>" +
			                        "<th>" + result[i].replyWriter + "</th>" +
			                        "<td>" + result[i].replyContent + "</td>" +
			                        "<td>" + result[i].createDate + "</td>" +
			                        "</tr>";
			                }
			                $("#replyArea").html(resultStr); // 변경: tbody의 id를 replyArea로 수정
			                $("#rcount").text(result.length);
			            },
			            error: function () {
			                console.log("댓글리스트 조회용 ajax 통신 실패!");
			            }
			        });
			    }
			</script>
    
    
</body>
</html>