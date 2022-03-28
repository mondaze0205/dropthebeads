<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그림판</title>
<style>
.container {
	display: grid;
	justify-items: center;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<c:choose>
	<c:when test="{$n != ''}">
		<h1>저장이 완료되었습니다. - ${n}</h1>
		<input type="hidden" id="hidden" value="0">
	</c:when>
	<c:otherwise>
		<h1>올바르지 않은 접근입니다.</h1>
		<input type="hidden" id="hidden" value="1">
	</c:otherwise>
	</c:choose>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
<script>
if (document.getElementById("hidden").value == "1") {
	setTimeout(function(){history.back()}, 2000);	
}
</script>
</body>
</html>