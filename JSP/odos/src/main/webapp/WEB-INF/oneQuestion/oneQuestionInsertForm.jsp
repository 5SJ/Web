<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript">
<%
if(session.getAttribute("id") == null) {%>
alert("로그인 후 이용해주세요")
location.href="Login"
<%}%>
</script>

<form id="frm" action="OneQuestionInsertReg" method="post" enctype="multipart/form-data">
	<div class="bigAll">
		<div class="centerPlz">
			<div class="detailTitle">
				<div><h2>1대1 문의하기</h2></div>
			</div>
			<div class="deParent">
				<div class="detailList">제목</div>
				<div class="titleWriter"><input type="text" id="title" name="u_title"/> </div>
			</div>
			<div class="deParent">
				<div class="detailList">작성자</div>
				<div class="titleWriter"><%=session.getAttribute("id") %></div>
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
								<option value="0">주문/결제/반품/교환문의</option>
								<option value="1">이벤트/적립금문의</option>
								<option value="2">상품문의</option>
								<option value="3">배송문의</option>
								<option value="4">상품 누락 문의</option>
								<option value="5">기타문의</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
			</div>
			<div class="contentParent">
				<div class="fileUpload">파일 업로드 <input type="file" name="u_file"/></div>
				<div class="content"><textarea id="u_content" name="u_content" style="resize:none;"></textarea> </div>
			</div>
		</div>
			<div class="submitParent">
			<div class="submit"><input type="button" id="subBtn" value="작성"/></div>
			<div><a href="OneQuestionList?page=${param.page }"><input type="button" value="목록"/></a></div>
		</div>
	</div>
</form>

<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script>
$("#subBtn").click(function(){
	if($("#title").val()=="" || $("#u_content").val()==""){
		alert("제목과 내용을 모두 입력해 주세요.");
	} else {
		$("#frm").submit()
	}
});
</script>