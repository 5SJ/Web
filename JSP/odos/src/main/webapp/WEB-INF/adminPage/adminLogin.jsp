<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
		.loginmainbox{
	       width: 350px;
	         margin: 0px auto;
	      
	   }
	   .loginbox{
	      width: 100%;
	       height: 54px;
	       font-size: 14px;
	      border-radius: 4px;
	         border: 1px solid rgb(221, 221, 221);
	       font-weight: 400;
	       margin-top: 12px;
	       margin-bottom: 12px;
	       
	   }
	   .bg{
	      background-color: #8d8b8b;
	      color:white;
	   }
	   
	   .loginbox:hover{
	      background-color: #681f1f;
	   }
	   
	   .span {
	         width: 1px;
	       height: 10px;
	       margin: 3px 6px 0px;
	       font-size: 10px;
	    }
    
    #a{
        width: 350px;
        display: flex;
          justify-content: flex-end; 
          font-size: 13px;
    }
    
    a{
    	text-decoration: none;
       	color: black;
    }
		</style>
<div align="center" class="loginmainbox">
   <font size = 5><b>관리자 로그인</b></font>
   <form action="LoginReg" method="post">
   <div><input type="text" name="pid" placeholder="아이디 입력" class="loginbox" /></div>
   <div><input type="password" name="pw" placeholder="비밀번호 입력" class="loginbox"/></div>
   <div>
      <button type="submit" class="loginbox bg" >로그인</button>
   </div>
   </form>
</div>