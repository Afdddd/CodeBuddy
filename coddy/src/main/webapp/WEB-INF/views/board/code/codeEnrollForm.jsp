<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>

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
      
      }
      
	.ck.ck-editor {
    	max-width: 500px;
	}
	.ck-editor__editable {
	    min-height: 300px;
	}	
	
</style>
</head>
<body>

<jsp:include page="../../common/header.jsp" />


    <div class="content">
    	<hr>
    	<br>
        <br><br>
        
        <h4 style="color : #5271FF;"><b>코드리뷰 글쓰기</b></h4>
        <div class="Outer">
        <div class="innerOuter">
        	<form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title"></label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" placeholder="제목을 입력하세요." style="width:1000px;" required></td>
                    </tr>
                    <tr>
                    	<th><label for="content"></label></th>
                    	        <div id="editor">
					        <p>This is some sample content.</p>
					    </div>
					    <script>
					        ClassicEditor
					            .create( document.querySelector( '#editor' ))
					            .catch( error => {
					                console.error( error );
					            } );
					    </script>
                    
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