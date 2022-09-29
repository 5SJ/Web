<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

<script>
	function fileDelete(){
		if(confirm("파일을 삭제 하시겠습니까? 삭제한 파일은 복원 불가합니다.")){
			$.ajax({
				url: "BoardFileDelete",
				type: "post",
				data:{
					a_index: "${dto.a_index}",
					a_file: "${dto.a_file}"
				},
				dataType: "text",
				success: function (data) {
					alert("파일이 삭제되었습니다.");
					$(".fileUpload").html("파일 업로드 <input type='file' name='a_file'/>");
				},
				error:function (data){
					alert("다시 시도해주세요.");
				}
			});
		}
	}
	
	function NoMulti(chk){
		var obj = document.getElementsByName("check");
		for(var i=0; i<obj.length; i++){
			if(obj[i] != chk){
				obj[i].checked = false;
				}
			}
		}
</script>

<form action="BoardModifyReg" method="post" enctype="multipart/form-data" name="frm">
	<input type="hidden" name="page" value="${param.page }" />
	<div class="bigAll">
		<div class="centerPlz">
			<div class="detailTitle">
				<div>
					<h2>
					<c:choose>
						<c:when test="${dto.a_type eq 0}">공지사항 수정</c:when>
						<c:when test="${dto.a_type eq 1}">이벤트 수정</c:when>
						<c:when test="${dto.a_type eq 2}">자주하는질문 수정</c:when>
					</c:choose>
					</h2>
				</div>
			</div>
			<input type="hidden" value="${dto.a_index }" name="a_index"/>
			<input type="hidden" value="${dto.a_type }" name="a_type"/>
			<div class="deParent">
				<div class="detailList">제목</div>
				<div class="titleWriter">
					<input type="text" name="title" value="${dto.a_title }"/>
				</div>
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
				<c:choose>
					<c:when test="${dto.a_file != null }">
						<div class="fileUpload">
							<input type="button"  value="파일 삭제" onClick="fileDelete()"/>
							<input type="hidden"  name="a_file" value="${dto.a_file}"/>
						</div>
					</c:when>
					<c:otherwise>
						<div class="fileUpload">파일 업로드 <input type="file" name="a_file"/></div>
					</c:otherwise>
				</c:choose>
				<div class="content"><textarea name="contentArea" rows="" cols="">${dto.a_content }</textarea></div>
			</div>
		</div>
	
		<div class="submitParent">
			<div class="submit"><input type="submit" value="수정"/></div>
			<div><a href="BoardDetail?type=${param.type}&page=${param.page }&a_index=${dto.a_index}"><input type="button" value="뒤로가기"/></a></div>
		</div>
	</div>
</form>
