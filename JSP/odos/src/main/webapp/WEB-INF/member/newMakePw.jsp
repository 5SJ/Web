<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
   /* div{
      border: 1px solid black;
   } */
   .allWrapper{
      min-width: 1050px;
      margin-top: 50px;
      margin-bottom: 60px;
      background-color: #fff;
   }
   
   .findTitle{
      margin-bottom: 50px;
       font-size: 28px;
       line-height: 35px;
       font-weight: 500;
       text-align: center;
       letter-spacing: -1px;
       color: #333;
    }
    .Line{
       padding-bottom: 10px;
       border-bottom: 2px solid rgb(51, 51, 51);
       font-size: 12px;
       color: rgb(102, 102, 102);
       line-height: 17px;
       text-align: right;
    }
   .inputAllWrapper{
      width: 640px;
      margin: 0 auto;
   }
   
   .inputWrapper{
      padding 0px;
   }
   
   .inputBoxWrapper{
      display: inline-flex;
       width: 100%;
       padding: 10px 20px;
   }
   
   .inputTitle{
      width: 139px;
       padding-top: 12px;
   }
   .inputTitleFont{
      font-weight: 500;
         color: rgb(51, 51, 51);
       line-height: 20px;
   }
   .starSign{
      color : red;
   }
   .inputBox_1{
      flex : 1 1 0%;
   }
   .inputBox_2{
      padding-bottom: 0px;
   }
   .inputBox_3{
   	width: 400px;
      position: relative;
      height: 48px;
   }
   .inputTypeBox{
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
   .buttonBox{
      width: 120px;
       margin-left: 8px;
   }
   .buttonBox>button{
       height: 44px;
       border-radius: 3px;
   }
   .btn{
      display: block;
       padding: 0px 10px;
       text-align: center;
       overflow: hidden;
       width: 100%;
       height: 52px;
       border-radius: 6px;
       color: rgb(95, 0, 128);
       background-color: rgb(255, 255, 255);
       border: 1px solid rgb(95, 0, 128);
   }
   .btnTxt{
      display: inline-block;
          font-size: 16px;
       font-weight: 500;
   }
   
   .buttonBox > button > span {
       font-weight: 500;
       font-size: 14px;
   }
   
   .addrFindBtn{
      display: block;
       padding: 0px 10px;
       text-align: center;
       overflow: hidden;
       width: 100%;
       height: 44px;
       border-radius: 4px;
       color: rgb(95, 0, 128);
       background-color: rgb(255, 255, 255);
       border: 1px solid rgb(95, 0, 128);
   }
   
   .addrWaringTxt{
      display: block;
       margin-top: 10px;
       font-size: 12px;
       line-height: 18px;
       color: gray;
   }
   
   .agreeWrapper{
      padding: 0px;
   }
   
   .agreeBox{
      display: inline-flex;
       width: 100%;
       padding: 10px 0px 10px 20px;   
   }
   .agreeItemBox{
      display: flex;
       padding: 8px 0px;
       -webkit-box-pack: justify;
          justify-content: space-between;
       -webkit-box-align: center;
       align-items: center;
   }
   
   .agreeItemBox:first-of-type{
      align-items: flex-start;
       flex-direction: column;
       padding-top: 12px;
   }
   .allAgreeMsg{
      position: relative;
       display: flex;
       -webkit-box-align: center;
       align-items: center;
       vertical-align: top;
       line-height: normal;
       color: rgb(51, 51, 51);
       padding: 0px;
       font-weight: 500;
       font-size: 18px;
   }
   
   .agreeWarningTxt{
      font-size: 12px;
       color: rgb(102, 102, 102);
       padding-top: 4px;
       padding-left: 36px;   
   }
   
   .agreeItem_1{
      display: -webkit-box;
       display: -webkit-flex;
       display: -ms-flexbox;
       display: flex;
       -webkit-align-items: center;
       -webkit-box-align: center;
       -ms-flex-align: center;
       align-items: center;
   }
   
   .agreeItemTxt{
      position: relative;
       display: flex;
       -webkit-box-align: center;
       align-items: center;
       vertical-align: top;
       line-height: normal;
       color: rgb(51, 51, 51);
       padding: 0px;
       font-size: 14px;
   }
   
   .agreeType{
      padding-left: 5px;
       color: rgb(153, 153, 153);
   }
   
   .agreeDetail{
      padding-right: 22px;
      letter-spacing: 0px;
   }
   
   .marketing{
      position: relative;
       display: flex;
       -webkit-box-align: center;
       align-items: center;
       padding-left: 24px;
   }
   .marketingWay{
       padding: 14px 80px 9px 0px;
       position: relative;
       display: flex;
       -webkit-box-align: center;
       align-items: center;
       vertical-align: top;
       line-height: normal;
       color: rgb(51, 51, 51);
       font-size: 14px;
   }
   
   .marketingRes{
       margin-left: 36px;
       padding-left: 16px;
       font-size: 12px;
       color: rgb(95, 0, 128);
       line-height: 18px;
       letter-spacing: -0.5px;
   }
   .btnWrapper{
      display: flex;
       -webkit-box-pack: center;
       justify-content: center;
       border-top: 1px solid rgb(247, 247, 247);
       padding: 40px 0px;
   }
   
   .submitBtn{
      display: block;
       padding: 0px 10px;
       text-align: center;
       overflow: hidden;
       width: 240px;
       height: 56px;
       border-radius: 3px;
       color: rgb(255, 255, 255);
       background-color: #88001b ;
       border: 0px none;
   }
   
   .warningMsgBox{
      padding: 10px 0px;
   }
   
   .warningMsg{
      font-size: 13px;
       color: rgb(240, 63, 64);
         margin-top: -4px;
   }
@media screen and (max-width: 570px){
	.allWrapper{
      min-width: 400px;
      margin-top: 50px;
      margin-bottom: 60px;
      background-color: #fff;
   }	
   
   .inputBoxWrapper{
      	display: inline-flex;
       	width: 100%;
       	padding: 10px 0px;
   }
   
   .inputAllWrapper{
      width: 400px;
      margin: 0 auto;
   }
   
   .inputTitle {
	    width: 112px;
	    padding-top: 12px;
	}
   
   .inputTypeBox {
	    width: 267px;
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
}  
</style>

<form action="NewPasswordModify" method="post" id="joinForm">
<div class="allWrapper">
   <!-- 제목 -->
   <div class="findTitle">
      새로운 비밀번호를 입력해주세요
   </div>
   
   <!-- 입력사항,약관동의 버튼 wrapper -->
   <div class="inputAllWrapper">
   
      <!-- 경고문 -->
      <div class="Line">
         <span class="starSign">*</span> 필수입력사항
      </div>
      
      <!-- 입력사항 wrapper -->
      <div class="inputWrapper">
       	<input id="memberId" name="memberId" placeholder="아이디를 입력해주세요" type="hidden" class="inputTypeBox" value="<%=request.getParameter("memberId") %>" >	
         <!-- 비밀번호입력 -->
         <div class="inputBoxWrapper">
            <div class="inputTitle">
               <label class="inputTitleFont">
                  비밀번호<span class="starSign">*</span>
               </label>
            </div>
            
            <div class="inputBox_1 ">
               <div class="inputBox_2 ">
                  <div class="inputBox_3 ">
                     <input id="password" name="password" placeholder="비밀번호를 입력해주세요" type="password" class="inputTypeBox" value="">
                  </div>
               </div>
               
               <div class="warningMsgBox">
                  <p class="warningMsg" id="warningMsg"></p>
               </div>
            </div>

         </div>
         
         <!-- 비밀번호확인 -->
         <div class="inputBoxWrapper">
            <div class="inputTitle ">
               <label class="inputTitleFont ">
                  비밀번호확인<span class="starSign ">*</span>
               </label>
            </div>
            
            <div class="inputBox_1 ">
               <div class="inputBox_2 ">
                  <div class="inputBox_3 ">
                     <input data-testid="input-box" id="passwordConfirm" name="passwordConfirm" placeholder="비밀번호를 한번 더 입력해주세요" class="inputTypeBox" type="password" value="">
                  </div>
               </div>
               
               <div class="warningMsgBox">
                  <p class="warningMsg" id="pwMatchMsg"></p>
               </div>
               
            </div>
        
         </div>
 
 
      </div>
      
      <!-- 줄 나누기 -->
      <div class="Line"></div>
     
      <!--가입버튼-->
      <div class="btnWrapper">
         <button class="submitBtn" id="joinBtn" type="button" width="240" height="56" radius="3">
            <span class="btnTxt ">
               비밀번호 변경
            </span>
         </button>
      </div>
      
   </div>
   
</div>   
</form>
<script type="text/javascript">
//1차 비밀번호 유효성검사
var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/; //A~Z a~z 0~9로 시작하는 4~12자리 비밀번호
var pwSpaceCheck = /[\s]/g;
$("#password").keyup(function(){
	
	if(pwCheck.test($("#password").val())){
	   document.getElementById('warningMsg').innerHTML='';
   }else if(pwSpaceCheck.test($("#password").val())==true){
	   $("#warningMsg").html("공백이 포함되있습니다.");
	   $("#warningMsg").css("color","red");
	}else{
		$("#warningMsg").html("영문/숫자/특수문자(공백제외)만 허용, 2개이상 조합");
		$("#warningMsg").css("color","red");
   }
});

//2차 비밀번호 와 1차 비밀번호 확인
$("#passwordConfirm").keyup(function(){
   if($("#password").val()==$("#passwordConfirm").val()){
      $("#pwMatchMsg").html("비밀번호가 일치합니다.");
      $("#pwMatchMsg").css("color","blue");
   }else if($("#passwordConfirm").val()==""){
	  $("#pwMatchMsg").html("비밀번호를 한번 더 입력해 주세요.");
	  $("#pwMatchMsg").css("color","red");
   }else{
      $("#pwMatchMsg").html("비밀번호가 일치하지 않습니다.");
      $("#pwMatchMsg").css("color","red");
   }
   
});

  
   //가입하기 버튼 누를시 유효성 검사 + 가입신청
   $("#joinBtn").click(function () {
if($("#password").val()==""){
    alert("비밀번호를 입력하세요.");
} else if($("#passwordConfirm").val()==""){
    alert("비밀번호 확인을 입력하세요.");
} else if($("#password").val() != $("#passwordConfirm").val()) {
  	alert("비밀번호가 일치하지 않습니다..");
} else if(!pwCheck.test($("#password").val())){
  	alert("비밀번호 형식에 맞게 입력해 주세요.");
  	$("#password").focus();
} else if($("#password").val()!=$("#passwordConfirm").val()){
	   alert("비밀번호 확인이 불일치 합니다");
	   $("#passwordConfirm").focus();
} else{
    	  alert("비밀번호가 변경되었습니다.");
         $("#joinForm").submit(); 
      }
   });

</script>