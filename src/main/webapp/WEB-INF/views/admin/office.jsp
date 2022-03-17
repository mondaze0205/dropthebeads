<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/admin/office.css">
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
<div class="side_left"></div>

<div class="center">
	<div class="users">
		<h1 id="users">회원 목록 보기</h1>
	</div>
	<div class="report_items">
		<div class="report_type">
			<h1>신고 기록 - 커뮤니티</h1>
		</div>
		<c:choose>
			<c:when test="${r_board == 'none'}">
				<div class="none">
					<p>신고된 게시물이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="report_top">
					<div class="title">제목</div>
					<div class="id">작성자</div>
					<div class="stack">신고</div>
					<div class="reporter">신고자</div>
					<div class="judge">처리</div>
				</div>
				<c:forEach items="${r_board}" var="b" varStatus="bs">
					<div class="report_con">
						<div class="title"><a href="/board/content/${b.POSTID}" target="_blank">${b.TITLE}</a></div>
						<div class="id"><a id="${b.REPORTID}_reported">${b.USERID}</a></div>
						<div class="stack"><p id="${b.REPORTID}_stack">${b.STACK}</p></div>
						<div class="reporter"><p class="reporters">${b.REPORTERS}</p></div>
						<div class="judge">
							<select class="j" id="j_${b.REPORTID}">
								<option value="j1">아무 조치 안함</option>
								<option value="j2">글 삭제</option>
								<option value="j3">글 삭제 + 경고</option>
								<option value="j4">글 삭제 + 강퇴</option>
							</select>
							<button type="button" class="done" id="${b.REPORTID}_board_${b.POSTID}">처리</button>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="report_items">
		<div class="report_type">
			<h1>신고 기록 - 벼룩시장</h1>
		</div>
		<c:choose>
			<c:when test="${r_fboard == 'none'}">
				<div class="none">
					<p>신고된 게시물이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="report_top">
					<div class="title">제목</div>
					<div class="id">작성자</div>
					<div class="stack">신고</div>
					<div class="reporter">신고자</div>
					<div class="judge">처리</div>
				</div>
				<c:forEach items="${r_fboard}" var="f" varStatus="fs">
					<div class="report_con">
						<div class="title"><a href="/flea/fcontent/${f.F_POSTNO}" target="_blank">${f.F_TITLE}</a></div>
						<div class="id"><a id="${f.REPORTID}_reported">${f.USERID}</a></div>
						<div class="stack"><p id="${f.REPORTID}_stack">${f.STACK}</p></div>
						<div class="reporter"><p class="reporters">${f.REPORTERS}</p></div>
						<div class="judge">
							<select class="j" id="j_${f.REPORTID}">
								<option value="j1">아무 조치 안함</option>
								<option value="j2">글 삭제</option>
								<option value="j3">글 삭제 + 경고</option>
								<option value="j4">글 삭제 + 강퇴</option>
							</select>
							<button type="button" class="done" id="${f.REPORTID}_fboard_${f.F_POSTNO}">처리</button>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="report_items">
		<div class="report_type">
			<h1>신고 기록 - 그림판</h1>
		</div>
		<c:choose>
			<c:when test="${r_pic == 'none'}">
				<div class="none">
					<p>신고된 게시물이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="report_top">
					<div class="title">내용</div>
					<div class="id">작성자</div>
					<div class="stack">신고</div>
					<div class="reporter">신고자</div>
					<div class="judge">처리</div>
				</div>
				<c:forEach items="${r_pic}" var="p" varStatus="ps">
					<div class="report_con">
						<div class="title pic_title">
							<button type="button" class="picbtn" onclick="window.open('/painter/readonly/${p.PICTUREID}')">확인</button>
						</div>
						<div class="id"><a id="${p.REPORTID}_reported">${p.USERID}</a></div>
						<div class="stack"><p id="${p.REPORTID}_stack">${p.STACK}</p></div>
						<div class="reporter"><p class="reporters">${p.REPORTERS}</p></div>
						<div class="judge" id="j_${p.REPORTID}">
							<select class="j">
								<option value="j1">아무 조치 안함</option>
								<option value="j2">글 삭제</option>
								<option value="j3">글 삭제 + 경고</option>
								<option value="j4">글 삭제 + 강퇴</option>
							</select>
							<button type="button" class="done" id="${p.REPORTID}_picture_${p.PICTUREID}">처리</button>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="report_items">
		<div class="report_type">
			<h1>신고 기록 - 댓글</h1>
		</div>
		<c:choose>
			<c:when test="${r_reply == 'none'}">
				<div class="none">
					<p>신고된 게시물이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="report_top">
					<div class="title">내용</div>
					<div class="id">작성자</div>
					<div class="stack">신고</div>
					<div class="reporter">신고자</div>
					<div class="makespace"></div>
					<div class="judge">처리</div>
				</div>
				<c:forEach items="${r_reply}" var="r" varStatus="rs">
					<div class="report_con">
						<div class="title"><p class="repcon" id="repcon_${r.REPLYID}">${r.REPCON}</p></div>
						<div class="id"><a id="${r.REPORTID}_reported">${r.USERID}</a></div>
						<div class="stack"><p id="${r.REPORTID}_stack">${r.STACK}</p></div>
						<div class="reporter"><p class="reporters">${r.REPORTERS}</p></div>
						<div class="judge">
							<select class="j" id="j_${r.REPORTID}">
								<option value="j1">아무 조치 안함</option>
								<option value="j2">글 삭제</option>
								<option value="j3">글 삭제 + 경고</option>
								<option value="j4">글 삭제 + 강퇴</option>
							</select>
							<button type="button" class="done" id="${r.REPORTID}_reply_${r.REPLYID}">처리</button>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="report_items">
		<div class="report_type">
			<h1>신고 기록 - 당근마켓 댓글</h1>
		</div>
		<c:choose>
			<c:when test="${r_freply == 'none'}">
				<div class="none">
					<p>신고된 게시물이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="report_top">
					<div class="title">내용</div>
					<div class="id">작성자</div>
					<div class="stack">신고</div>
					<div class="reporter">신고자</div>
					<div class="makespace"></div>
					<div class="judge">처리</div>
				</div>
				<c:forEach items="${r_freply}" var="fr" varStatus="frs">
					<div class="report_con">
						<div class="title"><p class="comment" id="comment_${fr.F_POSTNO}">${fr.F_COMMENT}</p></div>
						<div class="id"><a id="${fr.REPORTID}_reported">${fr.USERID}</a></div>
						<div class="stack"><p id="${fr.REPORTID}_stack">${fr.STACK}</p></div>
						<div class="reporter"><p class="reporters">${fr.REPORTERS}</p></div>
						<div class="judge">
							<select class="j" id="j_${fr.REPORTID}">
								<option value="j1">아무 조치 안함</option>
								<option value="j2">글 삭제</option>
								<option value="j3">글 삭제 + 경고</option>
								<option value="j4">글 삭제 + 강퇴</option>
							</select>
							<button type="button" class="done" id="${fr.REPORTID}_reply_${fr.REPLYID}">처리</button>
						</div>
						<div>${frs.index}</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>	
	
</div>
	
<div class="side_right"></div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/admin/office.js"></script>
</html>