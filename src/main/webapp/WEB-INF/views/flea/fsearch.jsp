<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>검색 글 목록</title>
<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Press+Start+2P&family=Raleway:wght@300&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
<!-- 아이콘  -->
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>
</head>

<body>

<!-- 헤더 -->
<jsp:include page="../header.jsp"></jsp:include>
<hr color="#00af79" size="2px">

<div class="title_flea">
	<h2 class="mb-1">[${search}]로 검색한 결과입니다.</h2>
	<hr class="dots">
</div>


<c:if test="${count != 0 }">
<table class="type01">
  <thead>
  <tr>
    <th scope="col">NO</th>
    <th scope="col">CATEGORY</th>
    <th scope="col">SUBJECT</th>
    <th scope="col">ID</th>
    <th scope="col">DATE</th>
    <th scope="col">VIEW</th>
  </tr>
  </thead>
	   
	<c:forEach items="${bList}" var="fboard">
	<tbody>
	  <tr class="b">
	  	<th scope="row">${fboard.f_postno }</th>
		<td>${fboard.f_category }</td>
		<td><a href="fcontent/${fboard.f_postno}">${fboard.f_title}
			<c:if test="${fboard.commcnt ne 0}">
				<small style="color:#f05542;"><b>[&nbsp;<c:out value="${fboard.commcnt}"/>&nbsp;]</b></small>
			</c:if></a></td>
		<td>${fboard.userid}</td>
		<td><fmt:formatDate value="${fboard.f_date}" dateStyle="short"/></td>
		<td>${fboard.f_viewcount}</td>
	  </tr>
	</tbody>
	</c:forEach>
</table>
			<div class="pagination">
				<c:if test="${begin > pageNum }">
					<a href="fsearch?p=${begin-1}&search=${search}&searchn=${searchn}">[이전]</a>
				</c:if>
				<c:forEach begin="${begin }" end="${end}" var="i">
					<a href="fsearch?p=${i}&search=${search}&searchn=${searchn}">${i}</a>
				</c:forEach>
				<c:if test="${end < totalPages }">
					<a href="fsearch?p=${end+1}&search=${search}&searchn=${searchn}">[다음]</a>
				</c:if>
			</div>

		</c:if>
		<c:if test="${count == 0 }">
	<h4 class="mb-1">검색 조건에 맞는 글이 없습니다.<br>다시 검색하세요 <i class="fa-regular fa-face-grin-beam-sweat"></i></h4>
</c:if>
<div id="search" align="center" class="fsearch">
<form action="fsearch">
<select name="searchn" class="select01">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">아이디</option>
</select>
<input type="text" class="searchbox" name="search" placeholder="검색어를 입력해주세요" maxlength="50" /> 
<input type="submit" class="btn02" value="SEARCH" />
</form>	
	</div>
<!-- footer -->
<jsp:include page="../footer.jsp"></jsp:include>	
</body>
</html>