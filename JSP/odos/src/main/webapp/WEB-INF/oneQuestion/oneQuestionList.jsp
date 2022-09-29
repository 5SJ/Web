<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">


<div class="bigAll">
	<div class="centerPlz">
		<div class="detailTitle">
			<div><h2>1대1 문의</h2></div>
		</div>
		<%if((int)session.getAttribute("state") == 9) {%>
		<div>
		<form action="OneQuestionListFilterReg?">
			<input type="hidden" name="page" value="${param.page }" />
			<select id="state" name="u_type" onchange="submit()">
				<c:forEach items="${udto.u_typeMap }" var="type">
				<option value="${type.key }" <c:if test="${type.key == param.u_type }">selected</c:if> >${type.value }</option>
				</c:forEach>
			</select>
		</form>
		</div>
		<%} %>
		<div class="listParent">
			<div class="titleNo">번호</div>
			<div class="inquTitle">제목</div>
			<div class="inquiry_type">유형</div>
			<div class="title">작성일</div>
			<div class="answer_state">답변 상태</div>
		</div>
		<c:forEach items="${list }" var="dto" begin="${param.page*10-10 }" end="${param.page*10-1 }">
			<div class="titleList">
				<div class="titleNo">${dto.u_index}</div>
				<div class="inquTitle"><a href="OneQuestionDetail?u_index=${dto.u_index}&u_id=<%=session.getAttribute("id") %>&page=${param.page}">${dto.u_title}</a></div>
				<div class="inquiry_type">${dto.u_typeStr }</div>
				<div class="title"><fmt:formatDate value="${dto.u_date }" pattern="yyyy-MM-dd"/></div>
				<c:choose>
					<c:when test="${dto.u_state == 0 }"><div class="answer_state">미열람</div></c:when>
					<c:when test="${dto.u_state == 1 }"><div class="answer_state">확인중</div></c:when>
					<c:when test="${dto.u_state == 2 }"><div class="answer_state">답변완료</div></c:when>
				</c:choose>
			</div>
		</c:forEach>
		<div class="pageN">
			<c:forEach var="i" begin="1" end="${list.size()/10+1 }">
				<a href="OneQuestionList?page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
			</c:forEach>
		</div>
		<%if((int)session.getAttribute("state") == 1 || (int)session.getAttribute("state") == 2 || (int)session.getAttribute("state") == 4) {%>
		<div class="writeMe"><a class="write" href="OneQuestionInsertForm?page=${param.page }">글쓰기</a></div>
		<%} %>    
	</div>
</div>