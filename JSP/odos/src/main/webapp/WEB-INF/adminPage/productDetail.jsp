<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.prdDetailTitle{
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
<body>
	<p class="prdDetailTitle">상품 상세 페이지</p>
	<table border="">
		<tbody>
			<tr>
				<td rowspan="5">
					<img alt="no_Image" src="../image/img_Product/${dto.s_image }" style="width:240px; height:240px;">
				</td>
				<td>상품번호</td>
				<td>${dto.s_index}</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>${dto.s_name}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${dto.s_cate}</td>
			</tr>
			<tr>
				<td>가격</td>		
				<td>${dto.s_price}</td>
			</tr>
			<tr>
				<td>재고</td>		
				<td>${dto.s_cnt}</td>
			</tr>
			<tr>
				<td colspan="3" align="center">상품설명</td>
			</tr>
			<tr>
				<td colspan="3">${dto.s_infoBr }</td>
			</tr>
			<tr>
				<td colspan="3" align="right">
				<input type="button" value="삭제" onclick="productDelete('${dto.s_index }')" />
				<c:choose>
					<c:when test="${param.cate != null }">
						<a href="ProdModify?cate=${param.cate }&page=${param.page }&index=${dto.s_index}">수정</a>
						<a href="ProdSearch?page=${param.page }&cate=${param.cate }">목록</a>
					</c:when>
					<c:when test="${param.search != null }">
						<a href="ProdModify?search=${param.search }&page=${param.page }&index=${dto.s_index}">수정</a>
						<a href="ProdSearch?page=${param.page }&search=${param.search }">목록</a>
					</c:when>
					<c:otherwise>
						<a href="ProdModify?page=${param.page }&index=${dto.s_index}">수정</a>
						<a href="ProdList?page=${param.page }">목록</a>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
</body>
<script>
function productDelete(index){
	if(confirm("상품을 삭제하시겠습니까?")){
		location.href="ProdDeleteReg?index="+index
	}
}
</script>