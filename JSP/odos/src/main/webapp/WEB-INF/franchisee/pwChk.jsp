<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<style>
	.franchpw{
		 width: 1050px;
		 margin: 0 auto;
	}
 	.franchpw div{
	 	padding-top: 2px;
 	}
 	.franchpw input{
 		border: 1px white;
 	}
 	.franchpw button{
 		height: 30px;
 		width: 100px;
 		background-color: #88001b;
 		color: white;
 		border: 1px solid white;
 		border-radius: 3px;
 		margin-top: 10px;
 	}
 	.franchinput{
	 	margin: 0 auto;
	 	width: 190px;
	    height: 30px;
	    background-color: #fff;
	    border: 1px solid #88001b;
	    border-radius: 10px;
 	}
 	
 	@media screen and (max-width: 500px) {
 		.franchpw{
 			width: 412px;
 		}
 
 	}
 	
</style>


<form action="PwChkReg" method="post">
<div class="franchpw">
	<div class="franchinput"><div align="center"><input type="password" name="check_pw" placeholder="비밀번호 입력" /></div></div>
	<div align="center"><button type="submit" class="loginbox" >비밀번호 확인</button></div>
</div>
</form>
