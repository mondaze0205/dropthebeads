<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벼룩시장 수정 페이지</title>

<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>
<!-- 지도 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
<!-- 헤더 -->
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">

<div class="title_flea">
	<h2 class="mb-1">벼룩시장 글 수정</h2>
	<hr class="dots">
	<span>* 별표가 되어있는 칸은 필수 작성란입니다. <br></span>
</div>

<form method="post" id="fupdate" action="/flea/fupdate" enctype="multipart/form-data">
<input type="hidden" name="_method" value="put">
<table class="type02">

		<tr>
			<th class="row">*제목</th>
			<td><input name="f_title" value="${dto.f_title}" size=40 style="border:0 solid black;" required />
				<input name='f_postno' value="${dto.f_postno}" type="hidden">
			</td>
		</tr>
		<tr>
			<th class="row">아이디</th>
			<td><input name="userid" value="${dto.userid}" style="border:0 solid black;" readonly></td>
		</tr>
		<tr>
			<th class="row">*카테고리</th>
			<td><select name ="f_category" id="f_category" value="${dto.f_category}" required>
				<option value=""selected>선택</option>
				<option value="판매" >판매</option>
				<option value="구매" >구매</option>
			</select></td>
		</tr>
		<tr>
			<th class="row">*가격</th>
			<td><input type="text" name="f_price" value="${dto.f_price}" style="border:0 solid black;" placeholder="숫자만 입력가능" size=8 class="numberOnly" required>원</td>
		</tr>
		<tr>
			<th class="row">거래 지역 설정</th>
			<td><button type="button" class="addbtn" id="addbtn" onclick="addPost()">검색</button>
				<input id="address" name="f_addr" value="${dto.f_addr}" size=40 style="border:0 solid black;"></td>
		</tr>
		<tr>
			<th class="row">내용</th>
			<td><textarea name="f_content" cols="95" rows="10" class="content">${dto.f_content}</textarea>
			<img id='output' width="150px" height="auto"></td>
		</tr>
		<tr>
			<th class="row">이미지 올리기</th>
			<td><label class="imgbtn" for="imgfile">이미지 업로드</label>
			<input type="file" id="imgfile" accept='image/*' onchange='openFile(event)' name="f_img" value="${dto2.imgpath}" style="display:none" multiple>
			<input type="hidden" name="imgid" value="${dto.imgid}"></td>
		</tr>
		<tr>
			<td colspan="2" align="right" class="td02">
				<input type="submit" class="btn02" value="완료"> 
			    <input type="button" class="btn02" id="btn" value="취소" />
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
<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>
