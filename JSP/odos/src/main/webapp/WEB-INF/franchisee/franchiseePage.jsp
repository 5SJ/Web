<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = session.getAttribute("id")+"";
%>  
<style>
	.banner {
		width: 1050px;
		height: 60px;
		margin: 0 auto;
	}

	.banner ul{
		text-align: center;
		padding-inline-start: 0px;
	}
	.banner li{
		display:inline-block;
		width: 130px;
		border: 1px solid #88001b;
		border-radius: 5px; 
		margin: 5px;
	}
	.banner a{
		text-decoration: none;
		color: #88001b;
	}
	
	@media screen and (max-width: 500px) {
   		.franPage{
  		width: 100%;
  		}
  		.banner{
  		width: 100%;
  		}
  		.banner li{
  		width: 20%;
  		}
   }
</style>

<div class="franPage">
<div align="center"><h1>가맹점페이지입니다.</h1></div>
<div class="wrapper1">
	
		<div class="userInfo" align="center">
			<div>
				<div class="userName"><strong>환영합니다. <%=id %> 님</strong></div>
			</div>
		</div>
	</div>
	
	<div class="wrapper2">
		<div class="banner">
			<div>
				<p></p>
			</div>
			
			<ul>
				<li>
					<a href="PwChk">정보수정</a>
				</li>
				<li>
					<a href="FranchiseeOrderList">주문내역</a>
				</li>
				<li>
					<a href="FranchiseeSales">정산내역</a>
				</li>
			</ul>
			
		</div>
		
		<div class="bannerDetail" id="bannerDetail">
			<jsp:include page="${myPageUrl }"/>
		</div>
	</div>
</div>
