<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
"${dto.nickname }" 의 검색 결과입니다.
<c:if test ="${size ==0 }">
	<label>일치하는 정보가 존재하지 않습니다.</label>
</c:if>
<c:if test ="${size !=0 }">
<label>
	<c:forEach items="${ulist}" var ="order">
	찾으시는 아이디는 ${order.userid } 입니다.
	</c:forEach> 
</label>	
</c:if>
	<button onclick = "history.go(-1)">검색 화면으로 돌아가기</button>
	<button onclick = "window.close();">창닫기</button>
</body>
</html>
