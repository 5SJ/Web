<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.franListTitle{
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
	<p class="franListTitle">가맹점 관리</p>
	<input type="hidden" name="page" value="${param.page }" />
	<table border="">
		<tbody>
			<tr>
				<td colspan="6">
					<input type="button" onclick="add()" value="신규 가맹점 추가"/>
					<!-- <input type="button" onclick="del()" value="정지"/> -->
				</td>
			</tr>
			<tr>
				<!-- <td><input type="checkbox"></td> -->
				<td>ID</td>
				<td>매장명</td>
				<td>매장주소</td>
				<td>매장번호</td>
				<td>상태</td>
			</tr>
			<c:forEach items="${list}" var="dto" begin="${param.page*15-15 }" end="${param.page*15-1 }">
			<tr>
				<%-- <td><input type="checkbox" class="chk" value="${dto.f_id}"></td> --%>
				<td><a href="FranchiseeUpdateForm?page=${param.page }&f_id=${dto.f_id}">${dto.f_id}</a></td>
				<td>${dto.f_name}</td>
				<td>${dto.f_addr}</td>
				<td>${dto.f_phone}</td>
				<td>
				<c:if test="${dto.f_state eq 2}">
				정상
				</c:if>
				<c:if test="${dto.f_state eq 5}">
				비정상
				</c:if>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="6" align="center">
				<c:forEach var="i" begin="1" end="${list.size()/15+1 }">
					<a href="FranchiseeList?&page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
				</c:forEach>
				</td>
			</tr>
		</tbody>
	</table>
</body>
<script>
	function add() {
		location.href = "FranchiseeInsertForm?page=${param.page}";
		
	}
	
	function del() {
		//console.log($(".chk").val());
		location.href = "FranchiseeDeleteReg?f_id="+$(chk).val();
	}
</script>