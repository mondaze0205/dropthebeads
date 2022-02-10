<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write.jsp</title>
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/css/boardwrite.css">
</head>
<body>
<header>
	<div class="h1">
		<div class="g1"><a href="#">로그인</a></div>	
		<div class="g1"><a href="#">마이페이지</a></div>
		<div class="g1"><a href="#">관리자 메뉴</a></div>
	</div>
	<div class="h2">
		<div class="g2"><a href="#">픽셀아트</a></div>
		<div class="g2"><a href="#">커뮤니티</a></div>
		<div class="g2"><a href="#">구매페이지</a></div>
	</div>
</header>
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
			<input type="text" id="dummyid" placeholder="제목을 입력해주세요">
		</div>
		<div class="c_preview">
			<button id="loadbtn" type="button">불러오기</button>
			<div class="canvas">
				<table class="pixel-canvas"></table>
			</div>
		</div>
		
		<div class="c_content">
			<form action="boardwrite" method="post" name="writeform">
				<textarea id="postcon" name="postcon"></textarea>
				<input type="hidden" id="head" name="head" value="일반">
				<input type="hidden" id="userid" name="userid" value="dulgi">
				<input type="hidden" id="title" name="title">
				<input type="hidden" id="pictureid" name="pictureid" value="1">
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

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/boardwrite.js"></script>
</body>
</html>