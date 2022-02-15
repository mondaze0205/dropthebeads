<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login.jsp</title>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css"> 
</head>
<body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../resources/js/login.js"></script>
<h1>로그인 폼</h1>
<form:form action="trylogin" method="post" modelAttribute="welcome">
<form:errors element="div"/>
<div>
<label for="userid">ID</label>
<input type="text" name="userid" id="userid">
<form:errors path="userid" delimiter=" "></form:errors>
</div>
<div>
<label for="pw">비밀번호</label>
<input type="password" name="pw" id="pw">
<form:errors path="pw" delimiter=" "></form:errors>
</div>
<div>
<input type="submit" value="눌러"></div>
			<button type="button" onclick="location.href='/join'">회원가입</button>
			<button type="button" onclick="find()">아이디 찾기</button>
						
</form:form>

</body>
</html>