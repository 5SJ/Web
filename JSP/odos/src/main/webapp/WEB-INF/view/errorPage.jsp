<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>

<style>
*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}
.errorPageWrapper {
    min-width: 1050px;
    margin-top: 90px;
    margin-bottom: 60px;
    background-color: rgb(255, 255, 255);
}

.errorTitle {
    font-weight: 800;
    font-size: 20px;
    line-height: 20px;
    text-align: center;
}
.errorFunWrapper {
    width: 340px;
    margin: 0px auto;
    letter-spacing: -0.6px;
}
.errorInputWrapper {
    margin-top: 30px;
}
.inputWrapper:first-of-type {
    margin-bottom: 5px;
}

.inputWrapper {
    padding-bottom: 12px;
}
.mainButton {
    position: relative;
    height: 48px;
}
.inputWrapper input {
    height: 54px;
    font-size: 14px;
}
.input {
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

@media screen and (max-width: 570px){
.errorPageWrapper {
    min-width: 0px;
    margin-top: 90px;
    margin-bottom: 60px;
    background-color: rgb(255, 255, 255);
}
}
</style>

<div class="errorPageWrapper">
	<div class="errorTitle">
		잘못된 접근입니다.
	</div>
	
	<div class="errorFunWrapper">
		<div class="errorInputWrapper">
			<div class="inputWrapper">
				<div class="mainButton">
					<input type="button" class="input " value="메인으로 이동" onclick="location.href='../main/MainPage'">
				</div>
			</div>
		</div>
	</div>
</div>
