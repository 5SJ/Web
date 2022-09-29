<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
a {
	color:blue;
}
.memberListTitle{
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
<p class="memberListTitle">회원관리</p>
<table border="">
	<tr align="center">
		<td>
			<a href="MemberList?type=1&page=1">일반회원</a>
		</td>
		<td>
			<a href="MemberList?type=2&page=1">가맹회원</a>
		</td>
		<td>
			<select id="status">
				<option selected>------------</option>
				<c:if test="${type eq 1}">
				<option value="1">일반회원</option>
				<option value="3">일반탈퇴</option>
				<option value="4">일반정지</option>
				</c:if>
				<c:if test="${type eq 2}">
				<option value="2">가맹점주</option>
				<option value="5">가맹정지</option>
				</c:if>
			</select>
		</td>
		<td colspan="4">
			<select id="sort">
				<option selected>------------</option>
				<option value="m_id">아이디</option>
				<option value="m_name">이름</option>
			</select>
			<input type="text" id="keyword" placeholder="검색어를 입력해주세요.">
			<input type="button" onclick="search()" value="검색">
		</td>
	</tr>
	<tr>
		<td colspan="8" align="center">
			<!-- ajax하고싶어서 이거 하는 거임 -->
			<c:choose>
				<c:when test="${type eq 1}">회원정보</c:when>
				<c:when test="${type eq 2}">가맹회원정보</c:when>
			</c:choose>
		</td>
	</tr>
	<tr align="center">
		<td>아이디</td>
		<td>이름</td>
		<td>이메일</td>
		<td>주소</td>
		<td>적립금</td>
		<td>가입일</td>
		<td>권한</td>
	</tr>
	<c:forEach items="${list}" var="dto" begin="${param.page*15-15 }" end="${param.page*15-1 }">	
		<tr>
			<td>
				<a href="MemDetail?<c:if test="${param.status!=null }">status=${param.status }&</c:if>type=${param.type }&page=${param.page }&m_id=${dto.m_id  }">${dto.m_id }</a>
			</td>
			<td>${dto.m_name }</td>
			<td>${dto.m_email }</td>
			<td>${dto.m_addr }</td>
			<td>${dto.m_point }</td>
			<td>
				<fmt:formatDate value="${dto.m_date }" pattern="yyyy-MM-dd"/>
			</td>
			<td>${dto.m_stateStr }</td>
		</tr>
	</c:forEach>	
	<tr>
		<td colspan="8" align="center">
		<c:forEach var="i" begin="1" end="${list.size()/15+1 }">
			<a href="MemberList?<c:if test="${param.status!=null }">status=${param.status }&</c:if>type=${param.type }&page=${i }" <c:if test="${param.page == i}">style="pointer-events:none; color:#000;"</c:if>>${i }</a>
		</c:forEach>
		</td>
	</tr>
</table>
<script>
	$(function () {
		for(var i=1;i<$("#status")[0].length;i++){
			if($("#status")[0][i].value == "${status}".trim()){
				$("#status")[0][i].selected = true;
			}
		}
	});
	
	$("#status").on('change', function () {
		console.log($(this).val());
		if($(this).val() != $("#status")[0][0].value) {
			location.href="MemberList?status="+$(this).val()+"&type=${type}&page=${param.page}";
		}
	});
	
	function search() {
		if($("#sort")[0][0].selected == true){
			alert("검색타입을 지정해주세요.")
		}else if($("#keyword").val() == ""){
			alert("검색어를 입력해주세요.")
		}else{
			for(var i=1;i<$("#sort")[0].length;i++){
				if($("#sort")[0][i].selected == true){
					console.log($("#keyword").val());
					console.log($("#sort")[0][i].value);
					location.href="MemberList?status=${status}&type=${type}&sort="+$("#sort")[0][i].value+"&keyword="+$("#keyword").val()+"&page=1";
				}
			}
		}
	}
</script>