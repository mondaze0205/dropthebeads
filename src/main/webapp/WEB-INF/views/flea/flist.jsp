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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<!-- <div id="mainWrapper"><a href="address">main</a><a href="fwrite">새글 등록</a><a href="test2">testtest</a> -->
<a href="http://localhost:8087/" class="button3">MAIN</a>   <a href="fwrite" class="button3">WRITE</a>   
<a href="flist" class="button3" id="c1">전체글</a>   <a href="http://localhost:8087/flea/flist?c=2" class="button3" id="c2">판매</a>   <a href="http://localhost:8087/flea/flist?c=3" class="button3" id="c3">구매</a>

<h2 class="mb-2">FLEA MARKET [${count}]</h2>
<c:if test="${count != 0 }">
<table class="type01">
  <thead>
  <tr>
    <th scope="col" width="100">NO</th>
    <th scope="col" width="100">CATEGORY</th>
    <th scope="col" width="400">TITLE</th>
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
				<small style="color:#44426e;"><b>[&nbsp;<c:out value="${fboard.commcnt}"/>&nbsp;]</b></small>
			</c:if></a></td>
		<td>${fboard.userid }</td>
		<td><fmt:formatDate value="${fboard.f_date}" dateStyle="short"/></td>
		<td>${fboard.f_viewcount}</td>
	  </tr>
	</tbody>
	</c:forEach>
</table>
<a href="http://localhost:8087/flea/fleamap" class="button3">지도</a>
<!-- 페이징 영역 -->
<div class="pagination">
	<c:if test="${begin > pageNum}">
		<a href="flist?p=${begin-1}">[이전]</a>
	</c:if>
	<c:forEach begin="${begin}" end="${end}" var="i">
		<a href="flist?p=${i}">${i}</a>
	</c:forEach>
	<c:if test="${end < totalPages}">
		<a href="flist?p=${end+1}">[다음]</a>
	</c:if>
</div>
</c:if>
<c:if test="${count == 0 }">
	아직 입력한 글이 없습니다. 
</c:if>
<div id="search" align="center">
<form action="fsearch">
<select name="searchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">작성자</option>
</select>
<input type="text" name="search" size="15" maxlength="50"/>
<input type="submit" value="검색"/>
</form>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
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
</div>
</body>
</html>