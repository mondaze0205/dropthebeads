<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h1>마이페이지입니다.</h1>
	<br>
	<form>		
		<input type="submit" value="내가 쓴 글"> 
	</form>	<br>
	<form action="http://localhost:8087/updateform" method="get">
		<input type="submit" value="회원 수정">
	</form>	<br>
	<form>
	
		내가 쓴 글
		<input type="button" value="+더보기"> <br>
		<!-- 내가 쓴 글 최신 순서로 올라가기 -->
		<br>
		내가 올린 물품
		<input type="button" value="+더보기"> <br>
		<!-- 내가 올린 물풀 최신 순서로 올라가기 -->
	</form><br>
	<a href="http://localhost:8087/">처음으로</a>
	

</body>
</html>