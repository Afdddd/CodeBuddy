<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집</title>
<style>
  .content_1{
    width: 1200px;
    height: 250px;
  }
  .popular-project{
    width: 100%;
    height: 100%;  
    float: left;
  }

  .popular-project-list{
    height: 220px;
    padding: 13px 24px;
    border: 1px lightgray solid;
    border-radius: 8px;
    box-sizing: border-box;
  }

  .popular-project-list h2{
    font-size: 14px;
    width: 100%;
    font-weight: 500;
  }


  .content_1 h1{
    font-size: 22px;
    color: #333;
  }

  .popular-project-list{
    height: 220px;
    padding: 13px 24px;
    border: 1px lightgray solid;
    border-radius: 8px;
    box-sizing: border-box;
    margin-right: 20px;
  }

  /* swiper 이미지 영역 사이즈 조절 */
  .swiper {
      width: 80%;
      height: 200px;
  }   

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
      width : 100%;
      height : 200px;
  }

  /* 화살표 버튼색 변경 (기본색은 파란색) */
  div[class^=swiper-button] {
    color : white;
    /* display : none;  */
  }

  /* 카드 css */
  .card {
    width: 350px;
    height: 250px;
    background: white;
    padding: .4em;
    border-radius: 6px;
    margin: 20px;
    margin-bottom: 20px;
    display : flex;
  }

  .card-image {
    background-color: rgb(236, 236, 236);
    width: 130px;
    height: 110px;
    border-radius: 6px 6px 0 0;
  }

  .card-image:hover {
    transform: scale(0.98);
  }

  .category:hover {
    cursor: pointer;
  }

  .heading {
    font-weight: 600;
    color: rgb(88, 87, 87);
    padding: 7px;
    display: flex;
  }

  .heading:hover {
    cursor: pointer;
  }

  .author {
    color: gray;
    font-weight: 400;
    font-size: 11px;
    padding-top: 20px;
    width: 80%;
    display: inline-block;
  }

  .name {
    font-weight: 600;
  }

  .card:hover {
    cursor: pointer;
  }
    

  .card-list{
    width: 100%;
    margin-top: 50px;
    border-top: 1px solid lightgray;
          
  }

  /* 검색바 */

  .search-bar{
    margin-top: 40px;
  }
  .search-input {
    border: 2px solid transparent;
    width: 15em;
    height: 2.5em;
    padding-left: 0.8em;
    outline: none;
    overflow: hidden;
    background-color: #F3F3F3;
    border-radius: 10px;
    transition: all 0.5s;
    margin-left: 5px;
  }

  .search-input:hover,
  .search-input:focus {
    border: 2px solid #5271FF;
    box-shadow: 0px 0px 0px 7px rgb(74, 157, 236, 20%);
    background-color: white;
  }

  @keyframes checkAnim {
    0% {
      height: 0;
    }

    100% {
      height: 10px;
    }
  }

  .custom-checkbox:checked ~ .search-checkmark:after {
    animation: checkAnim 0.2s forwards;
  }

  /* 페이징바 */
  .paging-area button:disabled{

    background-color : #5271FF;
    color : white;
  }
  .paging-area button{
    background-color : white;
    border-radius: 4px;
    border-width: 1px;
    margin: 2px;
    border-color: rgba(0,0,0,.125);
  }

  /* 좋아요 */
  .container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
    height: 0;
    width: 0;
  }

  .container {
    display: inline-block;
    position: relative;
    cursor: pointer;
    font-size: 12px;
    user-select: none;
    transition: 100ms;
    padding-bottom: 10px;
  }

  .checkmark {
    top: 0;
    left: 0;
    height: 2em;
    width: 2em;
    transition: 100ms;
    animation: dislike_effect 400ms ease;
  }

  .container input:checked ~ .checkmark path {
    fill: #FF5353;
    stroke-width: 0;
  }

  .container input:checked ~ .checkmark {
    animation: like_effect 400ms ease;
  }

  .container:hover {
    transform: scale(1.1);
  }

  @keyframes like_effect {
    0% {
      transform: scale(0);
    }

    50% {
      transform: scale(1.2);
    }

    100% {
      transform: scale(1);
    }
  }

  @keyframes dislike_effect {
    0% {
      transform: scale(0);
    }

    50% {
      transform: scale(1.2);
    }

    100% {
      transform: scale(1);
    }
  }

  .write_button {
    font-family: monospace;
    background-color: #5271FF;
    color: #f3f7fe;
    border: none;
    border-radius: 8px;
    width: 80px;
    height: 35px;
    transition: .3s;
    float: right;
    margin-right: 35px;
    font-size: 12px;
  }

  /* 제목 */
  .title {
    padding-left : 20px;
    width : 90%;
  }
