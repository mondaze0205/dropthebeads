<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link rel="stylesheet" type="text/css" href="/css/header.css">
<link rel="stylesheet" type="text/css" href="/css/boardlist.css">
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
	<button type="button" onclick="location.href='list?h=0'">새로고침</button>
	<button type="button" id="allbtn">모든글</button>
	<button type="button" id="bestbtn">인기글</button>
	<p id="p0">전체</p>
	<p id="p1">공지</p>
	<p id="p2">자랑</p>
	<p id="p3">리뷰</p>
	<p id="p4">질문</p>
	<button type="button" class="writebtn" onclick="location.href='write'">글쓰기</button>
</div>
	<div class="side_left">
	</div>
<div class="center">
	<c:if test="${count != 0}">
		<table>
			<tr>
				<th class="tbno"><div class="tbmin">번호</div></th>
				<th class="tbhead">말머리</th>
				<th class="tbtitle">제목</th>
				<th class="tbuser">작성자</th>
				<th class="tbdate">작성일</th>
				<th class="tbcount">조회수</th>
				<th class="tbrec">추천</th>
			</tr>
			<c:forEach items="${postList}" var="post">
				<tr>
					<td class="tdcen"><div class="tdmin">${post.postid}</div></td>
					<td class="tdcen">${post.head}</td>
					<td><a href="content/${post.postid}">${post.title}</a></td>
					<td class="tdcen">${post.userid}</td>
					<td class="tdcen"><fmt:formatDate value="${post.postdate}"
							dateStyle="short" /></td>
					<td class="tdcen">${post.readcount}</td>
					<td class="tdcen">${post.rec}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="page">
			<c:if test="${begin > pageNum}">
				<!--  <a href="list?p=${begin-1}">[이전]</a> -->
				<div class="before" id="p=${begin-1}">[이전]</div>
			</c:if>
			<c:forEach begin="${begin}" end="${end}" var="i">
				<!-- <a href="list?p=${i}">${i}</a> -->
				<div class="pages" id="p=${i}">${i}</div>
			</c:forEach>
			<c:if test="${end < pageNum}">
				<!-- <a href="list?p=${end+1}">[다음]</a> -->
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
	<div class="side_right">
	</div>
</div>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/boardlist.js"></script>
</body>
</html>