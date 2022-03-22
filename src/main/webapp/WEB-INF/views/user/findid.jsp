<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/user/findid.css">

<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">

</head>
<body>

<div class="center">
<h1 >아이디 찾기</h1>
<hr class="dots">
<p>회원가입시 입력한 별명과 이메일을 입력해주세요</p>
<form method="post" action="findidaction" class="findidform" name="findidform">
<div class="inputbox"> 
	<input type="text" id="nickname" name="nickname"  required/>		
<span>별명</span>
</div>
<div class="inputbox"> 
<input type="text" id="email" name="email"  required/> 
<span>이메일</span>
</div>

<div class ="inputbox"><input type="submit" value="찾 기"></div>
</form>
</div>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>


</body>
</html>