</style>
</head>
<div>
  <jsp:include page="../../common/header.jsp" />	
  <div class="content">
    <div class="content_title">
      <h2>프로젝트 소개</h2>
    </div>
    <div class="content_1">
      <div class="popular-project">
        <h1>인기 프로젝트</h1>

        <div class="popular-project-list">
          <div class="swiper">
            <!-- Additional required wrapper -->
            <div class="swiper-wrapper">
              <!-- Slides -->
              <div class="swiper-slide"><img src="resources/image/001.png"></div>
              <div class="swiper-slide"><img src="resources/image/002.png"></div>
              <div class="swiper-slide"><img src="resources/image/003.png"></div>
            </div>
            
            <!-- If we need pagination -->
            <div class="swiper-pagination"></div>
        
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          </div>
        </div>
        <script>
          // 슬라이더 동작 정의
          const swiper = new Swiper('.swiper', {
            autoplay : {
                delay : 3000 // 3초마다 이미지 변경
            },
            loop : true, //반복 재생 여부
            slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
            pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
                el: '.swiper-pagination',
                clickable: true
            },
            navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
                prevEl: '.swiper-button-prev',
                nextEl: '.swiper-button-next'
            }
          }); 
        </script>
      </div>
    </div>

    <div class="search-bar">

      <input class="search-input" placeholder="기술스택">
      <input class="search-input" placeholder="프로젝트 이름">    
         
    </div>
    <div class="">
    <c:if test=${ not empty sessionScope.loginMember }">
      <button class="write_button" onclick="location.href='introForm.bo'">게시글 작성</button>
    </c:if>
    </div>
    <c:forEach var="b" items="${ requestScope.list }">
    <div class="content_2">
      <div class="card-list">
        <div class="card">
          <div class="cardTop">
            <div class="heading">
              <div class="card-image"></div>
              <div class="title"><h5></h5></div>
            </div>
            
                             
           
            <div class="notHeading">
              <div class="explain">sdafsdafsadfsdafsdafsadfsafsfsdfsdfssdafsadfsafsfsdfsdfssdafsadfsafsfsdfsdfsdfsdfsdfsdfsdf위한 소통 커뮤니티</div>  
              <div class="author"> By <span class="name">"${i.iboard. }</span> 4일전</div>
              <label class="container">
                <input checked="checked" type="checkbox">
                <div class="checkmark">
                  <svg viewBox="0 0 256 256">
                  <rect fill="none" height="512" width="512"></rect>
                  <path d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z" stroke-width="20px" stroke="#d0d0d0" fill="none"></path></svg>
                </div>
              </label> 
            </div>
           
          </div>
          
          <br><br><br><br><br>

          </div>
       </c:forEach>   
          <div class="paging-area" align="center">
            <!-- <button onclick="location.href=''">&lt;</button> -->
            <button onclick="location.href=''" disabled>1</button>
            <button onclick="location.href=''">2</button>
            <button onclick="location.href=''">3</button>
            <button onclick="location.href=''">4</button>   
            <button onclick="location.href=''" >&gt;</button> 
        </div>
      </div>

    </div>
    <script>
      $(function(){
        $(".card").css("display", "inline-block");
        $(".container").css("width","0%");
      });
    </script>
  </body>
</html>