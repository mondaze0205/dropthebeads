<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<title>글 상세</title>
</head>
<body>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<table>
	<tr>
		<td>번호</td><td>${dto.postid}</td>
		<td>작성자</td><td>${dto.userid}</td>
		<td>등록일</td><td><fmt:formatDate value="${dto.postdate }" dateStyle="long"/></td>
		<td>조회수</td><td>${dto.readcount}</td>
	</tr>
	<tr><td id="title">제목</td><td>${dto.title}</td></tr>
	<tr><td>내용</td><td>${dto.postcon}</td></tr>
	
	<tr>
		<td colspan="2" align="right">
	
		<c:if test="${ user.id == dto.userid }">
			<a href="/board/update/${dto.postid}">글 수정 </a> 
			<a id="${dto.postid}" href="/board/delete/${dto.postid}">글 삭제</a>
		</c:if>
		<a href="/list">목록 이동</a> 
		</td>
	</tr>
	
</table>


<div>
	<c:forEach items="${rList}" var="reply">
		<div>${reply.replyid} / <fmt:formatDate value="${reply.replydate }" dateStyle="short"/></div>
		<div>${reply.repcon} 
		<c:if test="${reply.userid == user.id }">
		<button class="dbtn" id="${reply.replyid}">삭제</button>
		</c:if>
		</div>
		<hr>
	</c:forEach>
	<input name="content" id="content"><button id="add">등록</button>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("a[id]").click(function(){
			let no = $(this).attr("id");
			$.ajax({url:"/board/delete", data:"no="+no, method:"delete"}
			).done(function(){
				location.href="/board/list";
			})
			return false;
		})//click
		
		$("#add").click(function(){
			let userid = '${user.id}';
			let repcon = $("#content").val();
			let replyid = ${dto.replyid};
			
			$.ajax({url:"/reply/insert",
					data:"replyid="+replyid+"&userid="+userid+"&repcon="+repcon,
					method:"get"
			}).done(function(){
					location.reload();		
				});
			
		})//click
		
		$(".dbtn").click(function(){
			let replyid = $(this).attr("id");
			$.ajax({url:"/reply/delete/"+replyid,
				method:"get"
		}).done(function(){
				location.reload();		
			});
			
		})//click
		
	})//ready

</script>

</body>
</html>