<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	#enrollForm>table {width:100%;}
	#enrollForm>table * {margin:5px;}
	
	th {float : right;

	}
	
	  li {
      list-style: none;
    }

    img {
      width: 200px;
      height: 200px;
    }

    .real-upload {
      display: none;
    }

    .image-preview {
      width: 800px;
      height: 200px;
      display: flex;
      gap: 20px;
      overflow-x: scroll;
	  overflow-y: hidden;
	 
    }
    
     .image-container {
            display: inline-block;
            margin-right: 10px;
        }

        .img-container {
            position: relative;
            display: inline-block;
        }

        img {
            max-width: 200px;
            max-height: 200px;
            display: block;
        }

        .delete-button {
            position: absolute;
            top: 0;
            right: 0;
            background-color: white;
            color: black;
            border: none; /* 테두리 제거 */
            padding: 5px;
            cursor: pointer;
            border-radius: 70%;
        }
        
              .upload-container {
            text-align: left;
            margin: 20px;
        }

        .real-upload {
            display: none; /* 원래의 파일 업로드 버튼을 감춥니다. */
        }

        .upload {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #3498db;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />

	  <div class="content">
	  <hr>	
        <br><br>
     
          <div class="innerOuter">

			<h4 style="color : #5271FF;"><b style="padding-left: 50px;">프로젝트 리뷰 글쓰기</b></h4>
            <form id="enrollForm" method="post" action="introinsert.bo" enctype="multipart/form-data">
            	<input type="hidden" name="projectNo" id="projectNo" value="1">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td style="width : 1100px;"><input type="text" id="iboardTitle" class="form-control" name="iboardTitle" required></td>
                    </tr>
             
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="iboardContent" class="form-control" rows="10" style="resize:none;" name="iboardContent" required></textarea></td>
                    </tr>
                    
                    <tr>
                    	<th>
                    	<td>
                    </tr>
                    
                    <tr>
                    	<th><label for="">프로젝트</label></th>
                    	<td><input type="text" id="projectName" name="projectName" style="width : 1100px;" readonly></td>
                    </tr>
                    
                    <tr>
                    	<th><label for="">기술/언어</label></th>
                    	<td><input type="text" id="tagsName" name="tagsName" style="width : 1100px;" readonly></td>
                    </tr>
                    
                </table>
                <br><br><hr>
                <h3>스크린샷</h3>
                <br>
             <div class="upload-container">
		        <input type="file" class="real-upload" accept="image/*" multiple="multiple" name="upfile">
		        <button type="button" class="upload">이미지 업로드</button>
  			  </div>
                <hr>
                
                  <br><br>

					<div class="image-preview"></div>
					
					
			 <script>
			        function getImageFiles(e) {
			            const uploadFiles = [];
			            const files = e.currentTarget.files;
			            const imagePreview = document.querySelector('.image-preview');
			
			            if ([...files].length >= 7) {
			                alert('이미지는 최대 7개 까지 업로드가 가능합니다.');
			                return;
			            }
			
			            // 파일 타입 검사
			            [...files].forEach(file => {
			                if (!file.type.match("image/.*")) {
			                    alert('이미지 파일만 업로드가 가능합니다.');
			                    return;
			                }
			
			                // 파일 갯수 검사
			                if ([...files].length < 7) {
			                    uploadFiles.push(file);
			                    const reader = new FileReader();
			                    reader.onload = (e) => {
			                        const preview = createElement(e, file);
			                        imagePreview.appendChild(preview);
			                    };
			                    reader.readAsDataURL(file);
			                }
			            });
			        }
			
			        function createElement(e, file) {
			            const container = document.createElement('div');
			            container.classList.add('image-container');
			
			            const imgContainer = document.createElement('div');
			            imgContainer.classList.add('img-container');
			            container.appendChild(imgContainer);
			
			            const img = document.createElement('img');
			            img.setAttribute('src', e.target.result);
			            img.setAttribute('data-file', file.name);
			            imgContainer.appendChild(img);
			
			            const deleteButton = document.createElement('button');
			            deleteButton.classList.add('delete-button');
			            deleteButton.innerHTML =" <b>X</b>";
			            deleteButton.addEventListener('click', () => {
			                container.remove();
			            });
			            imgContainer.appendChild(deleteButton);
			
			            return container;
			        }
			
			        const realUpload = document.querySelector('.real-upload');
			        const upload = document.querySelector('.upload');
			
			        upload.addEventListener('click', () => realUpload.click());
			
			        realUpload.addEventListener('change', getImageFiles);
			    </script>
				<br><br>
	

                <div align="center">
                    <button type="submit" class="btn btn-warning">등록하기</button>
                </div>
            </form>
        </div>
        </div>
        <br><br>



 	<jsp:include page="../../common/footer.jsp" />
</body>
</html>