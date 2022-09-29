<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	
	.myPageWrapper{
		position: relative;
    	/* min-width: 1050px; */
	   /*  background: fuchsia; */
	}
	
	.css-v9c59b {
	    display: flex;
	    width: 100%;
	    padding: 50px 0px;
	    margin-bottom: -20px;
	    background-color: rgb(247, 247, 247);
	    flex-direction: column;
	    -webkit-box-pack: justify;
    	justify-content: space-between;
    	/* background: gray;
    	border: 2px solid black; */ 
	}
	
	.css-i624a5 {
	    display: flex;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    width: 1050px;
	    margin: 0px auto;
	}
	
	.userInfo{
		display: flex;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    width: 1050px;
	    margin: 0px auto;
		
	}
	
	.userPoint{
		background: #FFE400;
		width : 168px;
		height: 210px;
		padding: 30px 0px 30px 30px;
		display: flex;
		margin-left: 4px;
		flex-direction: column;
		
	}

	.css-f9f6b {
	    display: flex;
	    -webkit-box-flex: 1;
	    flex-grow: 1;
	    flex-direction: column;
	    background: rgb(255, 255, 255);
	    width: 362px;
	    padding: 30px;
	}
	.css-zjik7{
		display: flex;
	}

	.css-opcus0 {
	    min-width: 48px;
	    height: 48px;
	    display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    border-radius: 3px;
	    font-weight: normal;
	    font-size: 14px;
	    color: rgb(95, 0, 128);
	    border: 1px solid rgb(95, 0, 128);
	    background-color: white;
	}
	
	.css-38n0u7 {
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    min-width: 50%;
	    min-height: 48px;
	    margin-left: 20px;
	}
	
	.css-1ssqp0h {
	    display: block;
	    overflow: hidden;
	    font-weight: 500;
	    font-size: 20px;
	    color: rgb(51, 51, 51);
	    line-height: 28px;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	}
	.css-1ml6iux {
    	display: flex;
    	flex-direction: column;
    	margin-top: 16px;
	}
	.css-1ml6iux > p{
    	padding-top: 4px;
	}
	.css-ogmz8i {
	    font-size: 14px;
	    line-height: 18px;
	    color: rgb(51, 51, 51);
	}
	.css-ogmz8i > strong {
	   	color: rgb(95, 0, 128);
	    font-weight: 400;
	    letter-spacing: 0px;
	}
	
	.css-rae9pu {
	    display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    margin-top: 18px;
	}
	
	.css-36xqpo {
	    width: auto;
	    height: 30px;
	    border: 1px solid rgb(244, 244, 244);
	    border-radius: 15px;
	    background-color: rgb(244, 244, 244);
	    font-size: 12px;
	    color: rgb(51, 51, 51);
	    line-height: 18px;
	    text-align: center;
	    -webkit-box-flex: 1;
	    flex-grow: 1;
	}
	
	.css-1jfsjbs {
	    display: flex;
	    -webkit-box-flex: 1;
	    flex-grow: 1;
	    flex-direction: column;
	    background: rgb(255, 255, 255);
	    overflow: hidden;
	    width: 168px;
	    padding: 30px;
	    margin-left: 4px;
	}
	
	.css-10jtkcq {
    	display: flex;
    	flex-direction: column;
    	width: 100%;
    	height: 100%;
	}
	
	.css-1neijcm {
	    font-size: 14px;
	    font-weight: 400;
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    color: rgb(51, 51, 51);
	}
	.css-1j4llu6 {
	    width: 28px;
	    height: 28px;
	    background-position: 50% 50%;
	    background-repeat: no-repeat;
	    background-size: cover;
	}
	
	.css-15sp3y3 {
	    -webkit-box-flex: 2;
	    flex-grow: 2;
	}

.css-10qtt9d {
    position: relative;
    -webkit-box-flex: 3;
    flex-grow: 3;
}

.css-9r29nq {
    font-weight: 500;
    font-size: 20px;
    color: rgb(95, 0, 128);
    line-height: 28px;
}
.css-bflnk9 {
    position: absolute;
    top: 40px;
    left: 0px;
    font-size: 12px;
    color: rgb(153, 153, 153);
}	
	


