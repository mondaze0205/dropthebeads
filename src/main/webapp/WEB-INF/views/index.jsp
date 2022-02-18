<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>

<!-- 컨테이너 -->
<div class="container-xxl">
	<!-- 그림판 예시 누르면 그림판 이동 -->
	<h3>그림판</h3>
	
	<hr>
	<!-- 게시판 인기글 -->
	<h3>게시판 인기글</h3>
	  <div class="row row-cols-3">
		<c:forEach items="${bbdto}" var="bb">
			<div class="card">
				<div class="canvas">
					<!-- 그림가져오기 -->
				그림
				</div>  
				<div class="card-body">
			    <h5 class="card-title"> ${bb.title} 
			    	<span class="badge rounded-pill bg-danger">조회수 ${bb.readcount }</span></h5>
			    
			    <p class="card-text"> ${bb.postcon} </p>
				</div>
			</div>
		</c:forEach>
	  </div>
	
	<hr>
	<!-- 벼룩 급매품 -->
	<h3>벼룩 급매</h3>
	<div class="fleabest">
		
	</div>
	
</div>
<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html> 