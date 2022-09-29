<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.proListTitle{
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

<body>
	<p class="proListTitle">상품 관리</p>
	<c:if test="${search != null }"><h2>${search } 검색결과</h2></c:if>
	<c:if test="${cate != null }"><h2>${cate } 카테고리 목록</h2></c:if>
	<div>
		<form action="ProdSearch">
			<select name="cate" onchange="submit()">
				<option value="all">전체</option>
				<c:forEach items="${category }" var="dto">
					<c:if test="${dto.c_name!='md' && dto.c_name!='new' }">
					<option value="${dto.c_name }" <c:if test="${dto.c_name == cate }">selected</c:if>>${dto.c_name }</option>
					</c:if>
				</c:forEach>
			</select>
			<input type="hidden" name="page" value="1" />
		</form>
	</div>
	<table id="list" border="">
		<tbody>
			<tr>
				<th width="100px">상품번호</th>
				<th width="400px">상품 이미지</th>
				<th width="300px">상품명</th>
				<th width="300px">카테고리</th>
				<th width="300px">가격</th>		
				<th width="300px">재고</th>		
			</tr>
			<c:forEach items="${list}" var="prod" begin="${param.page*5-5 }" end="${param.page*5-1 }">
			<tr>
				<td>${prod.s_index}</td>
				<td><img alt="no_Image" src="../image/img_Product/${prod.s_image }" style="width:120px; height:120px;"></td>
				<td>
					<c:choose>
						<c:when test="${param.cate!=null }">
							<a href="ProdDetail?cate=${param.cate }&page=${param.page }&index=${prod.s_index}">${prod.s_name}</a>
						</c:when>
						<c:when test="${param.search!=null }">
							<a href="ProdDetail?search=${param.search }&page=${param.page }&index=${prod.s_index}">${prod.s_name}</a>
						</c:when>
						<c:otherwise>
							<a href="ProdDetail?page=${param.page }&index=${prod.s_index}">${prod.s_name}</a>
						</c:otherwise>
				</c:choose>
				</td>
				<td>${prod.s_cate}</td>
				<td>${prod.s_price}</td>
				<td>${prod.s_cnt}</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="center"><a href="ProdInsert">상품 추가</a></td>
			</tr>
			
			<tr>
				<td colspan="6">
					<c:forEach var="i" begin="1" end="${list.size()/5+1 }">
					<c:choose>
						<c:when test="${cate!=null }">
							<a href="ProdSearch?cate=${cate }&page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
						</c:when>
						<c:when test="${search!=null }">
							<a href="ProdSearch?search=${search }&page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
						</c:when>
						<c:otherwise>
							<a href="ProdList?page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="searchWrapper" align="center">
		<form action="ProdSearch">
			<input type="text" name="search" placeholder="상품이름"/>
			<input type="hidden" name="page" value="1" />
			<input type="submit" value="검색" />
		</form>
	</div>
</body>
<script>
	
</script>