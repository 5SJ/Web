<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script type ="text/javascript" src="../bootstrap/js/bootstrap.bundle.min.js" ></script>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script>
<%if(session.getAttribute("id") == null) {%>
alert("로그인 후 이용해주세요")
location.href="Login"
<%} else if((int)session.getAttribute("state") == 4 ) {%>
alert("이용이 정지된 회원입니다. \n고객센터 또는 1대1 게시판으로 문의해주세요.")
location.href="MainPage"
<%}%>
function cart(index){
	$(function(){
		$.ajax({
				url: "../ajax/Cart",
				type: "GET",
				data: {index:index, cnt:$("#cnt").attr('value')},
				async: false,
				success: function(){
					if(confirm("상품을 장바구니에 담았습니다.\n장바구니로 이동하시겠습니까?")){
						location.href="Cart"
					}
				},
				error: function(){
					console.log("실패")
				}
			})
	})
}
function setCnt(num){
	var cnt = $("#cnt").attr('value') + num
	if(eval(cnt)>0) {
		$("#cnt").attr('value', eval(cnt))
	}
}
function wish(index) {
	$(function(){
		$.ajax({
				url: "../ajax/SetWishlist",
				type: "GET",
				data: {index:index},
				async: false,
				success: function(res){
					if(res=="ins") {
						$("#btnwish").val("찜취소")
						$("#btnwish").css({
							color: "#fff",
							border: "1px solid #88001b",
							backgroundColor: "#88001b"
						})
					} else if(res=="del"){
						$("#btnwish").val("찜하기")
						$("#btnwish").css({
							color: "#88001b",
							border: "1px solid #88001b",
							backgroundColor: "#fff"
						})
					}
				},
				error: function(res){
					console.log(res)
				}
			})
		
	})

}
</script>
<style>
.wrapper {
	margin: 0px auto;
	width: 1000px;
	background: #fff;
	display: flex;
	padding: 20px 0px;
}

.productimgg {
	width: 480px;
	height: 400px;
	margin: 10px;
	float: left;
}

.producinfo {
	width: 480px;
	margin: 10px;
	float: left;
}

img {
	height: 400px;
}

.jangdam {
	padding-top: 10px;
	border-bottom: 1px solid rgba(240, 240, 240);
}

.jangsul {
	margin-top: 30px;
	width: 480px;
	height: 300px;
	/*  border: 1px solid; */
}

.jangsul>img {
	width: 480px;
	height: 300px;
}

.jangbtn {
	width: 100px;
	height: 40px;
	border-radius: 3px;
	color: #88001b;
	background-color: #fff;
	border: 1px solid #88001b;
	font-size: 13px;
}

@media screen and (max-width: 500px) {
	.wrapper {
		width: 412px;
	}
	.productimgg {
		width: 392px;
		height: 500px;
	}
	.producinfo {
		width: 392px;
	}
	.jangsul img {
		width: 392px;
		height: 300px;
	}
	.jangsul {
		width: 392px;
		height: 300px;
	}
}
</style>
<div class="wrapper">
	<div>
		<div class="productimgg">
			<img alt="no_Image" src="../image/img_Product/${dto.s_image }">
		</div>
		<div class="producinfo">
			<div class="jangdam"><h2>${dto.s_name }</h2></div>
			<div class="jangdam"><h3><fmt:formatNumber value="${dto.s_price }" pattern="#,#00원"/></h3></div>
			<div class="jangdam"><h3>${dto.s_infoBr }</h3></div>
			<c:if test="${dto.s_cnt > 0 }">
			<%if(session.getAttribute("state") != null && (int)session.getAttribute("state") == 1) {%>
			<div>주문수량 </div>
			<div class="cart-cntBtn">
				<button onclick="setCnt('-1')">-</button>
				<div><input type="text" id="cnt" value="1" size="5" disabled /></div>
				<button onclick="setCnt('+1')">+</button>
			</div>
			<div class="jangdam">
				<button class="jangbtn" onclick="cart('${dto.s_index}')">장바구니 담기</button>
				<c:choose>
					<c:when test="${wish=='n' }">
					<input type="button" id="btnwish" class="jangbtn" value="찜하기" onclick="wish('${dto.s_index}')" style="color:#88001b; border:1px solid #88001b; background-color:#fff;"/>
					</c:when>
					<c:when test="${wish=='y' }">
					<input type="button" id="btnwish" class="jangbtn" value="찜취소" onclick="wish('${dto.s_index}')" style="color:#fff; border:1px solid #88001b; background-color:#88001b;"/>
					</c:when>
				</c:choose>
			</div>
			<%} %>
			</c:if>
			<c:if test="${dto.s_cnt <= 0 }"><h2>품절된 상품입니다.</h2></c:if>
		</div>
	</div>
</div>