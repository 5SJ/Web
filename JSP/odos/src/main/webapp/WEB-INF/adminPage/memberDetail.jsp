<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>

</style>
  
<h2>회원정보 상세보기 입니다.</h2>

<table border="" width="1000px">
	<tr>
		<td>id</td>
		<td>${dto.m_id }</td>
	</tr>	
	<tr>
		<td>비밀번호</td>
		<td>${dto.m_pw }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.m_name }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${dto.m_email }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${dto.m_addr }</td>
	</tr>

	<tr>
		<td>적립금</td>
		<td>${dto.m_point }	</td>
	</tr>
	<tr>
		<td>날짜</td>
		<td>${dto.m_date }</td>
	</tr>
	<tr>
		<td>권한</td>
		<td>${dto.m_stateStr }</td>
	</tr>	
	<tr>
		<td colspan="2" align="right">
			<a href="MemModify?<c:if test="${param.status!=null }">status=${param.status }&</c:if>type=${param.type }&page=${param.page }&m_id=${dto.m_id }">수정</a> 
			<c:if test="${dto.m_state != 9}">
			<input type="button" value="삭제" onclick="memberDelete()" />
			</c:if>
			<a href="MemberList?<c:if test="${param.status!=null }">status=${param.status }&</c:if>type=${param.type }&page=${param.page }">목록으로</a> 
      	</td>
	</tr>
</table>

<script>
function memberDelete(){
	if(confirm("회원정보를 삭제하시겠습니까?\n삭제한 회원은 복구할 수 없습니다.")){
		location.href="MemDeleteReg?m_id=${dto.m_id }"
	}
}
</script>