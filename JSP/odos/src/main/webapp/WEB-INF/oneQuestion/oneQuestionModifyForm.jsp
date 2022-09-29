<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script>

function fileDelete(){
	if(confirm("파일을 삭제 하시겠습니까? 삭제한 파일은 복원 불가합니다.")){
		var frm = document.frm
		frm.action = "OneQuestionFileDelete"
		frm.submit()
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
   
<form action="OneQuestionModifyReg" method="post" enctype="multipart/form-data" id="frm" name="frm">
	<input type="hidden" name="page" value="${param.page }" />
   <div class="bigAll">
      <div class="centerPlz">
         <div class="detailTitle">
            <div><h2>1대1문의 수정</h2></div>
         </div>
          <input type="hidden" value="${dto.u_index }" name="u_index"/>
         <div class="deParent">
            <div class="detailList">제목</div>
            <div class="titleWriter">
            <input type="text" name="title" id="title" value="${dto.u_title }"/>
            </div>
         </div>
         
         <div class="deParent">
            <div class="detailList">질문유형</div>
            <div class="btn-group">
				<select name="u_type">
						<c:choose>
							<c:when test="${state == 2 }">
								<option value="6">가맹점 문의</option>
							</c:when>
							<c:otherwise>
								<option value="0" <c:if test="${dto.u_type==0 }">selected</c:if>>주문/결제/반품/교환문의</option>
								<option value="1" <c:if test="${dto.u_type==1 }">selected</c:if>>이벤트/적립금문의</option>
								<option value="2" <c:if test="${dto.u_type==2 }">selected</c:if>>상품문의</option>
								<option value="3" <c:if test="${dto.u_type==3 }">selected</c:if>>배송문의</option>
								<option value="4" <c:if test="${dto.u_type==4 }">selected</c:if>>상품 누락 문의</option>
								<option value="5" <c:if test="${dto.u_type==5 }">selected</c:if>>기타문의</option>
							</c:otherwise>
						</c:choose>
					</select>
            </div>
         </div>
        <div class="contentParent">
	        <c:choose>
		        <c:when test="${dto.u_file != null }">
		        	<div class="fileUpload"><input type="button" value="파일삭제" onclick="fileDelete()"/></div>
		        	<div class="fileUpload"><input type="hidden" name="u_file" value="${dto.u_file }"/></div>
		        </c:when>
				<c:otherwise>
					<div class="fileUpload">파일 업로드 <input type="file" name="u_file"/></div>
				</c:otherwise>
			</c:choose>
			<div class="content"><textarea name="u_content" id="u_content" rows="" cols="">${dto.u_content }</textarea> </div>
		</div>
      </div>
      <div class="submitParent">
         <div class="submit"><input type="button" id="subBtn" value="수정"/></div>
         <div><a href="OneQuestionList?page=${param.page }&${type}"><input type="button" value="취소"/></a></div>
      </div>
   </div>
</form>

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script>
$("#subBtn").click(function(){
	if($("#title").val()=="" || $("#u_content").val()==""){
		alert("제목과 내용을 모두 입력해 주세요.")
	} else {
		$("#frm").submit()
	}
})
</script>
