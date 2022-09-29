<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	a{
		color: black;
	}
	
	
#readonly{
	background-color: gray;
}
</style>
    
<h2>회원정보 수정 입니다.</h2>
<script>

<c:if test="${msg!=null }">
	alert("${msg }")
</c:if>
</script>
<!-- enctype="multipart/form-data" -> 파일 올리기를 하겠다.-->
<form action="MemModifyReg" method="post" name="frm">
<c:if test="${param.status!=null }"><input type="hidden" name="status" value="${param.status }"/></c:if>
<input type="hidden" name="type" value="${param.type }"/>
<input type="hidden" name="page" value="${param.page }"/>
<input type="hidden" name="m_id" value="${dto.m_id }"/>
	<table border="">
		<tr>
			<td width="100px">아이디</td>
			<td width="500px"><input id="readonly" type="text" name="m_id" value="${dto.m_id }" readonly/></td>
		</tr>
		<tr>
			<td width="100px">비밀번호</td>
			<td width="500px"><input type="text" name="m_pw" value="${dto.m_pw }" /></td>
		</tr>
		<tr>
			<td >이름</td>
			<td ><input type="text" name="m_name" value="${dto.m_name }"/></td>
		</tr>
		
		<tr>
			<td >이메일</td>
			<td><input id="readonly" type="text" name="m_email" value="${dto.m_email }" readonly/></td>
		</tr>
		
		<tr>
			<td >주소</td>
			<td ><input type="text" name="m_addr" value="${dto.m_addr }"/></td>
		</tr>
		
		<tr>
			<td>적립금</td>
			<td><input type="text" name="m_point" value="${dto.m_point }"/></td>
		</tr>	
		<tr>
			<td>권한</td>
			<td>
			<select name="m_state">
				<c:forEach items="${dto.m_stateMap }" var="str">
					<option value="${str.key }" <c:if test="${dto.m_state eq str.key }">selected</c:if>>${str.value }</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정"/>
				<a href = "MemDetail?<c:if test="${param.status!=null }">status=${param.status }&</c:if>type=${param.type }&page=${param.page }&m_id=${dto.m_id }">뒤로</a>
			</td>
			
		</tr>
	</table>
</form>