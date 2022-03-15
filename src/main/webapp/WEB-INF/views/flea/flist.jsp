<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벼룩시장 리스트</title>

<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>
</head>

<body>
<div id="wrap">

<!-- 헤더 -->
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">

<!-- 타이틀 -->
<div class="title_flea">
	<h2 class="mb-2">FLEA MARKET [${count}]</h2>
	<hr class="dots">
	<span>여기 벼룩시장 게시판에서는 비즈 중고거래를 할 수 있어요.<br>
    직접 만든 비즈 공예품이나 남은 비즈 등을 DROP THE BEADS 회원과 함께 나누세요!<br>
    내 주변의 거래 게시물을 한 번에 보시려면 지도를 클릭해주세요 <i class="fa-regular fa-face-grin-wide"></i></span>
</div>  

<!-- 탑 버튼 -->
<div class="topbtn">
	<a href="fwrite" class="btn01" id="writebtn">WRITE / 글쓰기</a>   
	<a href="flist" class="btn01" id="c1">ALL / 모든글</a>
	<a href="http://localhost:8087/flea/flist?c=2" class="btn01" id="c2">SALE / 판매 </a>
	<a href="http://localhost:8087/flea/flist?c=3" class="btn01" id="c3">PURCHASE / 구매</a>
	<a href="fleamap" class="btn01" id="fleamap">MAP / 지도</a>
</div>

<c:if test="${count != 0 }">
<table class="type01">
  <thead>
  <tr>
    <th scope="col" width="100">NO</th>
    <th scope="col" width="100">CATEGORY</th>
    <th scope="col" width="500">SUBJECT</th>
    <th scope="col" width="100">ID</th>
    <th scope="col" width="100">DATE</th>
    <th scope="col" width="100">VIEW</th>
  </tr>
  </thead>
	<c:forEach items="${fList}" var="fboard">
	<tbody>
	  <tr class="b">
	  	<th scope="row">${fboard.f_postno}</th>
		<td>${fboard.f_category }</td>
		<td><a href="fcontent/${fboard.f_postno}">${fboard.f_title} 
			<c:if test="${fboard.commcnt ne 0}">
				<small style="color:#f05542;"><b>[&nbsp;<c:out value="${fboard.commcnt}"/>&nbsp;]</b></small>
			</c:if></a></td>
		<td>${fboard.userid }</td>
		<td><fmt:formatDate value="${fboard.f_date}" dateStyle="short"/></td>
		<td>${fboard.f_viewcount}</td>
	  </tr>
	</tbody>
	</c:forEach>
</table>
<!-- 페이징 영역 -->
<div class="pagination">
	<c:if test="${begin > pageNum}">
		<a href="flist?p=${begin-1}" class="prev">PREV</a>
	</c:if>
	<c:forEach begin="${begin}" end="${end}" var="i">
		<a href="flist?p=${i}">${i}</a>
	</c:forEach>
	<c:if test="${end < totalPages}">
		<a href="flist?p=${end+1}" class="last">NEXT</a>
	</c:if>
</div>
</c:if>
<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다. 
</c:if>
<div id="search" align="center" class="fsearch">
<form action="fsearch">
<select name="searchn" class="select01">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">아이디</option>
</select>
<input type="text" class="searchbox" name="search" placeholder="검색어를 입력해주세요" maxlength="50"/>
<input type="submit" class="btn02" value="SEARCH"/>
</form>
</div>

<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>
</div>

<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$("#writebtn").click(function(){
	if(document.getElementById("login_userid").value == "") {
		alert('로그인 해주세요')
		window.location.href = "/login";
		return false;
	} else {
		window.location.href = "/flea/fwrite";
	}
})
$("#c1").click(function(){
	   var url = window.location;
	   var params = new URLSearchParams(url.search.slice(1));
	   window.location = window.location.pathname + "?" + params.toString();
	})
$("#c2").click(function(){
   var url = window.location;
   var params = new URLSearchParams(url.search.slice(1));
   params.delete('p', '2');
   params.set('c', '2');
   window.location = window.location.pathname + "?" + params.toString();
})
$("#c3").click(function(){
   var url = window.location;
   var params = new URLSearchParams(url.search.slice(1));
   params.delete('p', '3');
   params.set('c', '3');
   window.location = window.location.pathname + "?" + params.toString();

})
</script>
</body>
</html>