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
.loginPageWrapper {
    min-width: 1050px;
    margin-top: 90px;
    margin-bottom: 60px;
    background-color: rgb(255, 255, 255);
}
.loginTitle {
    font-weight: 800;
    font-size: 20px;
    line-height: 20px;
    text-align: center;
}
.loginFunWrapper {
    width: 340px;
    margin: 0px auto;
    letter-spacing: -0.6px;
}
.memInfoInputWrapper {
    margin-top: 30px;
}
.infoInputWrapper:first-of-type {
    margin-bottom: 5px;
}

.infoInputWrapper {
    padding-bottom: 12px;
}
.infoInput {
    position: relative;
    height: 48px;
}
.infoInputWrapper input {
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
.memInfoFindWrapper {
    display: flex;
    -webkit-box-pack: end;
    justify-content: flex-end;
    margin-top: 10px;
    font-size: 13px;
}
.memInfoFindBtn {
    color: rgb(51, 51, 51);
    cursor: pointer;
}
.joinBtnWrapper {
    margin-top: 28px;
}

.loginBtn {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 100%;
    height: 54px;
    border-radius: 3px;
    color: rgb(255, 255, 255);
    background-color: #88001b;
    border: 0px none;
    cursor: pointer;
}
.JoinBtnTxt {
    display: inline-block;
    font-size: 16px;
    font-weight: 500;
}
.joinBtnWrapper button:last-of-type {
    margin-top: 10px;
}
.JoinBtn {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    width: 100%;
    height: 54px;
    border-radius: 3px;
    color: #88001b;
    background-color: rgb(255, 255, 255);
    border: 1px solid #88001b;
    cursor: pointer;
}
.JoinBtnTxt {
    display: inline-block;
    font-size: 16px;
    font-weight: 500;
}
.slash {
    width: 1px;
    height: 10px;
    margin: 3px 6px 0px;
    background-color: rgb(51, 51, 51);
}

@media screen and (max-width: 570px){
.loginPageWrapper {
    min-width: 0px;
    margin-top: 90px;
    margin-bottom: 60px;
    background-color: rgb(255, 255, 255);
}
}
</style>

<div class="loginPageWrapper ">
   <div class="loginTitle ">
      로그인
   </div>
   
   <div class="loginFunWrapper e11xlc5p0">
      <form action="LoginReg" method="post" id="loginForm">
         <div class="memInfoInputWrapper ">
            <div class="infoInputWrapper ">
               <div class="infoInput ">
                  <input id="pid" name="pid" placeholder="아이디를 입력해주세요" type="text" class="input " value="">
               </div>
            </div>
            
            <div class="infoInputWrapper ">
               <div class="infoInput ">
                  <input id="pw" name="pw" placeholder="비밀번호를 입력해주세요" type="password" class="input " value="">
                  <input type="submit" style="display: none;"/>
               </div>
            </div>
         </div>
         
         <div class="memInfoFindWrapper ">
            <a class="memInfoFindBtn " href="FindMyId">
               아이디 찾기
            </a>
            
            <span class="slash ">
            </span>
            
            <a class="memInfoFindBtn " href="FindMyPw">
               비밀번호 찾기
            </a>
         </div>
         
         <div class="joinBtnWrapper ">
            <button class="loginBtn " type="button" height="54" radius="3" id="loginBtn">
               <span class="JoinBtnTxt ">
                  로그인
               </span>
            </button>
            
            <button class="JoinBtn" onclick="location.href='MemberJoinForm'" type="button" height="54" radius="3">
               <span class="JoinBtnTxt ">
                  회원가입
               </span>
            </button>
         </div>
      </form>
   </div>
</div>

<script type="text/javascript">
$("#loginBtn").click(function () {
   if($("#pid").val() == ""){
      alert("아이디를 입력해 주세요.");
      $("#pid").focus(); 
   }
   else if($("#pw").val()==""){
      alert("비밀번호를 입력해 주세요.");
      $("#pw").focus();    
   }
   else{
      $("#loginForm").submit();
   }
});



</script>