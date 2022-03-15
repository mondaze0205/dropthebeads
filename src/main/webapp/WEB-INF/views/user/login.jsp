<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<link rel="stylesheet" type="text/css" href="/css/user/login.css"> 
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<div class="login">
	<h1>로그인</h1>
		<form:form action="trylogin" method="post" modelAttribute="login" id="loginform" class="loginform">
			<div class="id_pw">
				<form:input type="text" path="userid" name="userid" id="userid" placeholder="아이디" />
				<input type="password" name="pw" id="pw" placeholder="비밀번호">
			</div>
			<div class="msg">
				<p id="msg">${e}</p>
			</div>
			<div class="buttons">
				<button type="button" id="loginbtn">로그인</button>
			</div>
		</form:form>
		<div class="others">
			<p id="o_join">회원가입</p>
			<p id="o_findid">아이디 찾기</p>
			<p id="o_findpw">비밀번호 찾기</p>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/user/login.js"></script>
</body>
</html>