<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/mine.css">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">

<div class="container">
<div class="side_left"></div>
<div class="center">
<div class="top">
	<div>
	<p><i class="fa-solid fa-user"></i> ${userid} <small style="color:black;">님의 페이지입니다.</small></p>
	<input type="hidden" id="master" value="${userid}">
	</div>
</div>	
<div class="menubar">
	<div class="menu selected" id="board"><p>커뮤니티 - 글</p></div>
	<div class="menu" id="reply"><p>커뮤니티 - 댓글</p></div>
	<div class="menu" id="picture"><p>그림판</p></div>
	<div class="menu" id="fboard"><p>벼룩시장 - 글</p></div>
	<div class="menu" id="freply"><p>벼룩시장 - 댓글</p></div>
	<div class="hr"><hr></div>
	<div class="menu myinfo" id="myinfo"><p>내 정보</p></div>
	<div class="pwedit" id="pwedit"><p>비밀번호 수정</p></div>
	<div class="withdraw" id="withdraw" onclick="location.href='/bye';"><p>회원 탈퇴</p></div>
</div>
<div class="con">
	<c:choose>
		<c:when test="${blist == 'none'}">
			<div class="none">
				<p>작성한 게시물이 없습니다.</p>
			</div>
		</c:when>
		<c:otherwise>
			<c:forEach items="${blist}" var="b" varStatus="bs">
				<div class="trace">
					<div class="t1" id="${b.postid}">
						<h5>${b.title}</h5>
						<h6><fmt:formatDate value="${b.postdate}" pattern="yy.MM.dd" /></h6>
					</div>
					<div class="t2">
					</div>
				</div>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>

</div>
<div class="side_right"></div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/mypage/board.js"></script>
</html>