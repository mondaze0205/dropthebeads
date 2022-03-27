<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/exit.css">

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
	<form class="withdrawform">
		<div class="div1">
			<h3>${user.userid}님</h3>
			<h2>정말 탈퇴하시겠어요? <i class="fa-regular fa-face-sad-tear"></i></h2>
			<input type="hidden" value="${user.userid}" id="userid" name="userid">
		</div>
		
		<div class="div1">비밀번호를 입력해주세요</div>
		<div class="div2">
			<input type="text" id="pw" name="pw">
		</div>
		
		<div class="div1">'회원탈퇴'를 입력해주세요</div>
		<div class="div2">
			<input type="text" id="check">
		</div>
		
		<div class="buttons">
			<button type="button" id="withdrawbtn">탈퇴</button>
			<button type="button" id="cancelbtn">취소</button>
		</div>
	</form>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/mypage/exit.js"></script>
</html>