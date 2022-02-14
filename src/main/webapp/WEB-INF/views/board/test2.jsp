<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 테스트 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/css/content.css">
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
	</div>
	<div class="side_left">
	</div>
	<div class="side_right">
	</div>
	<div class="center">
		<div class="title">
		{말머리} 제목
		${dto.head} ${dto.title}
		</div>
		<div class="user">
		${dto.userid} ${dto.readcount} ${dto.rec}
		</div>
		<div class="canvas">
		그림나오는 공간
		</div>
		<div class="content">
		${dto.postcon}
		</div>
		<div class="reply">
		댓글창
		</div>
		<div class="writereply">
			<div class="writereply_1">
				<form class="replyzone">
					<textarea placeholder="댓글을 작성해주세요."></textarea>
					<input type="hidden" id="userid" name="userid" value="">
					<input type="hidden" id="postid" name="postid" value="">
				</form>
			</div>
			<div class="writereply_2">
				<p>※ 운영 정책을 위반하는 댓글은 무통보 삭제될 수 있습니다.</p>
				<div class="makespace"></div>
				<button type="button" class="submit">댓글 남기기</button>
				<button type="button" class="withrec">추천과 함께</button>
			</div>
		</div>
	</div>
</div>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <script src="/js/boardwrite.js"></script> -->
</body>
</html>