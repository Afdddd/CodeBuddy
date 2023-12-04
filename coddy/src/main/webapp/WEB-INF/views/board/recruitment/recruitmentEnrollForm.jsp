<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>

.form_outer{
    width: 1200px;
    box-shadow: 0 3px 28px 0 rgba(0,0,0,.04);
    padding: 10px;
}

.form_area{
    width: 1080px;
    margin: auto;
    
}

.question{
    margin-top: 80px;
}

.input-wrapper input {
    width: 100%;
    border: 1px solid rgb(219, 213, 213);
    padding: 8px;
    font-size: 1rem;
    border-radius: 8px;
    color: black;
}

.question input:focus {
    outline-color: #5271FF;
}

/* 이미지 업로드 */
.custum-file-upload {
  height: 200px;
  width: 300px;
  display: flex;
  flex-direction: column;
  align-items: space-between;
  gap: 20px;
  cursor: pointer;
  align-items: center;
  justify-content: center;
  border: 2px dashed #cacaca;
  background-color: rgba(255, 255, 255, 1);
  padding: 1.5rem;
  border-radius: 10px;
  box-shadow: 0px 48px 35px -48px rgba(0,0,0,0.1);
}

.custum-file-upload .icon {
  display: flex;
  align-items: center;
  justify-content: center;
}

.custum-file-upload .icon svg {
  height: 80px;
  fill: rgba(75, 85, 99, 1);
}

.custum-file-upload .text {
  display: flex;
  align-items: center;
  justify-content: center;
}

.custum-file-upload .text span {
  font-weight: 400;
  color: rgba(75, 85, 99, 1);
}

.custum-file-upload input {
  display: none;
}

.question textarea {
  border-radius: 8px;
  height: 500px;
  width: 100%;
  resize: none;
  outline: 0;
  padding: 8px 14px;
  border: 1px solid rgb(219, 213, 213);
}

.question textarea:focus {
    outline-color: #5271FF;
}

/* 모집인원 */

#skills{
    width: 50%;
    border: 1px solid rgb(219, 213, 213);
    padding: 8px;
    font-size: 1rem;
    border-radius: 8px;
    color: black;
}
#skills:focus {
    outline-color: #5271FF;
}

.personnel{
    margin-left: 10px;
    display: inline-block;
}
.personnel div{
    display: inline-block;
    margin: 15px;
    font-size: 20px;
}
.personnel_btns{
    float: right;
}

.date>input{
    width: 35%;
    border: 1px solid rgb(219, 213, 213);
    padding: 8px;
    font-size: 1rem;
    border-radius: 8px;
    color: black;
}

.write_btn{
    text-align: center;
}



</style>
</head>
<body>
    <jsp:include page="../../common/header.jsp" />	
    
    <div class="content">
        <div class="content_title">
            <h2>팀원 모집 생성</h2> 
        </div>
        <div class="form_outer">
            <form class="form_area">
                <div class="question">
                    <h3>프로젝트명</h3>
                    <div class="input-wrapper">
                        <input type="text" placeholder="Type here..." name="text" class="input">
                    </div>
                </div>

                <div class="question">
                    <h3>대표이미지</h3>

                    <label class="custum-file-upload" for="file">
                        <div class="icon">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="" viewBox="0 0 24 24"><g stroke-width="0" id="SVGRepo_bgCarrier"></g><g stroke-linejoin="round" stroke-linecap="round" id="SVGRepo_tracerCarrier"></g><g id="SVGRepo_iconCarrier"> <path fill="" d="M10 1C9.73478 1 9.48043 1.10536 9.29289 1.29289L3.29289 7.29289C3.10536 7.48043 3 7.73478 3 8V20C3 21.6569 4.34315 23 6 23H7C7.55228 23 8 22.5523 8 22C8 21.4477 7.55228 21 7 21H6C5.44772 21 5 20.5523 5 20V9H10C10.5523 9 11 8.55228 11 8V3H18C18.5523 3 19 3.44772 19 4V9C19 9.55228 19.4477 10 20 10C20.5523 10 21 9.55228 21 9V4C21 2.34315 19.6569 1 18 1H10ZM9 7H6.41421L9 4.41421V7ZM14 15.5C14 14.1193 15.1193 13 16.5 13C17.8807 13 19 14.1193 19 15.5V16V17H20C21.1046 17 22 17.8954 22 19C22 20.1046 21.1046 21 20 21H13C11.8954 21 11 20.1046 11 19C11 17.8954 11.8954 17 13 17H14V16V15.5ZM16.5 11C14.142 11 12.2076 12.8136 12.0156 15.122C10.2825 15.5606 9 17.1305 9 19C9 21.2091 10.7909 23 13 23H20C22.2091 23 24 21.2091 24 19C24 17.1305 22.7175 15.5606 20.9844 15.122C20.7924 12.8136 18.858 11 16.5 11Z" clip-rule="evenodd" fill-rule="evenodd"></path> </g></svg>
                        </div>
                        <div class="text">
                           <span>Click to upload image</span>
                           </div>
                           <input type="file" id="file">
                        </label>

                    <button id="img_add">추가</button>
                    <button id="img_remove">삭제</button>
                    <span>없다면 기본 이미지가 채워집니다.</span>
                </div>

                <div class="question">
                    <h3>설명</h3>
                    <textarea id="content"></textarea>
                </div>

            
                <div class="question">
                    <h3>기술/언어</h3>
                    <jsp:include page="../../common/tagTech.jsp" />
                </div>

                <div class="question">                  
                    <h3>모집인원</h3>
                        <div class="project_member">
                            <select id="skills" name="skills">
                                <option>PM</option>
                                <option>기획</option>
                                <option>프론트엔드</option>
                                <option>백엔드</option>
                                <option>디자이너</option>
                                <option>IOS 앱 개발</option>
                            </select>
                            <div class="personnel">
                                <div id="minus">-</div>
                                <div id="countNumber">1</div>
                                <div id="plus">+</div>
                            </div>
                         </div>
                    <div class="personnel_btns">
                        <button id="personnel_add">추가</button>
                        <button id="personnel_remove">삭제</button>       
                    </div>
                </div>

                <div class="question date">
                    <h3>프로젝트 기간</h3>
                    <input type="date" id="start_input"> ~ <input type="date" id="end_input">
                </div>
                
                <div class="write_btn">
                    <button>작성완료</button>
                </div>
                

            </form>
        </div>
    </div>
   



    <jsp:include page="../../common/footer.jsp" />	
</body>