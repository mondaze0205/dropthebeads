<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정</title>
</head>
<body>
	<style>
		 form {font-size : 150%;  margin: 20px;}
	</style>
	
	<form action="http://localhost:8087/Mypage" method="get">		
		<input type="submit" value="내가 쓴 글"> 
	
	<input type="button" value="회원 수정">
	</form>
	
	<form action="update" method="post" id="Mypage">
		
		<label for="id">ID </label>
		<input type="text" id="id" value="${user.id}" readonly><br>

		<label for="pw">PW </label> 
		<input type="password" name="pw" id="pw1" placeholder="8~16자리의 영문,숫자,특수문자를 조합하여 설정하시오" required><br>

		<label for="pw">PW확인 </label> 
		<input type="password" name="pw" id="pw2" placeholder="위 비밀번호와 일치하게 설정하시오" required><br>

		<label for="nickname">닉네임 </label> 
		<input type="text" id="nickname" value="${user.nickname}">
		<input type="button" name="nickname" id="nn_check" value="중복확인"><span id="nn_msg"></span><br>

		<label for="email">이메일 </label> 
		<input type="email" name="email" id="email" value="${user.email}"><br>

		<label for="gender">성별 </label>
		<input type="radio" id="gender" name="gender" value="male">남자
		<input type="radio" id="gender" name="gender" value="female">여자<br>
		
		주소
		<input type="text"  id="address" name="address" placeholder="우편번호" value="${user.address}"> 
		<input type="button"  id="addbtn" value="우편번호 찾기" onclick="addPost()"><br>
		<input type="text" name="address1" placeholder="상쇄 주소">
		<br>
		
		<label for="date">생년월일 </label>
		<input type="date" name="date" id="date" 
			value='<fmt:formatDate value="${user.date}" pattern="yyyyMMdd"/>'><br> 
		
		<input type="submit" value="완료">
		<input type="reset" value="취소">
	
		</form>
		
		<form action="DeleteForm">
			<label for="drop">회원탈퇴 </label>
			<input type="submit" id="drop" name="delete" value="탈퇴 진행"><br> 
		</form>
		

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function addPost(){
	new daum.Postcode({
		oncomplete: function(date) {
			document.querySelector("#address").value = data.address;
		}
	}).open();
}

$(function(){
	$("#pw2").outfocus(function(){
		if("#pw1"=="#pw2"){
			getelementid
			print("사용 가능한 비밀번호입니다.")
		}else{
			print("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.")
		}
		
	})
	
})

	
$(function(){
	$("#nn_check").click(function(){ 
		let nickname = $("#nickname").val(); //검사할 값을 꺼내온다
		if(!nickname){ 
			$("#nn_msg").html("닉네임를 입력하세요") //중복될 경우 보낼 메세지
			return false;
		}//유효성 검사
		$.ajax({url:"/nnCheck", data:"nickname="+nickname, datatype:"text"} //검사할 nickname값으로 검사할 nickname값 보내기 
		).done(function(data){ //검사한 data 받아오기
			
			if(data == ""){
				$("#nn_msg").html("사용 가능한 닉네임입니다.")
				$("#nn_msg").append("<input type='hidden' id='nn_ck' value='1'>")
				//닉네임 검사하고 안보이도록 '1'의 값을 넣는다
			}else{
				$("#nn_msg").html("이미 사용중인 닉네임 입니다.")
			}
		}) //아이디 중복 확인
	});//click
})//ready
</script>
</body>
</html>










