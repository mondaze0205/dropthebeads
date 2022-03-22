<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="container">
<div class="side_left"></div>
<div class="center">
	<div class="item_top">
		<h1>이번달 베스트
		</h1>
	</div>
	<c:choose>
		<c:when test="${bbdto == 'none'}">
			<div class="none">
				<p>아직 인기 게시물이 없는 듯?</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${bbdto}" var="bb" varStatus="bbs">
				<input type="hidden" id="bbsize" value="${fn:length(bbdto)}">
				<div class="item_box" id="${bb.postid}">
					<div class="picture">
						<div class="hidearea">
							<input type="hidden" id="${bbs.index}_picid" value="${bb.pictureid}">
							<textarea id="code_${bbs.index}" readonly></textarea>
							<p>${bb.pictureid}</p>
						</div>
						<div class="canvas">
							<table class="pixel-canvas" id="table_${bbs.index}"></table>
						</div>
					</div>
					<div class="title">
						<p>${bb.title}</p>
					</div>
					<div class="postcon">
						<p>${bb.postcon}</p>
					</div>
					<div class="etc">
						<p class="readcount">조회수 : ${bb.readcount}</p>
						<p class="rec">추천수 : ${bb.rec}</p>
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>

</div>
<div class="side_right"></div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/index.js"></script>
</body>
</html> 