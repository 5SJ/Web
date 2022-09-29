<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.prodInsertTitle{
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
<p class="prodInsertTitle">새 상품 추가</p>
<form action="ProdInsertReg" method="post" enctype="multipart/form-data">
	<table border="">
		<tbody>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="name"/></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="category">
						<c:forEach items="${category }" var="cate">
						<c:if test="${cate.c_name != 'md' && cate.c_name != 'new' }">
							<option value="${cate.c_name }">${cate.c_name }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>		
				<td><input type="text" name="price"/></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td><input type="file" name="image" accept=".bmp, .png, .jpg, .jpeg, .gif"/></td>
			</tr>
			<tr>
				<td colspan="2">상품설명</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="5" cols="50" name="info"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록">
					<a href="ProdList?page=1">뒤로</a>
				</td>
			</tr>
		</tbody>
	</table>
</form>
</body>
<script>
	
</script>