<%@page import="dto.User_inquiryDTO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="../css/main.css">

<div class="bigAll">
	<div class="centerPlz">
		<div class="detailTitle">
			<div><h2>1대1 상세보기</h2></div>
		</div>
		<div class="detailTop">
			<div class="deParent">
				<div class="detailList">제목</div>
				<div class="titleWriter">${dto.u_title }</div>
			</div>
			<div class="deParent">
				<div class="detailList">작성자</div>
				<div class="titleWriter"><%=session.getAttribute("id")%></div>
			</div>
			<div class="deParent">
				<div class="detailList">문의 유형</div>
				<div class="titleWriter">
					<c:choose>
						<c:when test="${dto.u_type == 0 }"><div>주문/결제/반품/교환문의</div></c:when>
						<c:when test="${dto.u_type == 1 }"><div>이벤트/적립금문의</div></c:when>
						<c:when test="${dto.u_type == 2 }"><div>상품문의</div></c:when>
						<c:when test="${dto.u_type == 3 }"><div>배송문의</div></c:when>
						<c:when test="${dto.u_type == 4 }"><div>상품 누락 문의</div></c:when>
						<c:when test="${dto.u_type == 5 }"><div>기타문의</div></c:when>
					</c:choose>
				</div>
			</div>
			<div class="deParent">
				<div class="detailList">작성일</div>
				<div class="titleWriter">${dto.u_date }</div>
			</div>

			<div class="qustion-answer">
				<div class="neyong">
					<div>
						<c:if test="${dto.u_file != null }">
							<c:choose>
								<c:when test="${dto.img }"> <!-- 이미지 업로드 경로 수정 -->
									<img src="<c:url value="/image/img_oneQue/"/>${dto.u_file }" />
								</c:when>
							</c:choose>
						</c:if>
					</div>
					<div>${dto.u_contentBr }</div>
				</div>
				<p />
				<div class="neyong">
					<div id="content">
						<%	User_inquiryDTO dto = (User_inquiryDTO)request.getAttribute("dto");
						if(dto.getU_state() == 0) {%>
				      	<div>미열람</div>
				      	<%
				      	} else if(dto.getU_state() == 1){
				      	%>
				      	<div>확인중</div>
				      	<%} else { %>
				      	<div>${dto.u_recontentBr }</div>
				      	<%} %>
					</div>
				</div>
				<p />
			</div>
		
			</div>
		<!-- 08-16 -->
		<div class="detailBtn">
			<div><a href="OneQuestionList?page=${param.page}"><input type="button" value="목록" /></a></div>
			<div><a href="OneQuestionModifyForm?u_index=${dto.u_index }&page=${param.page }"><input type="button" value="수정" /></a></div>
			<div><a href="OneQuestionDeleteReg?u_index=${dto.u_index }&page=1"><input type="button" value="삭제" /></a></div>
			<% if(session.getAttribute("state").equals(9) && dto.getU_state()!=2){ %>
				<div>
					<a href="OneQuestionAnswerForm?u_index=${dto.u_index }&page=${param.page}"><input type="button" value="답변" class="answerBtn"/></a>
				</div>
			<%}%>
		</div>
		
	</div>
</div>

