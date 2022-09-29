<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../css/main.css">


<div class="bigAll">
   <div class="centerPlz">
      <div class="detailTitle">
         <div>
            <h2>
            <c:choose>
               <c:when test="${dto.a_type eq 0}">공지사항</c:when>
               <c:when test="${dto.a_type eq 1}">이벤트</c:when>
               <c:when test="${dto.a_type eq 2}">자주하는질문</c:when>
            </c:choose>
            </h2>
         </div>
      </div>
      
      <div class="detailTop">
         <div class="deParent">
            <div class="detailList">제목</div>
            <div class="titleWriter">${dto.a_title }</div>
         </div>
         <div class="deParent">
            <div class="detailList">작성자</div>
            <div class="titleWriter">관리자</div>
         </div>
         <div class="deParent">
            <div class="detailList">작성일</div>
            <div class="titleWriter">${dto.a_date }</div>
         </div>
         <div class="deParent">
            <div class="detailList">조회수</div>
            <div class="titleWriter">${dto.a_cnt }</div>
         </div>
         <div class="neyong">
            <c:if test="${dto.img }">
               <img alt="" src="../image/img_Board/${dto.a_file }"/>
            </c:if>
            <div>${dto.a_contentBr }</div>
         </div><p/>
      </div>
        <!-- 08-16 -->
      <div class="detailBtn">
         <div><a href="BoardList?type=${dto.a_type }&page=${param.page}"><input type="button" value="목록"/></a></div>
         <%if(session.getAttribute("state") != null && (Integer)session.getAttribute("state") == 9) {%>
         <div><a href="BoardModifyForm?type=${dto.a_type }&page=${param.page}&a_index=${dto.a_index }"><input type="button" value="수정"/></a></div>
         <div><a href="BoardDeleteReg?type=${dto.a_type }&a_index=${dto.a_index }"><input type="button" value="삭제"/></a></div>
         <%} %>
      </div>
   </div>
</div>