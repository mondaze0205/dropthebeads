<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/user/findid.css"> 
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="center">
<h1 >아이디 찾기</h1>
<p>회원가입시 입력한 별명과 이메일을 입력해주세요</p>
<form method="post" action="findidaction" class="findidform" name="findidform">
<div class="inputbox"> <input type="text" id="nickname" name="nickname"  required/>		
<span>별명</span></div>
<div class="inputbox"> <input type="text" id="email" name="email"  required/> 
 <span>이메일</span></div>

<div class ="inputbox"><input type="submit" value="찾기"></div>
</form>
</div>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>