/* 하단부 */
	.wrapper2{
		display: flex;
	    width: 1050px;
	    padding: 50px 0px 80px;
	    margin: 0px auto;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
    	/* border: 2px solid black; */
    	/* background: aqua; */ 
		
	}
	
	.banner{
		width: 200px;
		box-sizing: border-box;
	}
	
	.css-1v4whg {
	    height: 75px;
	    padding: 15px 0px 35px 1px;
	    font-weight: 500;
	    font-size: 28px;
	    line-height: 35px;
	    color: rgb(51, 51, 51);
	    letter-spacing: -1px;
	    text-align: center;
	}
	
	css-1v4whg {
	    height: 75px;
	    padding: 5px 0px 1px
	    font-weight: 500;
	    font-size: 28px;
	    line-height: 35px;
	    color: rgb(51, 51, 51);
	    letter-spacing: -1px;
	}
	
	.css-1x9bshx {
   		border: 1px solid rgb(242, 242, 242);
	}
	
	ul{
		/* list-style-type: none; */
		display: block;
	    margin-block-start: 1em;
	    margin-block-end: 1em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    padding-inline-start: 40px;
	    list-style: none;
	}
	
	ul a{
		text-decoration: none;
	}
	
	
	
	.css-nk8664 {
	    cursor: pointer;
	    border-bottom: 1px solid rgb(242, 242, 242);
	    padding: 14px 20px 16px;
	    display: flex;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    line-height: 19px;
	    letter-spacing: -0.3px;
	    font-size: 14px;
	    color: rgb(102, 102, 102);
	}
	
	.bannerDetail{
	 	width: 820px;
	}
	
	@media screen and (max-width: 570px){
	/* .myPageWrapper{
		background: #f00;
		width: 400px;
		height: 1200px;
	} */
	
	.css-v9c59b, .css-i624a5 {
	 	width: 400px;
	 	height: 150px;
	 }
	 
	 .css-f9f6b {
	    display: flex;
	    -webkit-box-flex: 1;
	    flex-grow: 1;
	    flex-direction: column;
	    background: white;
	    width: 362px;
	    padding: 30px;
	}
	
	.css-1jfsjbs {
	    display: flex;
	    -webkit-box-flex: 1;
	    flex-grow: 1;
	    flex-direction: column;
	    background: rgb(255, 255, 255);
	    overflow: hidden;
	    width: 168px;
	    padding: 30px;
	    margin-left: 4px;
	}
	
	
	
	.wrapper2{
		display: flex;
	    width: 400px;
	    padding: 50px 0px 80px;
	    margin: 0px auto;
	    flex-direction: column;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
		
	}
	
	.banner{
		width: 350px;
		box-sizing: border-box;
	}
	.css-1x9bshx {
		padding-inline-start: 0px;
    	border: 1px solid rgb(242, 242, 242);
    	float: left;
    	list-style-type: none;
    	width: 400px;
	}
	
	
	
	.bannerDetail{
	 	width: 400px;
	}
	
	.css-0{
		float: left;
	}
	.css-nk8664 {
		padding : 14px 10px 16px;
	}
}
</style>
<div class="myPageWrapper">
		<!-- 회원정보 퀵메뉴 wrapper -->
		<div class="css-v9c59b epggjnz4">
			
			<div class="css-i624a5 epggjnz3">
			
				<!--회원 정보 wrapper-->
				<div class="css-f9f6b epggjnz1">
					<div class="css-zjik7 ebhkjs79">
						<div class="css-opcus0 ebhkjs76">일반</div>
							<div class="css-38n0u7 ebhkjs75">
								<strong class="css-1ssqp0h ebhkjs74">${mdto.m_name} 님</strong>
							</div>
					</div>
					
					<div class="css-1ml6iux ebhkjs78">
						<!-- <p class="css-ogmz8i ebhkjs71">
							<strong>첫구매 우대 - </strong>적립 5%
						</p>
						<p class="css-ogmz8i ebhkjs71">
							<strong>첫구매 우대 - </strong>20,000원 이상 무료 배송
						</p> -->
					</div>
					
					<div class="css-rae9pu ebhkjs77">
						<!-- <button class="css-36xqpo ebhkjs70">전체등급 보기</button>
						<button class="css-36xqpo ebhkjs70">다음 달 예상등급 보기</button> -->
					</div>
				</div>
				
				<!-- 적립금 내역 wrapper -->
				<div class="css-1jfsjbs epggjnz0">
					<a href="<c:url value='/myPage/UserPoint?page=1'/>" class="css-10jtkcq e1ugk4rt7">
						<div class="css-1neijcm e1ugk4rt6">적립금
							<span class="css-1j4llu6 e1ugk4rt4"></span>
						</div>
						<div class="css-15sp3y3 e1ugk4rt3"></div>
						<div class="css-10qtt9d e1ugk4rt2">
							<div class="css-9r29nq e1ugk4rt1">${mdto.m_point} 원</div>
							
						</div>
					</a>
				</div>
		
			</div>
		</div>
		
		
		<!-- 상세내역 -->
		<div class="wrapper2">
		 
			<!-- 좌측메뉴 wrapper -->
			<div class="banner">
				<div class="css-1v4whg">
					마이페이지		
				</div>
				
				<ul class="css-1x9bshx ecbxmj2">
					<li class="css-0 ecbxmj1">
						<a class=" css-nk8664 ecbxmj0" id="orderList" href="<c:url value='/myPage/OrderList?page=1'/>">주문내역</a>
					</li>
					<li class="css-0 ecbxmj1">
						<a class=" css-nk8664 ecbxmj0" id="favList" href="<c:url value='/myPage/WishList'/>">찜한상품</a>
					</li>
					
					<li class="css-0 ecbxmj1">
						<a class=" css-nk8664 ecbxmj0" id="userPoint" href="<c:url value='/myPage/UserPoint?page=1'/>">적립금</a>
					</li>
					<li class="css-0 ecbxmj1">
						<a class=" css-nk8664 ecbxmj0" id="userInfoChange" href="<c:url value='/myPage/UserInfoChange'/>">개인정보 수정</a>
					</li>
					<li class="css-0">
						<a class=" css-nk8664 ecbxmj0" id="userDropOut" href="<c:url value='/myPage/UserDropOut'/>">odos 회원탈퇴</a>
					</li>
				</ul>
				
			</div>
		
			<div class="bannerDetail" id="bannerDetail">
				<jsp:include page="${myPageUrl }"/>
			</div>
		</div>
		
</div>