<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>${sessionScope.hb.hboardTitle}</title>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=KAKAO_MAP_KEY&libraries=services"></script>
	<style>
		.mainContent { width: 100%; height: 95%; }
		.mainContent div { border-bottom:1px solid; border-color: coral; }
		.subContent { width: 100%; height: 5%; }
		.boardTitleBar { width: 100%; height: 5%; padding: 5px; }
		.boardContentBar { width: 100%; height: 95%; display: flex; }
		.boardContentArea { width: 75%; height: 100%; }
		.boardMiniArea { width: 25%; height: 600px; top: 25%; position: sticky; }
		.boardMiniCard { width: 100%; height: 400px; }
		.boardMiniAttach { width: 100%; height: 200px; }
		.boardContentThumb { width: 100%; height: 420px; padding: 4%; }
		.boardContentTag { width: 100%; height: 120px; }
		.boardContentContent { width: 100%; height: 630px; }
		.boardContentMap { width: 100%; height: 360px; padding: 10px; }

		.tagList { border: 1px solid grey; border-radius: 8px; margin: 3px; padding: 3px; display: inline-flex; }
        .tagList:before { content: '#'; }
        .tagList:hover { cursor: pointer; transform: scale(1.24); background-color: black; color: white; }
        .tagListNo { border: 1px solid grey; border-radius: 8px; margin: 3px; padding: 3px; display: inline-flex; }
        .tagListNo:before { content: '#'; }

		.hattachmentList { text-decoration: none; color: black; }
	</style>
	</head>
	<body>
		<jsp:include page="../../common/header.jsp" />
		<div class="content">
			<div class="mainContent">
				<div class="boardTitleBar">
					<div style="width: 100%; display: flex">
						<img src="resources/file_upload/company/<fmt:formatNumber value='${sessionScope.hb.companyNo}' pattern='00000000' />.jpg" onerror="this.src='resources/image/white.jpg'" width="30px" height="30px">&nbsp;&nbsp;<h4>${sessionScope.cname}</h4>
					</div>
					<h3>${sessionScope.hb.hboardTitle}</h3>
				</div>
				<div class="boardContentBar">
					<div class="boardContentArea">
						<div class="boardContentThumb">
							<img src="${sessionScope.ht.hattachmentPath}/${sessionScope.ht.hattachmentChange}" onerror="this.src='resources/image/white.jpg'" width="100%" height="100%">
						</div>
						<div class="boardContentTag">
							<c:if test="${ empty sessionScope.hr}">
                                <span class="tagListNo">태그없음</span>
                            </c:if>
                            <c:forEach var="tag" items="${sessionScope.hr}">
                                <span class="tagList" onclick="location.href='listView.hb?cpage=1&search=&sort=new&career=none&education=none&tag=${tag.tagsNo}&where=all&viewOn=f'">${tag.tagsNo}</span>
                            </c:forEach>
						</div>
						<div class="boardContentContent">
							<p>${sessionScope.hb.hboardContent}</p>
						</div>
						<div class="boardContentMap">
							<h4 style="border: 2px solid khaki; border-radius: 20px; width: 480px; text-align: center; padding: 2px;" onclick="location.href='listView.hb?cpage=1&search=&sort=new&career=none&education=none&tag=&where=${sessionScope.where}&viewOn=f'">${sessionScope.geo.addr}</h4>
							<h6>우편번호 : ${sessionScope.hb.hboardLocation}</h6>
							<div class="tMap" id="tMap"></div>
						</div>
					</div>
					<div class="boardMiniArea">
						<div class="boardMiniCard">
							
						</div>
						<div class="boardMiniAttach">
							<h4>첨부파일</h4>
							<c:forEach var="att" items="${sessionScope.ha}">
                                <a href='${att.hattachmentPath}/${att.hattachmentChange}' class="hattachmentList" download>${att.hattachmentOrigin}</a>
                            </c:forEach>
						</div>
					</div>
				</div>
			</div>
			<div class="subContent">

			</div>
		</div>
		<script>
			$(function() {
				// var geocoder = new kakao.maps.services.Geocoder();
				var mapContainer = document.getElementById('tMap')
				var mapOption = {
					center: new kakao.maps.LatLng("${sessionScope.geo.lat}", "${sessionScope.geo.lng}"),
					level: 3
				};
				var map = new kakao.maps.Map(mapContainer, mapOption);
			})
			function getParameter(name) {
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
                return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }
		</script>
		<jsp:include page="../../common/footer.jsp" />
	</body>
</html>