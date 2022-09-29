<%@page import="dto.ProductDTO"%>
<%@page import="dto.CartDTO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script>
function setCnt(index, cnt) {
   location.href="CartReg?index="+index+"&cnt="+cnt
}
function delCart(index) {
   location.href="CartDeleteReg?index="+index
}
function order() {
   if(${list.size()==0}) {
      alert("장바구니에 담긴 상품이 없습니다.")
   } else {
      location.href="Order"
   }
}
</script>
<style>
.nonCartMsg{
	width: 300px;
	font-weight: 500;
	text-align: center;
	padding: 10px;
	margin: 50px auto;
	color: #aaa;
}
</style>
<%
String state  = session.getAttribute("state")+"";
%>
<%if(Integer.parseInt(state) == 4 ) {%>
<script>
alert("정지된 회원은 장바구니 기능을 사용하실수 없습니다. \n고객센터 또는 1대1 게시판으로 문의해주세요.")
location.href="MainPage"
</script>
<%}
LinkedHashMap list = (LinkedHashMap)request.getAttribute("list"); 
int total = 0;
for(Object key : list.keySet()) {
   CartDTO cart = (CartDTO)key;
   ProductDTO product = (ProductDTO)list.get(key);
   total += cart.getCl_cnt() * product.getS_price();
}
%>
<div class="cart_page">
   <div><h2>장바구니</h2></div>
   <div class="cart_view">
      <div class="cart_list">
         <!-- <div class="cart-1"><label class=""><input type="checkbox" /> 전체선택</label> </div> -->
         <div class="cart-1 cart_product">
         </div>

         <c:choose>
            <c:when test="${list.size()==0 }" >
            <div class="nonCartMsg">장바구니에 담긴 상품이 없습니다.</div>
            </c:when>
            <c:otherwise>
               <c:forEach items="${list }" var="dto" varStatus="no">
                  <div class="cart_pro_list">
                     <div class="cart-img"><img src="../image/img_Product/${dto.value.s_image }"></div>
                     <div class="cartname">${dto.value.s_name }</div>
                     <div class="cartprice"><fmt:formatNumber value="${dto.value.s_price }" pattern="#,###원"/></div>
                        <div class="cart-cntBtn">
                           <button onclick="setCnt('${dto.key.cl_item }',-1)" <c:if test="${dto.key.cl_cnt <=1 }">disabled</c:if>>-</button>
                           <div>${dto.key.cl_cnt }</div>
                           <button onclick="setCnt('${dto.key.cl_item }',1)">+</button>
                        </div>
                     <div class="cart-pro-total"><fmt:formatNumber value="${dto.value.s_price * dto.key.cl_cnt }" pattern="#,###원"/></div>
                     <div class="cart-delete"><button onclick="delCart('${dto.key.cl_item }')">Ⅹ</button></div>
                  </div>
               </c:forEach>
            </c:otherwise>
         </c:choose>
      </div>
      <div class="cart-total">
         <div class="cart-payment">
            <div>
               <div>총 결제 금액</div>
               <div class="cart-total-price">
                  <fmt:formatNumber value="<%=total %>" pattern="#,###원"/>
               </div>
            </div>
         </div>
         <div class="cart-order" onclick="order()">
            <div><a>주문하기</a></div>
         </div>
      </div>
   </div>
</div>