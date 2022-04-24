<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정하기</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/info.css">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

</head>
<body>

<div class="container">
<div class="left">
	<div class="smile">
		<a href="http://localhost:8087/"><img src="/image/smile.png" alt="" class="sm-1" width="70px" height="auto">
		<img src="/image/smile2.png" alt="" class="sm-2" width="70px" height="auto"></a>
	</div>	
	<div class="logo">
 			<h1 class="edit_title2">${userid}<br>내 정보 수정하기</h1>
	</div>
</div>

<div class="right">	
	<h1 class="edit_title">EDIT PASSWORD</h1>	

		<input type="hidden" id="master" value="${userid}">
		<input type="hidden" id="login_userid" value="${user.userid}">
		<form action="../../mypage2/pwedit" method="post" class="update_form"
			name="update_form">

			<div class="update_text">비밀번호</div>
			<div class="update_item">
				<input type="password" id="pw1"
					oninput="this.value = this.value.replace(/[^0-9a-zA-Z!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\,\.]/g, '');">
				<p id="pw_msg1">8~16자리의 영문,숫자,특수문자를 조합하여 설정하시오.</p>
			</div>

			<div class="update_text">비밀번호 재확인</div>
			<div class="update_item">
				<input type="password" id="pw2"	oninput="this.value = this.value.replace(/[^0-9a-zA-Z!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\,\.]/g, '');">
				<p id="pw_msg2">위 비밀번호와 일치하게 설정하시오</p>
			</div>
			
			<div class="up_submit">
				<button type="button" id="up_submit">수정</button>
				<button type="button" id="up_cancel">취소</button>
			</div>

			<div class="hidearea">
				<input type="text" name="userid" value="${user.userid}">
				<input type="text" id="pw3" name="pw" value="${user.pw}">
				<input type="text" id="pw1_check" value="1" readonly> 
				<input type="text" id="pw2_check" value="1" readonly> 
			</div>

		</form>

	</div>
</div>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/mypage/pwedit.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>