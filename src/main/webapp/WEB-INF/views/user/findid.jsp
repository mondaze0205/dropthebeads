<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/mypage.css"> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
<form method="post" action="findidaction" name="findidform">
<div><input type="text" id="nickname" name="nickname" required/><label for="nickname">별명</label></div>			
<div><input type="text" id="email" name="email" required/> <label for="email">email</label></div>
<div><input type="submit" value="찾기"></div>
</form>



</body>
</html>