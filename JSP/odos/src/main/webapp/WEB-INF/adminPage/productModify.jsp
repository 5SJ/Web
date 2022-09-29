<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<h1>상품 수정 페이지</h1>
<form action="ProdModifyReg" name="frm" method="post" enctype="multipart/form-data">
<input type="hidden" name="index" value="${dto.s_index }" />
<input type="hidden" name="before" value="${dto.s_cate }" />
<input type="hidden" name="page" value="${param.page }" />
<c:if test="${param.cate!=null }"><input type="hidden" name="cate" value="${param.cate }" /></c:if>
<c:if test="${param.search!=null }"><input type="hidden" name="search" value="${param.search }" /></c:if>
	<table border="">
		<tbody>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="name" value="${dto.s_name }" /></td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="category">
						<c:forEach items="${category }" var="cate">
							<c:if test="${cate.c_name != 'md' && cate.c_name != 'new' }">
							<option value="${cate.c_name }" <c:if test="${cate.c_name eq dto.s_cate }">selected</c:if>>${cate.c_name }</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td>		
				<td><input type="text" name="price" value="${dto.s_price }" /></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>
					<c:choose>
						<c:when test="${dto.s_image != null }">
							${dto.s_image }
							<input type="hidden" name="image" value="${dto.s_image }" />
							<input type="button" value="파일삭제" onclick="imageDelete('${dto.s_index }')" />
						</c:when>
						<c:otherwise>
							<input type="file" name="image" accept=".bmp, .png, .jpg, .jpeg, .gif"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2">상품설명</td>
			</tr>
			<tr>
				<td colspan="2"><textarea rows="5" cols="50" name="info">${dto.s_info }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right"><input type="submit" value="수정">
				
				<c:choose>
					<c:when test="${param.cate != null }">
						<a href="ProdDetail?cate=${param.cate }&page=${param.page }&index=${dto.s_index}">뒤로</a>
					</c:when>
					<c:when test="${param.search != null }">
						<a href="ProdDetail?search=${param.search }&page=${param.page }&index=${dto.s_index}">뒤로</a>
					</c:when>
					<c:otherwise>
						<a href="ProdDetail?page=${param.page }&index=${dto.s_index }">뒤로</a>
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</tbody>
	</table>
</form>
</body>
<script>
function imageDelete(index){
	if(confirm("이미지를 삭제하시겠습니까?\n삭제한 이미지는 복원할 수 없습니다.")){
		location.href="ImageDeleteReg?page=${param.page }&index="+index
	}
}
</script>