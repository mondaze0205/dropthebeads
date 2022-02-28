<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴</title>
</head>
<body>
<h3>삭제 페이지입니다. 비밀번호를 입력하세요</h3>
<form method="post" onsubmit="checkVal()" action="delete">
	<label for="pw"></label>
	<input type="password" name="formpw" id="password">
	
	<input type="submit" value="회원 탈퇴">
</form>
<script type="text/javascript">
	function checkVal(){
		let pw = document.querySelector("#pw").value;
		if(!pw){
			alert("비밀번호를 입력하세요")
			return false;
		}
	}
	
	
</script>
</body>
</html>