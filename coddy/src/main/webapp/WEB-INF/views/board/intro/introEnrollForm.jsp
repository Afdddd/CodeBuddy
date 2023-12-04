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
		padding-top : 30px;
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
      width: 1300px;
      height: 200px;
      display: flex;
      gap: 20px;
    }
</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />

	  <div class="content">
        <br><br>
     
             <div class="innerOuter">
            <h2>게시글 작성하기</h2>
            <br>

            <form id="enrollForm" method="post" action="insert.bo" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="boardTitle" required></td>
                    </tr>
             
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required></textarea></td>
                    </tr>
                    
                    
                    <tr>
                    	<th> <input type="file" class="real-upload" accept="image/*" required multiple></th>
					  	<td><button class="upload">버튼</button></td>
                    </tr>
                </table>
                <br>
                
                  <input type="file" class="real-upload" accept="image/*" required multiple>
                  
					<ul class="image-preview" style=" white-space:nowrap; overflow-x:auto;"></ul>
  <script>
    function getImageFiles(e) {
      const uploadFiles = [];
      const files = e.currentTarget.files;
      const imagePreview = document.querySelector('.image-preview');
      const docFrag = new DocumentFragment();

      if ([...files].length >= 9) {
        alert('이미지는 최대 6개 까지 업로드가 가능합니다.');
        return;
      }

      // 파일 타입 검사
      [...files].forEach(file => {
        if (!file.type.match("image/.*")) {
          alert('이미지 파일만 업로드가 가능합니다.');
          return
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
      const li = document.createElement('li');
      const img = document.createElement('img');
      img.setAttribute('src', e.target.result);
      img.setAttribute('data-file', file.name);
      li.appendChild(img);

      return li;
    }

    const realUpload = document.querySelector('.real-upload');
    const upload = document.querySelector('.upload');

    upload.addEventListener('click', () => realUpload.click());

    realUpload.addEventListener('change', getImageFiles);
    
    
  </script>


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