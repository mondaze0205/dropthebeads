<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ㅎㅇㅎㅇ</h1>
<h2>${user.userid}</h2>
<hr>

		<c:choose>
			<c:when test="${blist == 'none'}">
				<div class="none">
					<p>신고된 게시물이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${blist}" var="b" varStatus="bs">
					<div class="report_con">
						<div class="repcon">${b.title}</div>
						<div class="id">${b.postcon}</div>
						<div class="stack">${b.pictureid}</div>
						<div class="makespace"></div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>

</body>
</html>