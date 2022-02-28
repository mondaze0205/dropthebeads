<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벼룩시장 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&family=Roboto:wght@300&display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<h2 class="mb-1">벼룩시장 글 수정</h2>
<form method="post" id="fupdate" action="/flea/fupdate">
<input type="hidden" name="_method" value="put">
<table class="type02">
		<tr>
			<th class="row">*제목</th>
			<td><input name="f_title" value="${dto.f_title}"/>
				<input name='f_postno' value="${dto.f_postno}" type="hidden">
			</td>
		</tr>
		<tr>
			<th class="row">아이디</th>
			<td><input name="userid" value="${dto.userid}" readonly></td>
		</tr>
		<tr>
			<th class="row">*카테고리</th>
			<td><select name ="f_category" id="f_category" value="${dto.f_category}">
				<option value="0"selected>선택</option>
				<option value="판매" >판매</option>
				<option value="구매" >구매</option>
			</select></td>
		</tr>
		<tr>
			<th class="row">*가격</th>
			<td><input type="text" name="f_price" value="${dto.f_price}"></td>
		</tr>
		<tr>
			<th class="row">거래 지역 설정</th>
			<td><input name="f_addr" value="${dto.f_addr}">
			<button type="button" class="addbtn" id="addbtn" onclick="addPost()">검색</button></td>
		</tr>
		<tr>
			<td colspan="2"><b>내용</b><br>
			<textarea name="f_content" cols="86" rows="10">${dto.f_content}</textarea></td>
		</tr>
		<tr>
			<th class="row">이미지 올리기</th>
			<td><input type="file" name=""></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="완료"> 
			    <input type="button" id="btn" value="취소" />
			</td>
		</tr>
	</table>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function addPost(){
    new daum.Postcode({
        oncomplete: function(data) {
        	document.querySelector("#address").value = data.address;
        	alert("거래장소가 변경되었습니다.");
        }
    }).open();
}

$(function(){
    $("#btn").click(function(){
        //alert("취소버튼");
        var check = confirm("정말로 글쓰기를 취소하시겠습니까?");
        if (check) {
        	history.back();
        }
    })
})

</script>
</body>
</html>
