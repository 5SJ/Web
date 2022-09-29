<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
.orderListTitle{
	font-weight: 500;
	font-size: 30px;
}
table{
	border-collapse: collapse;
	width: 1200px;
	
}
td{
	padding:5px;
	text-align: center;
}
</style>
<p class="orderListTitle">주문현황</p>
<table border="" width="1000px">
	<tr align="center">
		<td colspan="4">
		<form id="schForm" action="OrderSearch">
			<select name="sch">
				<option value="num">주문번호</option>
				<option value="id">주문자</option>
			</select>
			<input type="text" id="input" name="input" maxlength="20">
			<input type="button" value="검색" onclick="schGo()"/>
			<input type="hidden" name="page" value="1" />
		</form>
		</td>
		<td>
			<form action="OrderSearch">
			<select name="sort" onchange="submit()">
				<option value="all">전체</option>
				<c:forEach items="${odto.oi_sortMap }" var="map">
					<option value="${map.key }" <c:if test="${map.key == sort }">selected</c:if>>${map.value }</option>
				</c:forEach>
			</select>
			<input type="hidden" name="page" value="1" />
			</form>
		</td>
	</tr>
	<tr align="center">
		<th>주문번호</th>
		<th>주문일</th>
		<th>주문매장</th>
		<th>주문자</th>
		<th>주문상태</th>
	</tr>
	<c:forEach items="${list }" var="dto" begin="${param.page*15-15 }" end="${param.page*15-1 }">
		<tr>
			<td>
			<c:choose>
				<c:when test="${param.sort!=null }">
					<a href="OrderDetail?sort=${param.sort }&page=${param.page }&num=${dto.oi_num }">${dto.oi_num }</a>
				</c:when>
				<c:when test="${param.sch!=null }">
					<a href="OrderDetail?sch=${param.sch }&input=${param.input }&page=${param.page }&num=${dto.oi_num }">${dto.oi_num }</a>
				</c:when>
				<c:otherwise>
					<a href="OrderDetail?page=${param.page }&num=${dto.oi_num }">${dto.oi_num }</a>
				</c:otherwise>
			</c:choose>
			</td>
			<td><fmt:formatDate value="${dto.oi_date }" pattern="yyyy-MM-dd HH:mm"/></td>
			<td>${dto.f_name }</td>
			<td>${dto.oi_mid }</td>
			<td>${dto.oi_sortStr }</td>
		</tr>
	</c:forEach>	
		<tr>
			<td colspan="5">
			 <c:forEach var="i" begin="1" end="${list.size()/15+1 }">
				<c:choose>
					<c:when test="${param.sort!=null }">
						<a href="OrderSearch?sort=${param.sort }&page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
					</c:when>
					<c:when test="${param.sch!=null }">
						<a href="OrderSearch?sch=${param.sch }&input=${param.input }&page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
					</c:when>
					<c:otherwise>
						<a href="OrderList?page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			</td>
		</tr>
</table>

<script src="../jq/jquery-3.6.0.js"></script>
<script>
function schGo() {
	$(function(){
		if($("#input").val()==""){
			alert("검색어를 입력해주세요.")
		} else {
			$("#schForm").submit()
		}
	})
}
</script>