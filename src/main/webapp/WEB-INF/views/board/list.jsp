<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
<link rel="stylesheet" type="text/css" href="../resources/css/boardlist.css">
</head>
<body>
<header>
	<div class="h1">
		<div class="g1"><a href="#">로그인</a></div>	
		<div class="g1"><a href="#">마이페이지</a></div>
		<div class="g1"><a href="#">관리자 메뉴</a></div>
	</div>
	<div class="h2">
		<div class="g2"><a href="#">그림판</a></div>
		<div class="g2"><a href="#">게시판</a></div>
		<div class="g2"><a href="#">구슬판</a></div>
	</div>
</header>
<div id="center">
	<h1>게시글 목록</h1>
	<div align="right">
		<button type="button" onclick="#">글쓰기</button>
	</div>
	<c:if test="${count != 0}">
		<table>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${postList}" var="post">
				<tr>
					<td><a href="content/${post.postid}">${post.title}</a></td>
					<td>${post.userid}</td>
					<td><fmt:formatDate value="${post.postdate}"
							dateStyle="short" /></td>
					<td>${post.readcount}</td>
				</tr>
			</c:forEach>
		</table>
		<div id="page">
			<c:if test="${begin > pageNum}">
				<a href="list?p=${begin-1}">[이전]</a>
			</c:if>
			<c:forEach begin="${begin}" end="${end}" var="i">
				<a href="list?p=${i}">${i}</a>
			</c:forEach>
			<c:if test="${end < pageNum}">
				<a href="list?p=${end+1}">[다음]</a>
			</c:if>
		</div>
		<div align='right'>
			<form>
				<select name='type'>
					<option value='1'>제목</option>
					<option value='2'>작성자</option>
					<option value='3'>내용</option>
				</select> <input type='text' name='search'> <input type='submit'
					value='검색'>
			</form>
		</div>
	</c:if>
</div>
<br>
<a href="/">처음으로</a>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../resources/js/boardlist
.js"></script>
</body>
</html>