<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
   
<form action="OneQuestionAnswerReg" method="post" enctype="multipart/form-data">
	<input type="hidden" name="page" value="${param.page }" />
   <div class="bigAll">
      <div class="centerPlz">
	         <div class="detailTitle">
	            <div><h2>1대1 상세보기</h2></div>
	         </div>
	         <div class="detailTop">
		         <div class="detailList">
		            <div class="title">제목</div>
		            <div class="titleWriter">${dto.u_title }</div>
		         </div>
		         <div class="deParent">
		            <div class="detailList">작성자</div>
		            <div class="titleWriter"><%=session.getAttribute("id") %></div>
		         </div>
		         
		         <div class="deParent">
		         	 <div class="detailList">문의 유형</div>
		         	 <div class="titleWriter">${dto.u_type }</div>
		         </div>
		         
		         <div class="deParent">
		            <div class="detailList">작성일</div>
		            <div class="titleWriter">${dto.u_date }</div>
		         </div>
		         
		         <div class="neyong">
		         	<div></div>
		         	<div>${dto.u_content }</div>
		         </div><p/>
		        <div>
		        </div>
      		</div>
      
         <div class="eventWriteTitle">
            <div><h2>문의 답변</h2></div>
         </div>          
         <input type="hidden" value="${dto.u_index }" name="u_index"/>
         <input type="hidden" value="2" name="u_state"/>    
            <div>
           		<input type="hidden" name="day" value="${dto.getU_dateStr() }"/>
            </div>
        <div class="contentParent">
			<div class="content"><textarea name="u_recontentArea" rows="" cols=""></textarea> </div>
		</div>
      <div class="submitParent">
         <div class="submit"><input type="submit" value="확인"/></div>
         <div><a href="OneQuestionList?page=${param.page }"><input type="button" value="목록"/></a></div>
      </div>
   </div>
   </div>
</form>
