<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link rel="stylesheet" type="text/css" href="/css/board/list.css">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>
</head>

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">

<div class="title-board">
	<h2 class="mb-2">COMMUNITY</h2>
	<hr class="dots">
	<span>여기 COMMUNITY 게시판에서는 자유롭게 대화할 수 있어요.<br>
    공지는 꼭 확인해주시고! 멋지게 만든 공예품을 자랑하거나 궁금했던 부분을 질문해보세요.<br>
    일생 생활 속의 소소한 이야기도 좋아요<i class="fa-regular fa-face-grin-wide"></i></span>
</div> 

<div class="container">
<div class="side_top">
	<button type="button" onclick="location.href='list?h=0'">새로고침</button>
	<button type="button" id="allbtn">모든글</button>
	<button type="button" id="bestbtn">인기글</button>
	<p id="p0">전체</p>
	<p id="p1">공지</p>
	<p id="p2">자랑</p>
	<p id="p3">리뷰</p>
	<p id="p4">질문</p>
	<button type="button" class="writebtn" id="writebtn">글쓰기</button>
</div>
	<div class="side_left">
	</div>
<div class="center">
	<c:if test="${count != 0}">
		<div class="tabletop">
			<div class="tbno">번호</div>
			<div class="tbhead">말머리</div>
			<div class="tbtitle">제목</div>
			<div class="tbuser">작성자</div>
			<div class="tbdate">작성일</div>
			<div class="tbcount">조회수</div>
			<div class="tbrec">추천</div>
		</div>
		<c:forEach items="${postList}" var="post">
			<div class="table">
				<div class="tbno">${post.postid}</div>
				<div class="tbhead">${post.head}</div>
				<div class="title"><a href="content/${post.postid}">${post.title}</a></div>
				<div class="tbuser">${post.nickname}</div>
				<div class="tbdate"><fmt:formatDate value="${post.postdate}" dateStyle="short" /></div>
				<div class="tbcount">${post.readcount}</div>
				<div class="tbrec">${post.rec}</div>
			</div>
		</c:forEach>
	
		<div class="page">
			<c:if test="${begin > pageNum}">
				<div class="before" id="p=${begin-1}">[이전]</div>
			</c:if>
			<c:forEach begin="${begin}" end="${end}" var="i">
				<div class="pages" id="p=${i}">${i}</div>
			</c:forEach>
			<c:if test="${end < pageNum}">
				<div class="next" id="p=${end+1}">[다음]</div>
			</c:if>
		</div>
		<div class="searcharea" align='center'>
			<select id='searchtype'>
				<option value='1'>제목</option>
				<option value='2'>글쓴이</option>
				<option value='3'>내용</option>
			</select>
			<input type='text' id='searchword'>
			<button type='button' id="searchbtn">검색</button>
			<button type='button' id="searchbtnx">취소</button>
		</div>
	</c:if>
</div>
<div class="side_rank">
	<img src="/image/ranking.jpg" style="width:100%">
    <div class="ranktext"><p>현재 게임 랭킹☆<br>
		<c:forEach items="${rank}" var="b" begin="0" end="2" step="1" varStatus="v">
			<c:if test="${b.gscore != 0}">
				<h2>${v.index+1}위. ${b.nickname}</h2>
				<h2>${b.gscore}점</h2>
			</c:if>
		</c:forEach>
	<div class="gogame">
	    <a href="../game/carrotgame">바로가기 <i class="fa-solid fa-arrow-right"></i></a>
	</div>
    </div>   
</div>
	<div class="side_right">
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/board/list.js"></script>
</body>
</html>