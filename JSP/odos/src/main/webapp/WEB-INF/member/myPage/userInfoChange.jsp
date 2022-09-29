<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}
.pwChkWrapper {
    width: 820px;
}
.titleWrapper {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    padding: 10px 0px 37px;
}
.titleName {
    font-weight: 500;
    font-size: 24px;
    color: rgb(51, 51, 51);
    letter-spacing: -0.5px;
}
.pwChkWrapper_2 {
    width: 820px;
    margin: 0px auto;
}
.pwChkTitle {
    padding-bottom: 8px;
    font-weight: 500;
    font-size: 18px;
}
.warningMsg {
    padding-bottom: 20px;
    font-size: 12px;
    line-height: 1.5;
    color: rgb(102, 102, 102);
}
.memInfoWrapper {
    padding: 7px 60px 7px 120px;
    border-top: 2px solid rgb(51, 51, 51);
    border-bottom: 1px solid rgb(221, 221, 221);
}
.memInfoInputWrapper {
    display: inline-flex;
    width: 100%;
    padding: 10px 20px;
}
.IdPwTitle {
    width: 139px;
    padding-top: 12px;
}
.titleTxt {
    font-weight: 500;
    color: rgb(51, 51, 51);
    line-height: 20px;
}
.inputWrapper_1 {
    flex: 1 1 0%;
}
.inputWrapper_2 {
    padding: 0px;
}
.inputWrapper_3 {
    position: relative;
    height: 48px;
}
.inputWrapper_2 input {
    font-size: 14px;
}
.inputBox {
    width: 100%;
    height: 46px;
    padding: 0px 11px 1px 15px;
    border-radius: 4px;
    border: 1px solid rgb(221, 221, 221);
    font-weight: 400;
    font-size: 16px;
    line-height: 1.5;
    color: rgb(51, 51, 51);
    outline: none;
    box-sizing: border-box;
}
.waringSign {
    color: rgb(238, 106, 123);
}
/*확인버튼쪽*/
.btnWrapper {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    margin-top: 40px;
}
.submitBtn {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 240px;
    height: 56px;
    border-radius: 3px;
    color: rgb(255, 255, 255);
    background-color: #88001b;
    border: 0px none;
}

@media screen and (max-width: 570px){
.pwChkWrapper {
    width: 412px;
}
.pwChkWrapper_2 {
    width: 412px;
    margin: 0px auto;
}

.memInfoWrapper {
	padding: 0px;
    border-top: 2px solid rgb(51, 51, 51);
    border-bottom: 1px solid rgb(221, 221, 221);
}	
}
</style>

<div class="pwChkWrapper ">
	<div class="titleWrapper ">
		<h3 class="titleName ">
			개인 정보 수정
		</h3>
	</div>
	
	<div class="pwChkWrapper_2 ">
		<h4 class="pwChkTitle ">
			비밀번호 재확인
		</h4>
		
		<p class="warningMsg ">
			회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.
		</p>
		
		<form action="MyPagePwCheckReg" id="myPagePwCheck">
			<div class="memInfoWrapper ">
				<div class="memInfoInputWrapper ">
					<div class="IdPwTitle ">
						<label for="userId" class="titleTxt ">
							아이디
						</label>
					</div>
					
					<div class="inputWrapper_1 ">
						<div class="inputWrapper_2 ">
							<div class="inputWrapper_3 ">
								<input type="hidden" name="check_id" value="${mdto.m_id }"  />
								<input id="userId" name="userId" type="text" readonly="" class="inputBox " value="${mdto.m_id }">
							</div>
						</div>
					</div>
				</div>
				
				<div class="memInfoInputWrapper ">
					<div class="IdPwTitle ">
						<label for="password" class="titleTxt ">
							비밀번호
							<span class="waringSign ">
								*
							</span>
						</label>
					</div>
					
					<div class="inputWrapper_1 ">
						<div class="inputWrapper_2 ">
							<div class="inputWrapper_3 ">
								<input id="password" name="check_pw" placeholder="현재 비밀번호를 입력해주세요" type="password" class="inputBox " value="">
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="btnWrapper ">
				<button class="submitBtn" id="submitBtn" type="button" width="240" height="56" radius="3">
					<span class="btnTxt ">
						확인
					</span>
				</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
$("#submitBtn").click(function () {
	if($("#password").val() == ""){
		alert("비밀번호를 입력해 주세요.");
		$("#password").focus(); 
	}
	else{
		$("#myPagePwCheck").submit();
	}
});



</script>
