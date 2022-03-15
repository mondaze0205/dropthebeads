<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/user/join.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
<form:form action="insert" method="post" class="join_form" id="join_form" modelAttribute="insertDto">
	<div class="join_text">아이디</div>
	<div class="join_item">
		<form:input type="text" path="userid" id="userid" name="userid" oninput="this.value = this.value.replace(/[^0-9a-z]/g, '');" />
		<p id="id_msg">영문 소문자와 숫자만 사용 가능합니다.</p>
		<form:errors path="userid" delimiter=" "></form:errors>
	</div>
	<div class="join_text">비밀번호</div>
	<div class="join_item">
		<input type="text" id="pw" name="pw" oninput="this.value = this.value.replace(/[^0-9a-zA-Z!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\,\.]/g, '');">
	</div>
	
	<div class="join_text">비밀번호 재확인</div>
	<div class="join_item">
		<input type="text" id="pw1" name="pw1" oninput="this.value = this.value.replace(/[^0-9a-zA-Z!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\,\.]/g, '');">
		<p id="pw_msg">영문자와 숫자, 특수기호가 최소 한 글자씩 필요합니다.</p>
	<form:errors path="pw" delimiter=" "></form:errors>
	</div>
	
	<div class="join_text">닉네임</div>
	<div class="join_item">
		<form:input type="text" path="nickname" id="nickname" name="nickname" oninput="this.value = this.value.replace(/[\s]/g, '');"/>
		<p id="nick_msg">닉네임을 입력하세요. 공백문자는 사용 불가합니다.</p>
		<form:errors path="nickname" delimiter=" "></form:errors>
	</div>
	
	<div class="join_text">생년월일</div>
	<div class="join_birth">
		<input type="text" id="year" placeholder="년(4자)" oninput="this.value = this.value.replace(/[^0-9]/g, '');">
		<div class="makespace"></div>
		<select id="month">
			<option value="01">1월</option>
			<option value="02">2월</option>
			<option value="03">3월</option>
			<option value="04">4월</option>
			<option value="05">5월</option>
			<option value="06">6월</option>
			<option value="07">7월</option>
			<option value="08">8월</option>
			<option value="09">9월</option>
			<option value="10">10월</option>
			<option value="11">11월</option>
			<option value="11">12월</option>
		</select>
		<div class="makespace"></div>
		<select id="day">
			<option value="01">1일</option>
			<option value="02">2일</option>
			<option value="03">3일</option>
			<option value="04">4일</option>
			<option value="05">5일</option>
			<option value="06">6일</option>
			<option value="07">7일</option>
			<option value="08">8일</option>
			<option value="09">9일</option>
			<option value="10">10일</option>
			<option value="11">11일</option>
			<option value="12">12일</option>
			<option value="13">13일</option>
			<option value="14">14일</option>
			<option value="15">15일</option>
			<option value="16">16일</option>
			<option value="17">17일</option>
			<option value="18">18일</option>
			<option value="19">19일</option>
			<option value="20">20일</option>
			<option value="21">21일</option>
			<option value="22">22일</option>
			<option value="23">23일</option>
			<option value="24">24일</option>
			<option value="25">25일</option>
			<option value="26">26일</option>
			<option value="27">27일</option>
			<option value="28">28일</option>
			<option value="29">29일</option>
			<option value="30">30일</option>
			<option value="30">31일</option>
		</select>
		<div class="hidearea">
			<form:input type="text" path="birth" id="birth" name="birth" />
			<button type="button" id="birthbtn">버튼</button>
		</div>
		<form:errors path="birth" delimiter=" "></form:errors>
	</div>
	
	<div class="join_text">주소</div>
	<div class="join_item">
		<div class="item_line1">	
			<input type="text" id="address_1">
			<div class="makespace"></div>
			<button type="button" id="addbtn" onclick="addPost()">검색</button>
		</div>
		<div class="item_line2">
			<input type="text" id="address_2" placeholder="상세 주소 입력">
		</div>
		<div class="hidearea">
			<form:input type="text" path="address" id="address" name="address" />
			<button type="button" id="addressbtn">버튼</button>
		</div>
		<form:errors path="address" delimiter=" "></form:errors>
	</div>
	
	<div class="join_text">이메일</div>
	<div class="join_item">
		<div class="item_line1">
			<form:input type="text" path="email" id="email" name="email" placeholder="이메일" />
			<div class="makespace"></div>
			<button type="button" id="mail_ck">인증 발송</button>
		</div>
		<div class="item_line1">
			<input type="text" id="ck_num" placeholder="인증번호">
			<div class="makespace"></div>
			<button type="button" id="ck_b">확인</button>
		</div>
		<p id="email_msg">이메일 인증이 필요합니다.</p>
		<form:errors path="email" delimiter=" "></form:errors>
	</div>
	
	<div class="join_text">자동 가입 방지 테스트</div>
	<div class="join_item">
		<div class="g-recaptcha" id="re" data-sitekey="6Lco2XweAAAAAHkp6un9euB-ue4j3_VsqfDlHMEW"></div>
		<p id="recapcha_msg">테스트를 통과해주세요.</p>
	</div>
	<div class="submit_btns">
		<button type="button" id="submit_btn">가입</button>
		<button type="button" id="cancel_btn">취소</button>
	</div>
</form:form>
</div>
<div class="hidearea">
	<input type="text" id="id_check" value="0" readonly>
	<input type="text" id="pw_check" value="0" readonly>
	<input type="text" id="nick_check" value="0" readonly>
	<input type="text" id="mail_check" value="0" readonly>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/user/join.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
</body>
</html>