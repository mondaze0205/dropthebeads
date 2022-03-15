<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/user/findidresult.css"> 
</head>
<body>
<div class="center">
<h1 >아이디 찾기 </h1>
<div>
<p>"${dto.nickname }" 님의 검색 결과입니다.</p>
</div>
<c:if test ="${size ==0 }" >
	<label>일치하는 정보가 존재하지 않습니다.</label>
</c:if>
<c:if test ="${size !=0 }">

 <label>
	<c:forEach items="${ulist}" var ="order">
	찾으시는 아이디는 ${order.userid } 입니다.
	</c:forEach> 
</label>
</c:if>
<div class="inputbox">
<input type="button" onclick ="location.href='/findid'"  value="아이디 찾기" >
</div>	
	
<div class="inputbox"><input type="button" onclick = "location.href='/findpw'" value="비밀번호 찾기"></div>
</div>	

</body>
</html>
