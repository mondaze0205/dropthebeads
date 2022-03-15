<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
<link rel="stylesheet" type="text/css" href="/css/board/write.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<div class="side_top">
		<p>글 작성하기</p>
	</div>
	<div class="side_left">
	</div>
	<div class="side_right">
	</div>
	<div class="center">
		<div class="c_info">
		<p>※ 거래/나눔은 벼룩시장 게시판을 이용해주세요.</p>
		<p>※ 미풍양속에 어긋나는 게시물은 고지 없이 삭제될 수 있습니다.</p>
		</div>
		<div class="c_head">
			<div class="c_head_h">말머리</div>
			<div id="일반" class="c_head_s">일반</div>
			<div id="공지" class="c_head_s">공지</div>
			<div id="자랑" class="c_head_s">자랑</div>
			<div id="리뷰" class="c_head_s">리뷰</div>
			<div id="질문" class="c_head_s">질문</div>
		</div>
		<div class="c_title">
			<input type="text" id="dummyid" value="${dto.title}">
		</div>
		<div class="c_preview">
			<button id="loadbtn" type="button">불러오기</button>
			<div class="canvas">
				<table class="pixel-canvas"></table>
			</div>
		</div>
		
		<div class="c_content">
			<form action="update" method="post" name="writeform">
				<textarea id="postcon" name="postcon">${dto.postcon}</textarea>
				<input type="hidden" id="postid" name="postid" value="${dto.postid}">
				<input type="hidden" id="head" name="head" value="${dto.head}">
				<input type="hidden" id="userid" name="userid" value="${dto.userid}">
				<input type="hidden" id="title" name="title" value="${dto.title}">
				<input type="hidden" id="pictureid" name="pictureid" value="${dto.pictureid}">
				<div class="c_btn">
					<button type="button" id="cancelbtn">취소</button>
					<button type="button" id="submitbtn">등록</button>
				</div>
			</form>
		</div>
	</div>
	<div class="hidearea">
		<textarea id="h_code" readonly></textarea>
		<input type="text" id="h_name" readonly>
		<button type="button" id="h_copy">복사</button>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/board/write.js"></script>
</body>
</html>