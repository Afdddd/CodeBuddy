<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>취업 공고 게시판</title>
        <style>
            .outerForm { width: 100%; height: 100%; padding-top: 3%; padding-bottom: 3%; }
            .searchForm { width: 100%; height: 15%; padding: 3%; background: linear-gradient(white, #6E9DDC); color: black; }
            .searchForm1 { width: 100%; height: 100%; border-radius: 20px; color: black; }
            .searchForm1 div { width: 100%; border-radius: 20px; }
            .searchForm2 { width: 100%; height: 0%; border-radius: 12px; border: 2.2px solid khaki; }
            .hboardMain { width: 100%; height: 70%; padding: 3%; }
            .recommendForm { width: 100%; height: 15%; padding: 3%; }
            #hboardSort { width: 200px; text-align: center; }
            #hboardCareer { width: 100%; height: 50px; text-align: center; border: none; font-size: 20px; background: inherit; color: inherit; }
            #hboardEducation { width: 100%; height: 50px; text-align: center; border: none; font-size: 20px; background: inherit; color: inherit; }

            /* 태그 개인 설정 */
            tags { width: 100%; color: darkgoldenrod; }
            .tags-look .tagify__dropdown__item {
                display: inline-block; border-radius: 3px; padding: .3em .5em; border: 1px solid #CCC;
                background: #F3F3F3; margin: .2em; font-size: .85em; color: black; transition: 0s;
            }
            .tags-look .tagify__dropdown__item--active { color: black; }
            .tags-look .tagify__dropdown__item:hover { background: lightyellow; border-color: gold; }
            .tagify__tag { background-color: inherit; }
            .pageForm { width: 100%; height: 15%; }

            /* 카드 css */
            .card { width: 250px; height: 420px; background: white; padding: .4em; border-radius: 6px; margin: 20px; margin-bottom: 20px; }
            .card-image { background-color: rgb(236, 236, 236); width: 100%; height: 130px; border-radius: 6px 6px 0 0; text-align: center; line-height:130px; }
            .card-image:hover { transform: scale(0.98); }
            .location { text-transform: uppercase; font-size: 0.7em; font-weight: 600; color: #5271FF; padding: 10px 7px 0; }
            .location:hover { cursor: pointer; }
            .heading { font-weight: 600; color: rgb(88, 87, 87); padding: 7px; }
            .heading:hover { cursor: pointer; }
            .info { color: gray; font-weight: 400; font-size: 11px; padding-top: 20px; width: 90%; display: inline-block; }
            .name { font-weight: 600; }
            .card:hover { cursor: pointer; }
            .card-list{ width: 100%; margin-top: 50px; border-top: 1px solid lightgray; display: flex; }
            .footing { height: 60px; width: 100%; }
            .tagList { border: 1px solid grey; border-radius: 8px; margin: 3px; padding: 3px; display: inline-flex; }
            .tagList:before { content: '#'; }
            .tagList:hover { transform: scale(1.24); }

            /* 좋아요 */
            .container input { position: absolute; opacity: 0; cursor: pointer; height: 0; width: 0; }
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
            .container input:checked ~ .checkmark path { fill: #FF5353; stroke-width: 0; }
            .container input:checked ~ .checkmark { animation: like_effect 400ms ease; }
            .container:hover { transform: scale(1.1); }
            @keyframes like_effect { 0% { transform: scale(0); } 50% { transform: scale(1.2); } 100% { transform: scale(1); } }
            @keyframes dislike_effect { 0% { transform: scale(0); } 50% { transform: scale(1.2); } 100% { transform: scale(1); } }
        </style>
    </head>
    <body>
        <jsp:include page="../../common/header.jsp" />
        <div class="content">
            <div class="outerForm">
                <div class="searchForm">
                    <div class="searchForm1">
                        <div style="width: 100%; height: 40%; margin: auto; display: flex; border: 2px solid silver; padding: 1%;">
                            <div style="width: 50%; height: 100%; display: flex;">
                                <h5 style="width: 20%; margin: auto;" align="center">경력 구분</h5>
                                <div style="width: 80%; margin: auto;">
                                    <select name="hboardCareer" id="hboardCareer" size="">
                                        <option value="none" selected>경력무관</option>
                                        <option value="intern">인턴</option>
                                        <option value="newcomer">신입</option>
                                        <option value="junior">주니어</option>
                                        <option value="middle">미들</option>
                                        <option value="senior">시니어</option>
                                    </select>
                                </div>
                            </div>
                            <div style="width: 50%; height: 100%; display: flex;">
                                <h5 style="width: 20%; margin: auto;" align="center">학력 구분</h5>
                                <div style="width: 80%; margin: auto;">
                                    <select name="hboardEducation" id="hboardEducation" size="">
                                        <option value="none" selected>학력무관</option>
                                        <option value="highSchool">고등학교 졸업</option>
                                        <option value="juniorCollege">전문대학 졸업</option>
                                        <option value="university">대학 졸업</option>
                                        <option value="master">석사 이상</option>
                                        <option value="doctor">박사 이상</option>
                                        <option value="professor">교수 및 연구원</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div style="width: 100%; height: 60%; display: flex; border: 2px solid silver; padding: 1%;">
                            <h5 style="width: 10%; margin: auto;" align="center">#태그</h5>
                            <div style="width: 90%; margin: auto;">
                                <jsp:include page="../../common/tagAll.jsp" />
                            </div>
                        </div>
                    </div><br>
                    <div class="searchForm2">
                    </div>
                </div>
                <div class="hboardMain">
                    <div style="width: 100%; height: 10%;">
                        <div style="float: right; display: flex; margin-top: 2%; margin-bottom: 2%;">
                            <select name="hboardSort" id="hboardSort">
                                <option value="new" selected>최신순</option>
                                <option value="old">마감순</option>
                                <option value="view">조회순</option>
                                <option value="salary">연봉순</option>
                            </select>
                            &nbsp;
                            <input type="search" class="form-control form-control-lg">
                            &nbsp;&nbsp;
                            <span onclick="" style="height: 100%;"><svg xmlns="http://www.w3.org/2000/svg" height="3em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg></span>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${not empty sessionScope.loginCompany}">
                            &nbsp<a href="insertForm.hb" style="text-decoration: none; color: inherit; border: 3px solod sandybrown; float: right;">모집 공고 작성하기</a>
                        </c:when>
                    </c:choose>
                    <label for="viewOn" class="form-check-label"><input type="checkbox" class="form-check-input" name="viewOn" id="viewOn" checked>&nbsp;모집중인 공고만 보기</label>

                    <div style="width: 100%; height: 75%;">
                        <div class="content_2">
                            <div class="card-list">
                            	<!--  
                                <div class="card">
                                    <div class="card-image"></div>
                                    <div class="location">대충 지역 어디인지</div>
                                    <div class="heading">
                                        <h5>제목</h5>
                                        <div class="company">기업명</div>
                                        <div style="display: flex; width: 100%;">
                                            <div class="info"><i class="fas fa-eye"></i>조회수&nbsp;504</div>
                                            <label class="container">찜하기
                                                <input checked="checked" type="checkbox">
                                                <div class="checkmark">
                                                    <svg viewBox="0 0 256 256">
                                                    <rect fill="none" height="512" width="512"></rect>
                                                    <path d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z" stroke-width="20px" stroke="#d0d0d0" fill="none"></path></svg>
                                                </div>
                                            </label>
                                        </div>
                                    </div> 
                                    <div class="footing">
                                        <span class="tagList">a</span>
                                        <span class="tagList">b</span>
                                    </div>                         
                                </div>
                                -->
                                <c:forEach var="b" items="${requestScope.list}" varStatus="status">
                                    <div class="card">
                                        <div class="card-image">
                                            <img src="${requestScope.at_list[status.index].hattachmentPath}/${requestScope.at_list[status.index].hattachmentChange}" width="80%" height="80%" style="vertical-align:middle;" onerror="this.src='resources/image/white.jpg'">
                                        </div>
                                        <div class="location">${b.hboardLocation}</div>
                                        <div class="heading">
                                            <h5>${b.hboardTitle}</h5>
                                            <div class="company">${b.companyNo}</div>
                                            <div style="display: flex; width: 100%;">
                                                <div class="info"><i class="fas fa-eye"></i>조회수&nbsp;${b.hboardViews}</div>
                                                <c:if test="${not empty sessionScope.loginMember}">
                                                    <c:choose>
                                                        <c:when test="${requestScope.ws_list[status.index]}">
                                                            <label class="container">찜하기
                                                                <input type="checkbox" checked="checked" name="favorite" onclick="onWish('${b.hboardNo}');">
                                                                <div class="checkmark">
                                                                    <svg viewBox="0 0 256 256">
                                                                    <rect fill="none" height="512" width="512"></rect>
                                                                    <path d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z" stroke-width="20px" stroke="#d0d0d0" fill="none"></path></svg>
                                                                </div>
                                                            </label>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <label class="container">찜하기
                                                                <input type="checkbox" name="favorite" onclick="onWish('${b.hboardNo}');">
                                                                <div class="checkmark">
                                                                    <svg viewBox="0 0 256 256">
                                                                    <rect fill="none" height="512" width="512"></rect>
                                                                    <path d="M224.6,51.9a59.5,59.5,0,0,0-43-19.9,60.5,60.5,0,0,0-44,17.6L128,59.1l-7.5-7.4C97.2,28.3,59.2,26.3,35.9,47.4a59.9,59.9,0,0,0-2.3,87l83.1,83.1a15.9,15.9,0,0,0,22.6,0l81-81C243.7,113.2,245.6,75.2,224.6,51.9Z" stroke-width="20px" stroke="#d0d0d0" fill="none"></path></svg>
                                                                </div>
                                                            </label>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </div>
                                            <div style="display: flex; width: 100%;">
                                                <div style="width: 45%;">${b.hboardStart}</div>
                                                <div style="width: 10%;">&nbsp;~&nbsp;</div>
                                                <div style="width: 45%;">${b.hboardEnd}</div>
                                            </div>
                                        </div> 
                                        <div class="footing">
                                            <c:forEach var="tg" items="${requestScope.tg_list[status.index]}">
                                                <span class="tagList">${tg.tagsNo}</span>
                                            </c:forEach>
                                        </div>                         
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="pageForm">

                    </div>
                </div>
                <div class="recommendForm">

                </div>
            </div>
        </div>
        <script>
            function onWish(e) {
                $.ajax({
						url: "boardWish.hb",
	    				type: "get",
						data: {hboardNo: e},
						success: function(result) { console.log(result); },
						error: function() { console.log("찜하기 실패"); }
					});
            }
        </script>
        <jsp:include page="../../common/footer.jsp" />
    </body>
</html>