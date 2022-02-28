<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/user/findpw.js"></script>
<body>
	<form id ="findpw" >
      				<div >
						<label  for="userid">아이디</label>
						<div>
							<input type="text" id="userid" name="userid" placeholder="ex) godmisu">
							
						
						</div>
					</div>
					<div >
						<label for="email">이메일</label>
						<div>
							<input type="text"  id="email"	name="email" placeholder="ex) E-mail@gmail.com">
							<span id="email_msg"></span>
						</div>
					</div>
					<div>
						<button type="button" id="pwBtn" >제출 </button>
						</div>
						<P>
						<button type="button" onclick="location.href='/lohin'">회원가입</button>
						<button type="button" onclick="location.href='/findid'">아이디 찾기</button>
	</form>
</body>
</html>