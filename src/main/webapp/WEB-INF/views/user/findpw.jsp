<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/user/findpw.css">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
 
</head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/user/findpw.js"></script>
<body>
<div class="center">

<h1>비밀번호 찾기</h1>
<hr class="dots">
<p>회원가입시 작성한 아이디, 이메일을 기입해주세요.</p>
	<form id ="findpw" >
		<div class="inputbox">
		  <input   type="text" id="userid" name="userid"  required="required">
			<span>아이디</span>	
		 </div>	
		<div class="inputbox"> 
		  <input type="text"  id="email"  name="email" required="required">
			 <span>이메일</span>
		</div>
		<div class="inputbox">
		<input type="button" id="pwBtn"  value="제 출">
		 </div>
		 <div class ="inputbox2">
			<input type="button" onclick="location.href='/findid'" value="아이디찾기">
		</div>
		</form>
		</div>
		<span id="email_msg"></span>
		
</body>
</html>