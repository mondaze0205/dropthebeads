<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#input , #result{ display: none;}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/join.js"></script></body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../resources/js/join.js"></script>
<form action="insert"  method="post"  id="joinform" >
	<table>
	<tr><td>아이디</td><td><input name="userid" id="userid">
	<input type="button" id="id_check" value="ID 중복확인" placeholder="아이디 중복체크하세요.">
	<span id="id_msg"></span></td></tr>
	<tr><td>비밀번호</td><td><input name ="pw" type="password" id="pw"></td></tr>
	
	<tr><td>별명</td><td><input name="nickname"  id="nickname">
	 			<input type="button" id="nick_check" value="별명 중복확인" placeholder="별명 중복체크하세요.">
	 			<span id="nick_msg"></span></td></tr>
	 			
	<tr><td>생년월일</td><td><input name="birth" id="birth" placeholder="yyyyMMdd">
	<tr><td>우편번호 검색</td><td> <input name="address" id="address">
	<input type="button" id="addbtn" value="우편번호 검색" onclick="addPost()"> </td></tr>
		
	<tr><td>email</td><td><input name="email" id="email">
		<div id="emailresult"></div>
		<input type="button" id="mail_ck" value="메일 인증">
		<div id="input"><input id="ck_num"> <input type="button" id="ck_b" value="인증 확인"></div>
		<div id="result"></div>
		</td></tr>
		<tr><td colspan="2"><input type="submit" value="가입"></td></tr>
	</table>
	
</form>

</html>