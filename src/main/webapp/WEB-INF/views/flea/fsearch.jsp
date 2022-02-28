<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>검색 글 목록</title>
<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&family=Roboto:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<a href="http://localhost:8087/" class="button3">MAIN</a>   <a href="fwrite" class="button3">WRITE</a>   <a href="flist" class="button3">LIST</a>
<h2 class="mb-2">${search}로 검색한 결과입니다.</h2>
<c:if test="${count != 0 }">
<table class="type01">
  <thead>
  <tr>
    <th scope="col">NO</th>
    <th scope="col">CATEGORY</th>
    <th scope="col">TITLE</th>
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
				<small style="color:#44426e;"><b>[&nbsp;<c:out value="${fboard.commcnt}"/>&nbsp;]</b></small>
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
	<h4 class="mb-1">검색 조건에 맞는 글이 없습니다.<br>다시 검색하세요 :)</h4>
</c:if>
<div id="search" align="center">
<form action="fsearch">
<select name="searchn">
<option value="0">제목</option>
<option value="1">내용</option>
<option value="2">작성자</option>
</select>
<input type="text" name="search" size="15" maxlength="50" /> 
<input type="submit" value="검색" />
</form>	
	</div>
</body>
</html>