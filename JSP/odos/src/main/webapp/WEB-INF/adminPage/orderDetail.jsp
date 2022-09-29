<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dto.OrderDTO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.orderListDetailTitle{
	font-weight: 500;
	font-size: 30px;
}
table{
	border-collapse: collapse;
	
}
td{
	padding:5px;
	align-items: center;
}
</style>
<%
OrderDTO dto = (OrderDTO)request.getAttribute("dto");
LinkedHashMap<Integer, Integer> oi_list = dto.getOi_list();
%>

<p class="orderListDetailTitle">주문상세 페이지</p>
<table border="">
	<tr>
		<td colspan="3" align="center">${dto.oi_num }</td>
	</tr>
	<tr>
		<th>주문일시</th>
		<td colspan="2">${dto.oi_dateStr }</td>
	</tr>
	<tr>
		<th>주문자(ID)</th>
		<td colspan="2">${dto.oi_mid }</td>
	</tr>
	<tr>
		<th>주문상태</th>
		<td colspan="2">${dto.oi_sortStr }
			<c:if test="${dto.oi_sort == 1 }"><input type="button" value="접수완료" onclick="sortUpdate('${dto.oi_num}','2')" /></c:if>
			<c:if test="${dto.oi_sort == 2 }"><input type="button" value="상품배송" onclick="sortUpdate('${dto.oi_num}','3')" /></c:if>
			<c:if test="${dto.oi_sort < 5 }">
			<input type="button" value="주문취소" onclick="orderCancel()" />
			</c:if>
		</td>
	</tr>
	<tr><td colspan="3"><hr/></td></tr>
	<tr>
		<th colspan="3" align="center">상품목록</th>
	</tr>
	<tr align="center">
		<th>(품번)상품명</th>
		<th>수량</th>
		<th>금액</th>
	</tr>
	<%for(int key : oi_list.keySet()) {
		ProductDTO pdto = new ProductDAO().detail(key);%>
		<tr>
			<td>(<%=key %>)<%=pdto.s_name %></td>
			<td align="center"><%=oi_list.get(key) %></td>
			<td align="right"><fmt:formatNumber value="<%=pdto.s_price*oi_list.get(key) %>" pattern="#,###원"/></td>
		</tr>
	<%} %>
	<tr>
		<th colspan="2" align="center">총 결제금</th>
		<td align="right"><fmt:formatNumber value="${dto.oi_total }" pattern="#,###원"/></td>
	</tr>
	<tr><td colspan="3"><hr/></td></tr>	
	<tr>
		<th>주문매장</th>
		<td colspan="2">${fdto.f_name }(${fdto.f_id })</td>
	</tr>
	<tr>
		<th>주소</th>
		<td colspan="2">${fdto.f_addr }</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td colspan="2">${fdto.f_phone }</td>
	</tr>
	<tr>
		<th>매장정보</th>
		<td colspan="2">${fdto.f_info }</td>
	</tr>
	<tr><td colspan="3"><hr/></td></tr>
	<tr>
		<th colspan="3" align="center">결제정보</th>
	</tr>
	<tr>
		<th>고유번호</th>
		<td colspan="2">${dto.oi_info }</td>
	</tr>
	<c:if test="${pay!=null }">
		<tr>
			<th>구분</th>
			<td colspan="2">
				<c:choose>
					<c:when test="${pay.getPayMethod() == 'card'}">카드결제</c:when>
					<c:when test="${pay.getPayMethod() == 'point' && pay.getEmbPgProvider() == 'kakaopay'}">카카오페이</c:when>
					<c:when test="${pay.getPayMethod() == 'samsung'}">삼성페이</c:when>
					<c:when test="${pay.getPayMethod() == 'trans'}">실시간계좌이체</c:when>
					<c:when test="${pay.getPayMethod() == 'vbank'}">가상계좌</c:when>
					<c:when test="${pay.getPayMethod() == 'phone'}">휴대폰소액결제</c:when>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>결제금액</th>
			<td colspan="2">
				<fmt:formatNumber value="${pay.getAmount()}" pattern="#,###원"/>
				<c:if test="${pay.getStatus() == 'cancelled'}">
				(취소 : <fmt:formatNumber value="${pay.getCancelAmount()}" pattern="#,###원"/>)
				</c:if>
			</td>
		</tr>
		<c:if test="${pay.getApplyNum() != null && pay.getApplyNum() != ''}">
			<tr>
				<th>카드사 승인번호</th>
				<td colspan="2">${pay.getCardName()}(${pay.getApplyNum()})</td>
			</tr>
		</c:if>
	</c:if>
	<tr>
		<td colspan="3" align="right">
			<c:choose>
				<c:when test="${param.sort!=null }">
					<a href="OrderSearch?sort=${param.sort }&page=${param.page }">목록으로</a>
				</c:when>
				<c:when test="${param.sch!=null }">
					<a href="OrderSearch?sch=${param.sch }&input=${param.input }&page=${param.page }">목록으로</a>
				</c:when>
				<c:otherwise>
					<a href="OrderList?page=${param.page }">목록으로</a>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>


<script>
function sortUpdate(oi_num, oi_sort) {
	location.href="SortUpdate?<c:if test="${param.sort!=null}">sort=${param.sort }&</c:if>page=${param.page }&oi_num="+oi_num+"&oi_sort="+oi_sort;
}
function orderCancel() {
	if(confirm("주문을 취소하시겠습니까?")){
		location.href="OrderCancelReg?page=${param.page}&oi_num=${dto.oi_num }"
	}
}
</script>
