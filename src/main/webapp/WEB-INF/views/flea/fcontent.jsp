<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벼룩시장 글 상세보기</title>
<link rel="stylesheet" type="text/css" href="/css/flea/flea.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&family=Roboto:wght@300&display=swap" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75a521ee3f22167093ecd39350fa50b1&libraries=services"></script>
<script src="https://kit.fontawesome.com/2e7159d3c5.js" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="/js/flea/flea.js"></script>

</head>
<body>
<h2 class="mb-1">${dto.f_title}</h2>
<h6 class="mb-4">NO.${dto.f_postno}&nbsp;&nbsp;|&nbsp;&nbsp;${dto.f_date}&nbsp;&nbsp;|&nbsp;&nbsp;조회 ${dto.f_viewcount}</h6>
<form>
<table class="type02">

		<tr>
			<th class="row">제목</th>
			<td>${dto.f_title}</td>
		</tr>
		<tr>
			<th class="row">아이디</th>
			<td>${dto.userid}</td>
		</tr>
		<tr>
			<th class="row">카테고리</th>
			<td>${dto.f_category}</td>
		</tr>
		<tr>
			<th class="row">가격</th>
			<td>${dto.f_price}</td>
		</tr>
		<tr>
			<th class="row">거래 지역 설정</th>
			<td>${dto.f_addr}</td>
		</tr>
		<tr>
         <th class="row">지도</th>
         <td>
            <div id="map1" style="width:460px;height:200px;"></div>
            <input type="hidden" id="addr" value="${fleaMap}"/>
         </td>
      </tr>
		<tr>
			<td class="t" colspan="2"><b>내용</b><br>
			<pre>${dto.f_content}</pre><br>
 		<img src="/upload/${dto2.imgpath}" onerror="this.style.display='none'" width="300px" height="auto" /></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
			<c:if test="${dto.userid == user.userid}">
			<a href="/flea/fupdate/${dto.f_postno}">글 수정 /</a>
			<a id="${dto.f_postno}" href="#">글 삭제 /</a>
			</c:if>
			<a href="../flist">목록 이동</a>
			</td>
		</tr>
	</table>
</form>

<!-- 여기서부터 댓글 -->
<h3 class="mb-1">${commCnt} COMMENTS</h3>

<div class="comm-01">
   <div>
      <span id="commCnt"></span>
   </div>
   <div class="comm-02">
      <textarea name="comment" id ="comment" cols="86" rows="5" placeholder="내용을 입력하세요."></textarea><br>
      <button class="commbtn" style="float: right;" id="add">댓글등록</button>
   </div>
   <div>
      <c:forEach items = "${cList}" var="comm" varStatus="s">
      <div class="comm-03">
      	<span>아이디 : ${dto.userid}  /</span>  <fmt:formatDate value ="${comm.f_cdate}" dateStyle="short"/>
      </div>
         
         <div class="comm-02"> 
            <textarea name="up" id="${s.index}" value="${comm.f_comment}" cols="86" rows="2" style="overflow: hidden; border:0 solid black;">${comm.f_comment}</textarea>
      
            <div>
               <%-- <input name = "up" id = "${s.index}" value="${comm.f_comment}" style="width : 400px;"> --%>
               <button class="upbtn" name="${s.index}" id="${comm.f_cno}">수정</button>
               <button class="delbtn" id="${comm.f_cno}">삭제</button>

               <c:choose>
                  <c:when test="${comm.f_like < 0}">
                     <button class="likebtn" id="${comm.f_cno}" value =-1> ♡  ${comm.f_like} </button>
                  </c:when>
                  
                  <c:when test="${comm.f_like eq 0}">
                     <button class="likebtn" id="${comm.f_cno}" value ="${comm.f_like}"> ♡  ${comm.f_like} </button>
                  </c:when>
                  
                  <c:when test="${comm.f_like eq 1}">
                     <button class="likebtn" id="${comm.f_cno}" value ="${comm.f_like}"> ♥  ${comm.f_like} </button>
                  </c:when>
                  
                  <c:when test="${comm.f_like > 1}">
                     <button class="likebtn" id="${comm.f_cno}" value ="${comm.f_like}"> ♥  ${comm.f_like} </button>
                  </c:when>
               </c:choose>
            </div>
         </div>
       </c:forEach>
   </div>    
   </div>
   <div>
   	<input type="hidden" id="h_userid" value="${users.userid}">
   	<input type="hidden" id="h_f_postno" value="${dto.f_postno}">
   </div>
</body>
</html>