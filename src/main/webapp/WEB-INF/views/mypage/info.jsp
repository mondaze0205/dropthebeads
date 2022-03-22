<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정하기</title>
<link rel="stylesheet" type="text/css" href="/css/mypage/info.css">
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<hr color="#00af79" size="2px">

	<div class="container">
		<input type="hidden" id="master" value="${userid}">
		<form action="../../mypage2/update" method="post" class="update_form"
			name="update_form">

			<div class="update_text">아이디</div>
			<div class="update_item">
				${user.userid} <input type="hidden" value="${user.userid}"
					name="userid">
			</div>

			<div class="update_text">비밀번호</div>
			<div class="update_item">
				<input type="text" id="pw1"
					oninput="this.value = this.value.replace(/[^0-9a-zA-Z!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\,\.]/g, '');">
				<p id="pw_msg1">8~16자리의 영문,숫자,특수문자를 조합하여 설정하시오.</p>
			</div>

			<div class="update_text">비밀번호 재확인</div>
			<div class="update_item">
				<input type="text" id="pw2"	oninput="this.value = this.value.replace(/[^0-9a-zA-Z!?@#$%^&*():;+-=~{}<>\_\[\]\|\\\,\.]/g, '');">
				<p id="pw_msg2">위 비밀번호와 일치하게 설정하시오</p>
				<input type="hidden" id="pw3" name="pw" value="${user.pw}">
			</div>

			<div class="update_text">닉네임</div>
			<div class="update_item">
				<div class="item_line1">
					<input type="text" id="nickname1" name="nickname"
						value="${user.nickname}">
					<div class="makespace"></div>
					<button type="button" id="nn_check">중복확인</button>
				</div>
				<p id="nn_msg">기존 닉네임을 사용합니다.</p>
			</div>

			<div class="update_text">생년월일</div>
			<div class="update_birth">
				<input type="text" id="year"
					oninput="this.value = this.value.replace(/[^0-9]/g, '');">
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
			</div>

			<div class="hidearea">
				<input type="text" id="birth" name="birth"
					value='<fmt:formatDate value="${user.birth}" pattern="yyyy.MM.dd" />'>
				<button type="button" id="birthbtn">버튼</button>
			</div>

			<div class="update_text">이메일</div>
			<div class="update_item">
				<div class="item_line1">
					<input type="text" id="email" name="email" value="${user.email}">
					<div class="makespace"></div>
					<button type="button" id="mail_ck">인증 발송</button>
				</div>
				<div class="item_line1">
					<input type="text" id="ck_num" placeholder="인증번호">
					<div class="makespace"></div>
					<button type="button" id="ck_b">확인</button>
				</div>
				<p id="email_msg">기존 이메일 주소를 사용합니다.</p>
			</div>

			<div class="update_text">주소</div>
			<div class="update_item">
				<div class="item_line1">
					<input type="text" id="address_1">
					<div class="makespace"></div>
					<button type="button" id="addbtn">검색</button>
				</div>
				<div class="item_line2">
					<input type="text" id="address_2">
				</div>
				<div class="hidearea">
					<input type="text" id="address" name="address"
						value="${user.address}">
					<button type="button" id="addressbtn">버튼</button>
				</div>
			</div>

			<div class="up_submit">
				<button type="button" id="up_submit">수정</button>
				<button type="button" id="up_cancel">취소</button>
			</div>

			<div class="hidearea">
				<input type="hidden" name="warning" value="${user.warning}">
				<input type="text" id="pw1_check" value="1" readonly> 
				<input type="text" id="pw2_check" value="1" readonly> 
				<input type="text" id="nn2_check" value="1" readonly>
				<input type="text" id="bir_check" value="1" readonly>
				<input type="text" id="mail_check" value="1" readonly>
			</div>

		</form>

	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/mypage/info.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>