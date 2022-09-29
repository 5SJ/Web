<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
System.out.println("현재 로그인 아이디 : " + session.getAttribute("id"));
System.out.println("권한 : " + session.getAttribute("state"));
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=320, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script type="text/javascript"
   src="../bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
$(function(){
   $("#notice").hover(
      function(){
         $("#noticeMenu").css({
            display: "block"
         })
      },
      function(){
         $("#noticeMenu").css({
            display: "none"
         })
      }
   )
   
   $("#category").hover(
      function(){
         $(".menu").css({
            maxWidth: "500px",
           	padding: "10px",
           	minHeight: "100%",
           	margin: "0px -10px"
         })
      },
      function(){
         $(".menu").css({
            maxWidth: "0px",
            padding: "0"
         })
      }
   )
})
</script>

</head>
<div>
   <div id="top">
      <div id="f-head">
         <div class="main_logo">
            <a href="../main/MainPage" class="main_link"> <img
               src="../image/img_Main/main_logo.jpg">
            </a>
         </div>
         <div id="serch">
            <div id="inlineSch">
               <form action="../main/ProdSearch">
                  <div id="inputSch">
                     <input type="text" name="where">
                  </div>
                  <div id="subdiv">
                     <input type="submit" value="" class="submitSch">
                  </div>
               </form>
            </div>
         </div>

         <div class="threeTag">
            <%
            if (session.getAttribute("id") == null) {
            %>
            <div class="topLineInfo">
               <a href="MemberJoinForm" id="signup">회원가입</a>
            </div>
            <div class="top_Tag">|</div>
            <div class="topLineInfo">
               <a href="Login">로그인</a>
            </div>
            <%
            } else {
            %>
            <%
            if ((session.getAttribute("state") != null && (int) session.getAttribute("state") == 1) || (session.getAttribute("state") != null && (int) session.getAttribute("state") == 4)) {
            %>
            <div class="topLineInfo">
               <a href="../main/Cart">장바구니</a>
            </div>
            <div class="top_Tag">|</div>
            <div class="topLineInfo">
               <a href="<c:url value='/myPage/OrderList?page=1'/>">마이페이지</a>
            </div>
            <%
            } else if (session.getAttribute("state") != null && (int) session.getAttribute("state") == 2) {
            %>
            <div class="topLineInfo">
               <a href="../main/FranchiseePage">가맹점페이지</a>
            </div>
            <%
            } else {
            %>
            <div class="topLineInfo">
               <a href="../admin/CateList">관리페이지</a>
            </div>
            <%
            }
            %>
            <div class="top_Tag">|</div>
            <div class="topLineInfo">
               <a href="../main/LogoutReg">로그아웃</a>
            </div>
            <%
            }
            %>
            <div class="top_Tag">|</div>
            <div id="notice">
				<div class="topLineInfo">
					<a href="#">고객센터</a>
				</div>
				<div id="noticeMenu">
					<div>
						<a href="../main/BoardList?type=0&page=1">공지사항</a>
					</div>
					<div>
						<a href="../main/BoardList?type=1&page=1">이벤트</a>
					</div>
					<div>
						<a href="../main/BoardList?type=2&page=1">자주하는 질문</a>
					</div>
					<div>
						<a href="../main/OneQuestionList?page=1">문의내역</a>
					</div>
               </div>
            </div>
         </div>

      </div>
      <div id="s-head">
         <div id="menubar">
            <ul>
               <li id="category">≡ 카테고리
                  <div class="menu">               
					<div><a href="../main/ProdList?cate=new">신상품</a></div>
					<div><a href="../main/ProdList?cate=md">MD's Pick</a></div>
					<c:forEach items="${category}" var="dto">
						<c:if test="${dto.c_name != 'md' && dto.c_name != 'new' }">
						<div><a href="../main/ProdList?cate=${dto.c_name }">${dto.c_name }</a></div>
						</c:if>
					</c:forEach>
					</div>
               </li>
            </ul>
            <ul class="menuBarProduct">
               <li><a href="../main/ProdList?cate=new">신상품</a></li>
               <li><a href="../main/ProdList?cate=md">MD's Pick</a></li>
               <li><a href="../main/BoardList?type=1&page=1">이벤트</a></li>
            </ul>
         </div>
      </div>
   </div>
</div>
</html>