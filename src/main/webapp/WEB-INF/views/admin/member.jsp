<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/admin/member.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">

<div class="container">
<div class="side_left"></div>

<div class="center">
	<div class="member_roof">
		<div><p>회원 목록</p></div>
		<div class="makespace"></div>
		<button type="button" id="order_name">이름 순</button>
		<button type="button" id="order_warn">경고 순</button>
	</div>
	<c:choose>
	<c:when test="${list != '[]'}">
	<div class="member_top">
		<div class="userid">아이디</div>
		<div class="nickname">닉네임</div>
		<div class="address">주소</div>
		<div class="email">이메일</div>
		<div class="warning">경고</div>
		<div class="set">설정</div>
	</div>
	<c:forEach items="${list}" var="m" varStatus="ms">
		<div class="member">
			<div class="userid"><p>${m.userid}</p></div>
			<div class="nickname"><p>${m.nickname}</p></div>
			<div class="address"><p>${m.address}</p></div>
			<div class="email"><p>${m.email}</p></div>
			<div class="warning"><p>${m.warning}</p></div>
			<div class="set">
				<button type="button" class="warnbtn" id="warn_${m.userid}">경고</button>
				<button type="button" class="purgebtn" id="purge_${m.userid}">강퇴</button>
			</div>
		</div>
	</c:forEach>
	</c:when>
	<c:otherwise>
		<input type="hidden" id="back" value="back">
	</c:otherwise>
	</c:choose>
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
		
</div>
	
<div class="side_right"></div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/admin/member.js"></script>
</html>