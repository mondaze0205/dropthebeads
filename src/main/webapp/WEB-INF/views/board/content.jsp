<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 테스트 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/board/content.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div>
	<input type="hidden" id="post_userid" value="${dto.userid}">
	<input type="hidden" id="postid" value="${dto.postid}">
</div>
<div class="container">
	<div class="side_top">
		<div><p>자유게시판 / ${dto.postid}</p></div>
		<div class="makespace"></div>
		<div>
			<form action="../updateform" method="post">
				<input type="hidden" name="postid" value="${dto.postid}">
				<button type="submit" id="editbtn">수정</button>
			</form>
		</div>
		<div>
			<form action="../delete" method="post">
				<input type="hidden" name="postid" value="${dto.postid}">
				<button type="submit" id="delbtn">삭제</button>
			</form>
		</div>
	</div>
	<div class="side_left">
	</div>
	<div class="side_right">
	</div>
	<div class="center">
		<div class="title">
			<p>[${dto.head}] ${dto.title}</p>
		</div>
		<div class="user">
			<div><h4>${dto.nickname}</h4></div>
			<div><h5><fmt:formatDate value="${dto.postdate}" pattern="yy.MM.dd HH:mm:ss"/></h5></div>
			<div class="makespace"></div> 
			<div><h5>조회 ${dto.readcount} 추천 ${dto.rec} 댓글 ${countReply}</h5></div>
		</div>
		<div class="canvas">
			<input type="hidden" id="pictureid" value="${dto.pictureid}">
			<textarea id="code" class="hidden"></textarea>
			<table class="pixel-canvas"></table>
		</div>
		<div class="content">
			<textarea class="content_text" readonly>${dto.postcon}</textarea>
		</div>
		<div class="reply">
			<div class="replytop">
				<div><h5>댓글</h5></div>
				<div><h6 id="countReply">총 ${countReply}개</h6></div>
				<div class="makespace"></div>
				<div><h6 id="replyRefresh">새로고침</h6></div>
			</div>
			<div class="rs">
			<c:forEach items="${rlist}" var="r" varStatus="status">
				<div class="r">
					<div class="r_id">
						<h5>${r.nickname}</h5>
						<input type="hidden" id="uid_${status.index}" value="${r.userid}">
						<input type="hidden" id="rid_${status.index}" value="${r.replyid}">
					</div>
					<div class="repcon"><p>${r.repcon}</p></div>
					<div class="makespace"></div>
					<div class="r_report" id="report_${status.index}"><h6>신고</h6></div>
					<div class="r_del" id="del_${status.index}"><h6>삭제</h6></div>
					<div class="r_date">
						<h6><fmt:formatDate value="${r.replydate}" pattern="yy.MM.dd HH:mm:ss"/></h6>
					</div>					
				</div>
			</c:forEach>
			</div>
		</div>
		<div class="writereply">
			<div class="writereply_1">
				<form class="replyzone" name="replyzone">
					<textarea placeholder="댓글을 작성해주세요." name="repcon" id="repcon"></textarea>
					<input type="hidden" name="userid" value="${user.userid}">
					<input type="hidden" name="nickname" value="${user.nickname}">
					<input type="hidden" name="postid" value="${dto.postid}">
				</form>
			</div>
			<div class="writereply_2">
				<p>※ 운영 정책을 위반하는 댓글은 무통보 삭제될 수 있습니다.</p>
				<div class="makespace"></div>
				<button type="button" id="submit">댓글 남기기</button>
				<button type="button" id="recommend">추천 남기기</button>
				<button type="button" id="withrec">댓글 + 추천</button>
				<button type="button" id="report">신고하기</button>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
<script src="/js/board/content.js"></script>
</html>