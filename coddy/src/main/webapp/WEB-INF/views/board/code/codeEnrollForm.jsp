<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.jsdelivr.net/npm/ckeditor5-classic-plus@36.0.1/build/ckeditor.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/ckeditor5-upload-adapter@1.0.3/src/uploadadapter.min.js"></script>
<title>Insert title here</title>
<style>

	button[type="submit"] {
      border: 0px;
      color: white;
      padding: 6px;
      border-radius: 8px;
      background-color: #5271FF;
      }
      
    button[type="reset"] {
      border: 0px;
      color: black;
      padding: 6px;
      border-radius: 8px;
      background-color: lightgray;
      }
      
    .Outer {
	  height:1600px;
	  width:1200px
	  border: 1px solid lightgray;
	  border-radius: 15px;
	  margin-top:20px;
	  padding:45px;
	  padding-top: 10px;      	
      
      }
      
	.ck.ck-editor {
    	max-width: 1100px;
    	margin: 0 auto;
	}
	.ck-editor__editable {
		height: 1200px;
	    max-height: 1200px;
	    overflow-y: auto;
	}	
	
</style>
</head>
<body>

<jsp:include page="../../common/header.jsp" />


    <div class="content">
    	<hr>
    	<br><br>
        
        <h4 style="color : #5271FF;"><b style="padding-left: 50px;">코드리뷰 글쓰기</b></h4>
        <div class="Outer">
        <div class="innerOuter">
        	<form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title"></label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" placeholder="제목을 입력하세요." style="width:1100px;" required></td>
                    </tr>
                    <tr>
                    	<th><label for="content"></label></th>
                    	<td>
                    	    <div id="editor">
					        <p>내용을 입력하세요.</p>
					    	</div>
					    <script>
					        ClassicEditor
					            .create( document.querySelector( '#editor' ), {
					            	ckfinder: {
					            		uploadUrl: '${pageContext.request.contextPath}/resources/file_upload/cboard/upload'
					            	}
					            })
					            .catch( error => {
					                console.error( error );
					            } );
					    </script>
					    </td>
                    </tr>
                    </table>
                   
                <br>

                <div align="center">
                	<button type="reset" class="">취소하기</button>
                    <button type="submit" class="">등록하기</button>
                </div>
            </form>
        </div>
        </div>
        <br><br>

    </div>
    
    <jsp:include page="../../common/footer.jsp" />


</body>
</html>