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
<link rel="stylesheet" type="text/css" href="/css/index.css">
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
	<h3>직접 그려서 만들고 자랑해봐요!</h3>
	<div class="main1">
 		<a href="/painter/painter"><img class="mainimage" src="/image/apple.png"></a>
	  	<a href="/painter/painter"><img class="mainimage" src="/image/rabbit.png"></a>
	  	
	</div>
	
	<div class="clear"></div>
	
	<!-- 게시판 인기글 -->
	<h3>게시판 인기글</h3>
	  <div class="row row-cols-3 m-1">
	  <!-- 1번 -->
	  	<div class="boardc1">
			<div class="card">
				<div class="canvas m-3">
					<a href="/board/content/${bb1.postid}">
					<input type="hidden" id="pictureid1" value="${bb1.pictureid}">
					<textarea style="display:none" id="code1" class="hidden"></textarea>
					<table id="pixel-canvas1"></table>
				</a>
				
				</div>  
				<div class="card-body">
			    <h5 class="card-title"> ${bb1.title} 
			    	<span class="badge rounded-pill bg-danger">조회수 ${bb1.readcount}</span></h5>
			    	<span>${bb1.userid }</span>
			    <p class="card-text"> ${bb1.postcon} </p>
				</div>
			</div>
		</div>
	  <!-- 2번 -->
	  	  <div class="boardc2">
			<div class="card">
				<div class="canvas m-3">
				<a href="/board/content/${bb2.postid}">
					<input type="hidden" id="pictureid2" value="${bb2.pictureid}">
					<textarea style="display:none" id="code2" class="hidden"></textarea>
					<table id="pixel-canvas2"></table>
				</a>
				
				</div>  
				<div class="card-body">
			    <h5 class="card-title"> ${bb2.title} 
			    	<span class="badge rounded-pill bg-danger">조회수 ${bb2.readcount}</span></h5>
			    	<span>${bb2.userid }</span>
			    <p class="card-text"> ${bb2.postcon} </p>
				</div>
			</div>
		</div>
	  <!-- 3번 -->
	  	<div class="boardc3">
			<div class="card">
				<div class="canvas m-3">
				<!-- 그림가져오기 -->
				<a href="/board/content/${bb3.postid}">
					<input type="hidden" id="pictureid3" value="${bb3.pictureid}">
					<textarea style="display:none" id="code3" class="hidden"></textarea>
					<table id="pixel-canvas3"></table>
				</a>
				
				</div>  
				<div class="card-body">
			    <h5 class="card-title"> ${bb3.title} 
			    	<span class="badge rounded-pill bg-danger">조회수 ${bb3.readcount}</span></h5>
			    	<span>${bb3.userid }</span>
			    <p class="card-text"> ${bb3.postcon} </p>
				</div>
			</div>
		</div>
	  </div>
	
	<!-- 벼룩 최신글 -->
	<h3>벼룩 시장</h3>
		<div class="row row-cols-3 m-1">
		<!-- 1번 -->
		<div class="boardf1">
			<div class="card">
				<div class="canvas m-3">
				<!-- 그림가져오기 -->
				<a id="fpicadd1" href="/flea/fcontent/${ff1.f_postno}">
				<input type="hidden" id="fpic1" value="${fi1.imgpath}">
				</a>
				
				</div>  
				<div class="card-body">
			    <h5 class="card-title"> [${ff1.f_category}] ${ff1.f_title} 
			    	<span class="badge rounded-pill bg-danger">조회수 ${ff1.f_viewcount}</span></h5>
			    	<input type="hidden" id="boardf1" value="${ff1.userid}">
			    	<p>${ff1.userid}</p>
			    <p class="card-text"> ${ff1.f_content} </p>
				</div>
			</div>
		</div>
		<!-- 2번 -->
		<div class="boardf2">
			<div class="card">
				<div class="canvas m-3">
				<!-- 그림가져오기 -->
				<a id="fpicadd2" href="/flea/fcontent/${ff2.f_postno}">
				<input type="hidden" id="fpic2" value="${fi2.imgpath}">
				</a>
				
				</div>  
				<div class="card-body">
			    <h5 class="card-title"> [${ff2.f_category}] ${ff2.f_title} 
			    	<span class="badge rounded-pill bg-danger">조회수 ${ff2.f_viewcount}</span></h5>
			    	<input type="hidden" id="boardf2" value="${ff2.userid}">
			    	<p>${ff2.userid}</p>
			    <p class="card-text"> ${ff2.f_content} </p>
				</div>
			</div>
		</div>
		<!-- 3번 -->
		<div class="boardf3">
			<div class="card">
				<div class="canvas m-3">
				<!-- 그림가져오기 -->
				<a id="fpicadd3" href="/flea/fcontent/${ff3.f_postno}">
				<input type="hidden" id="fpic3" value="${fi3.imgpath}">
				</a>
				
				</div>  
				<div class="card-body">
			    <h5 class="card-title"> [${ff3.f_category}] ${ff3.f_title} 
			    	<span class="badge rounded-pill bg-danger">조회수 ${ff3.f_viewcount}</span></h5>
			    	<input type="hidden" id="boardf3" value="${ff3.userid}">
			    	<p>${ff3.userid}</p>
			    <p class="card-text"> ${ff3.f_content} </p>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- footer -->
<jsp:include page="footer.jsp"></jsp:include>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/index.js"></script>


</body>
</html> 