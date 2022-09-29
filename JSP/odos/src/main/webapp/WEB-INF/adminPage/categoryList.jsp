<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.cateTitle{
		font-weight: 500;
		font-size: 30px;
	}
	td{
		padding:5px;
		text-align: center;
	}
	#list{
		border-collapse: collapse;
		width: 1200px;
	}

</style>
<body>
	<p class="cateTitle">카테고리 관리</p>
	<div class="tableWrapper">
		<form action="CateInsertReg" method="post">
		<table border="" id="list">
			<tbody>
				<tr class="lineTr">
					<th class="listName">카테고리명</th>
					<th colspan="2">상품목록</th>		
				</tr>
				<c:forEach items="${list}" var="cate">
					<tr class="lineTr">
						<td class="listName">${cate.c_name}</td>
						<td>${cate.c_itemStr }</td>
						<td class="btnList">
						<c:choose>
							<c:when test="${cate.c_name == 'md' || cate.c_name == 'new' }">
								<input type="button" value="품목 관리" onclick="cateItemModify('${cate.c_name}')">
							</c:when>
							<c:otherwise>
								<input type="button" value="카테고리 삭제" onclick="cateDelete('${cate.c_name}')">
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3">카테고리 추가 : <input type="text" name="name"/>
					<input type="submit" value="추가"/></td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
	
</body>

<script>
function cateDelete(name){
	if(confirm("삭제하시겠습니까?")){
		location.href="CateDeleteReg?c_name="+name
	}
}
function cateItemModify(name){
	location.href="CateItemModify?c_name="+name+"&page=1"
}

</script>