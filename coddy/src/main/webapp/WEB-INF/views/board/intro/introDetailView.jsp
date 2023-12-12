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
</head>
<body>
        
    <jsp:include page="../../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
            <br>

            
            <br><br>

            <table id="contentArea" align="center" class="table">
                <tr>
                    <th>제목 : ${ib.iboardTitle}</th>
                    <td></td>
                </tr>
                <tr>
                    <th>작성자 : ${ib.iboardWriter}</th>
                     <td></td>
                </tr>
                <tr>
                    <th>작성일 : ${ib.iboardInsert}</th>
                     <td></td>
                </tr>
                <tr>
                	<th>사용기술 / 언어</th>
                	 <td></td>
                </tr>
                <tr>
                	<th style="height:150px;">내용 :
	                    	${ib.iboardContent}
	                    </th>
                    <td colspan="4">
	                    
                    </td>
                </tr>
                <tr>
                	
                </tr>
                
            </table>
            <a class="btn btn-secondary" style="float:center;" href="list.bo">목록으로</a>
            <br>

            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
	        
	        		
	                <a class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</a>
	                
	                
	                <form action="deleteForm.ib" method="post">
	                
	                		<input type="hidden" name="ino" value="${sessionScope.ib.iboardNo}">
							<input type="hidden" name="iboardWriter" value="${sessionScope.ib.iboardWriter}">
	                	<button type="submit" class="btn btn-danger">삭제</button>
            		</form>
            </div>
            <br><br>

            <!-- 댓글 기능은 나중에 ajax 배우고 나서 구현할 예정! 우선은 화면구현만 해놓음 -->
            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
                    	<c:choose>
                    		<c:when test="${ empty sessionScope.loginUser }">
                    			<!-- 로그인 전 : 댓글창 막기 -->
                    			<th colspan="2">
		                            <textarea class="form-control" cols="55" rows="2" style="resize:none; width:100%;" readonly>로그인한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용 바랍니다.</textarea>
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
        </div>
        <br><br>
  
        
    </div>
    
    <script>
		// Ajax 댓글 작성하기
		function insertReply(){
			
			if($("#comment").val().trim().length != 0){
				// 댓글일 때
				$.ajax({
					url : "insertReply.bo",
					data : {
						iboardNo : ${i.bno}
						, ireplyContent : $("#comment").val()
						, memberNo : '${loginMember.memberNo}'
					}, success : function(status){
						
						if(status == "success"){
							// 전체 댓글 리스트 갱싱
							selectReplyList();
							$("#comment").val("");
						}
					}
				
				})
			}
		}
		
		// Ajax 대댓글 작성하기
		function insertReplies(repNo){
			
			if($("#insertReplies").val().trim().length != 0){
				// 대댓글일 때
				$.ajax({
					url : "",
					data : {
						iboardNo : ${i.bno}
						, repContent : $("#insertReplies").val()
						, memberNo : '${loginMember.memberNo}'
						, refRepNo : repNo
					}, success : function(status){
						if(status == "success"){
							// 전체 댓글 리스트 갱신
							selectReplyList();
							// 작성해놓은 대댓글 삭제
							$("#insertReplies").val("");
							
						}
					}
				})
			}
		}
    </script>
    
    <jsp:include page="../../common/footer.jsp" />
</body>
</html>