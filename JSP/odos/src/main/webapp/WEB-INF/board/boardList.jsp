<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=320, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
<div class="bigAll">
	<div class="centerPlz">
		<div class="detailTitle">
			<div>
				<h2>
					<c:choose>
						<c:when test="${type eq 0}">공지사항</c:when>
						<c:when test="${type eq 1}">이벤트</c:when>
						<c:when test="${type eq 2}">자주하는질문</c:when>
					</c:choose>
				</h2>
			</div>
		</div>
		<div class="listParent">
			<div class="title">번호</div>
			<div class="titlele">제목</div>
			<div class="title">조회수</div>
			<div class="title">작성일</div>
		</div>
		
		<c:forEach items="${mainData }" var="dto" begin="${param.page*10-10 }" end="${param.page*10-1 }">
			<div class="titleList">
				<div class="title">${dto.a_index}</div>
				<c:if test="${dto.a_fix =='Y'}">
					<div class="fixt"><a href="BoardDetail?type=${type}&page=${param.page }&a_index=${dto.a_index}">${dto.a_title}</a></div>
				</c:if>
				<c:if test="${dto.a_fix =='N' }">
					<div class="titleAlist"><a href="BoardDetail?type=${type}&page=${param.page }&a_index=${dto.a_index}">${dto.a_title}</a></div>
				</c:if>
				<div class="title">${dto.a_cnt}</div>
				<div class="title"><fmt:formatDate value="${dto.a_date }" pattern="yyyy-MM-dd"/></div>
			</div>
		</c:forEach>
		<div class="pageN">
			<c:forEach var="i" begin="1" end="${mainData.size()/10+1 }">
				<a href="BoardList?type=${param.type }&page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
			</c:forEach>
		</div>
		
		<%if(session.getAttribute("state") != null && (Integer)session.getAttribute("state") == 9) {%>
		<div class="writeMe">
			<a class="write" href="BoardInsertForm?type=${type}&page=${param.page}">글쓰기</a>
		</div>
		<%} %>
   </div>
</div>

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script type ="text/javascript" src="../bootstrap/js/bootstrap.bundle.min.js" ></script>