<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript">
	function NoMulti(chk){
		var obj = document.getElementsByName("check");
		for(var i=0; i<obj.length; i++){
			if(obj[i] != chk){
				obj[i].checked = false;
				}
			}
		}
</script>

<form action="BoardInsertReg" method="post" enctype="multipart/form-data">
	<div class="bigAll">
		<div class="centerPlz">
			<div class="detailTitle">
				<div>
					<h2>
					<c:choose>
						<c:when test="${type eq 0}">공지사항</c:when>
						<c:when test="${type eq 1}">이벤트</c:when>
						<c:when test="${type eq 2}">자주하는질문</c:when>
					</c:choose>
					</h2>
				</div>
				<input type="hidden" value="${type}" name="a_type"/>
			</div>
			<div class="deParent">
				<div class="detailList">제목</div>
				<div class="titleWriter"><input type="text" name="title"/> </div>
			</div>
			<div class="deParent">
				<div class="detailList">상단으로 고정</div>
				<div class="fixChk">
					<span>Y</span>
					<div><input type="checkbox" name="check" value="Y" onclick="NoMulti(this)"/></div>
					<span>N</span>
					<div><input type="checkbox" name="check" value="N" onclick="NoMulti(this)" checked="checked"/></div>
				</div>
			</div>
			<div class="contentParent">
				<div class="fileUpload">파일 업로드 <input type="file" name="a_file"/></div>
				<div class="content"><textarea name="contentArea" rows="" cols=""></textarea></div>
			</div>
		</div>
		<div class="submitParent">
			<div class="submit"><input type="submit" value="작성"/></div>
			<div><a href="BoardList?type=${type}&page=${param.page}"><input type="button" value="목록"/></a></div>
		</div>
	</div>
</form>
