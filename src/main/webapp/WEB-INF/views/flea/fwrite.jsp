<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벼룩시장 글쓰기</title>
<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&family=Roboto:wght@300&display=swap" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<h2 class="mb-1">벼룩시장 글 작성</h2>
<form method="post" id="fwrite" enctype="multipart/form-data">
<table class="type02">
		<tr>
			<th class="row">*제목</th>
			<td><input name="f_title" size=30 required></td>
		</tr>
		<tr>
			<th class="row">닉네임</th>
			<td><input name="userid" style="border:0 solid black;" value="${user.userid}" readonly></td>
		</tr>
		<tr>
			<th class="row">*카테고리</th>
			<td><select name ="f_category" id="f_category" required>
				<option value="">선택</option>
				<option value="판매">판매</option>
				<option value="구매">구매</option>
			</select></td>
		</tr>
		<tr>
			<th class="row">*가격(필수)</th>
			<td><input type="text" name="f_price" placeholder="숫자만 입력가능" class="numberOnly" required>원</td>
			
		</tr>
		<tr>
			<th class="row">거래 지역 설정</th>
			<td><input name="f_addr" id="address">
			<button type="button" class="addbtn" id="addbtn" onclick="addPost()">검색</button></td>
		</tr>
		<tr>
			<td colspan="2"><b>내용</b><br>
			<textarea name="f_content" cols="86" rows="10"></textarea>
			<img id='output' width="150px" height="auto"></td>
			
		</tr>
		<tr>
			<th class="row">이미지 올리기</th>
			<td><input type="file" accept='image/*' onchange='openFile(event)' name="f_img" multiple><br></td>
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
        	alert("주소가 등록되었습니다.");
        }
    }).open();
}

$(".numberOnly").on("keyup", function(event) {
    if (event.which && (event.which  > 47 && event.which  < 58 || event.which == 8)) {
        
    }else{
        alert('숫자만 입력해주세요.');
        $(this).val($(this).val().replace(/[^0-9]/g,""));
    }
});

$(function(){
    $("#btn").click(function(){
        //alert("취소버튼");
        var check = confirm("정말로 글쓰기를 취소하시겠습니까?");
        if (check) {
        	history.back();
        }
    })
})
  var openFile = function(event) {
    var input = event.target;

    var reader = new FileReader();
    reader.onload = function(){
      var dataURL = reader.result;
      var output = document.getElementById('output');
      output.src = dataURL;
    };
    reader.readAsDataURL(input.files[0]);
  };
</script>
</body>
</html>