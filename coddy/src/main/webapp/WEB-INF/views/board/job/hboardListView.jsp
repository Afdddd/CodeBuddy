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
            .searchForm { width: 100%; height: 15%; padding: 3%; }
            .searchForm1 { width: 100%; height: 80%; border-radius: 20px; }
            .searchForm1 div { width: 100%; border-radius: 20px; }
            .searchForm2 { width: 100%; height: 20%; border-radius: 12px; }
            .hboardMain { width: 100%; height: 70%; padding: 3%; }
            .recommendForm { width: 100%; height: 15%; padding: 3%; }
            #hboardSort { width: 200px; }
        </style>
    </head>
    <body>
        <jsp:include page="../../common/header.jsp" />
        <div class="content">
            <div class="outerForm">
                <div class="searchForm">
                    <div class="searchForm1">
                        <div style="width: 100%; height: 60%; margin: auto; display: flex;">
                            <div style="width: 50%; height: 100%;"></div>
                            <div style="width: 50%; height: 100%;"></div>
                        </div>
                        <div style="width: 100%; height: 40%;"></div>
                    </div><br>
                    <div class="searchForm2">
                        <jsp:include page="../../common/tagTech.jsp" />
                        <jsp:include page="../../common/tagCareer.jsp" />
                    </div>
                </div>
                <div class="hboardMain">
                    <div style="width: 100%; height: 10%;">
                        <div style="float: right; display: flex; margin-top: 2%; margin-bottom: 2%; padding-right: 3%;">
                            <select name="hboardSort" id="hboardSort">
                                <option value="new" selected>최신순</option>
                                <option value="old">마감순</option>
                                <option value="view">조회순</option>
                                <option value="salary">연봉순</option>
                            </select>   
                            <input type="search" class="form-control form-control-lg">
                            <span onclick="" style="height: 100%;"><svg xmlns="http://www.w3.org/2000/svg" height="3em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg></span>
                        </div>
                    </div>
                    <div style="width: 100%; height: 75%;"></div>
                    <div style="width: 100%; height: 15%;"></div>
                </div>
                <div class="recommendForm">

                </div>
            </div>
        </div>
        <jsp:include page="../../common/footer.jsp" />
    </body>
</html>