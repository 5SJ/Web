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
   
   .titleName{
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
      margin-right: 20px;
      
   }
   .inputBox_2{
      padding-bottom: 0px;
   }
   .inputBox_3{
        width: 320px;
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
       color: #88001b;
       background-color: rgb(255, 255, 255);
       border: 1px solid #88001b;
       cursor: pointer;
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
       background-color: #88001b;
       border: 0px none;
       cursor: pointer;
   }
   
   .warningMsgBox{
      padding: 10px 0px;
   }
   
   .warningMsg{
      font-size: 13px;
       color: rgb(240, 63, 64);
         margin-top: -4px;
   }
/*==반응형 웹 디자인 쪽===========================================================*/
@media screen and (max-width: 570px){
   .allWrapper{
      min-width: 400px;
         margin-top: 50px;
         margin-bottom: 60px;
         background-color: #fff;
      }
      
      .titleName{
         margin-bottom: 0px;
          font-size: 28px;
          line-height: 35px;
          font-weight: 500;
          text-align: center;
          letter-spacing: -1px;
          color: #333;
    }
      .inputAllWrapper{
         width: 400px;
         margin: 0 auto;
      }
      .inputBoxWrapper{
         display: inline-flex;
          width: 400px;
          padding: 10px 0px;
      }
      .inputBox_1{
      flex : 1 1 0%;
      margin-right: 0px;
      
      }
      .inputBox_2{
      padding-bottom: 0px;
      }
      .inputBox_3{
        width: 10px;
      position: relative;
      height: 48px;
      }
   
   .inputTitle{
         width: 109px;
          padding-top: 12px;
      }
      .inputTypeBox {
       width: 165px;
       height: 46px;
       padding: 0px 11px 1px 15px;
       border-radius: 4px;
       border: 1px solid rgb(221, 221, 221);
       font-weight: 400;
       font-size: 12px;
       line-height: 1.5;
       color: rgb(51, 51, 51);
       outline: none;
       box-sizing: border-box;
   }
   
   .inputTitleFont {
       font-weight: 0;
       font-size: 14px;
       color: rgb(51, 51, 51);
       line-height: 20px;
   }
   
   .buttonBox {
       width: 111px;
       margin-left: 8px;
   }
   .btn {
       display: block;
       padding: 0px 10px;
       text-align: center;
       overflow: hidden;
       width: 82px;
       height: 52px;
       border-radius: 6px;
       color: #88001b;
       background-color: rgb(255, 255, 255);
       border: 1px solid #88001b;
   }
   
   .agreeBox {
       display: inline-flex;
       width: 400px;
       padding: 0px;
   }
   
   .agreeTitle{
      width: 63px;
       padding-top: 12px;
   }
   .agreeWarningTxt {
       font-size: 12px;
       color: rgb(102, 102, 102);
       padding-top: 4px;
       padding-left: 15px;
   }
   
   .allAgreeMsg{
      font-size: 12px;
   }
   
   .agreeWarningTxt{
      font-size: 10px;
   }
   
   .agreeItemTxt {
       position: relative;
       display: flex;
       -webkit-box-align: center;
       align-items: center;
       vertical-align: top;
       line-height: normal;
       color: rgb(51, 51, 51);
       padding: 0px;
       font-size: 12px;
   }
   .marketingRes{
      margin-left: 0px;
   }
   
      
         
}   
</style>

<form action="MemberJoinReg" method="post" id="joinForm">
<div class="allWrapper">
   <!-- 제목 -->
   <div class="titleName">
      회원가입
   </div>
   
   <!-- 입력사항,약관동의 버튼 wrapper -->
   <div class="inputAllWrapper">
   
      <!-- 경고문 -->
      <div class="Line">
         <span class="starSign">*</span> 필수입력사항
      </div>
      
      <!-- 입력사항 wrapper -->
      <div class="inputWrapper">
      
         <!-- id입력 -->
         <div class="inputBoxWrapper">
            <div class="inputTitle">
               <label class="inputTitleFont">
                  아이디<span class="starSign">*</span>
               </label>
            </div>
            
            <div class="inputBox_1">
               <div class="inputBox_2">
                  <div class="inputBox_3">
                     <input id="memberId" name="memberId" placeholder="아이디를 입력해주세요" type="text" class="inputTypeBox" value="" />
                  </div>
               </div>
               
               <div class="warningMsgBox">
                  <p class="warningMsg" id="idChkMsg"></p>
               </div>
               
               
            </div>
            
            <div class="buttonBox">
               <button class="btn" type="button">
                  <span class="btnTxt" id="idChkBtn">중복확인</span>
               </button>
            </div>
         </div>
         
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
            
            <div class="buttonBox ">
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
            
            <div class="buttonBox ">
            </div>
         </div>
         
         <!-- 이름입력 -->
         <div class="inputBoxWrapper">
            <div class="inputTitle ">
               <label class="inputTitleFont ">
                  이름<span class="starSign ">*</span>
               </label>
            </div>
            
            <div class="inputBox_1 ">
               <div class="inputBox_2 ">
                  <div class="inputBox_3 ">
                     <input id="name" name="name" placeholder="이름을 입력해 주세요" class="inputTypeBox" type="text" value="">
                  </div>
               </div>
               
               <div class="warningMsgBox">
                  <p class="warningMsg" id="nameMatchMsg"></p>
               </div>
               
            </div>
            
            <div class="buttonBox ">
            </div>
         </div>
         
         <!-- 이메일 입력 -->
         <!-- hidden_email과 m_email의 비교를 통해 동일한 값인 경우에는 인증번호를 보낼 수 있도록 만들기 위함. -->
      <input type="hidden" id="hidden_email" name ="hidden_email" value="${mdto.m_email }" />   
         <div class="inputBoxWrapper">
            <div class="inputTitle ">
               <label class="inputTitleFont ">
                  이메일<span class="starSign ">*</span>
               </label>
            </div>
            <div class="inputBox_1 ">
               <div class="inputBox_2 ">
                  <div class="inputBox_3 ">
                     <input id="m_email" name="m_email" placeholder="예: onedayoneshot@oneshot.com" class="inputTypeBox" type="text" value="">
                  </div>
               </div>
               
               <div class="warningMsgBox">
                  <p class="warningMsg" id="emailMatchMsg"></p>
               </div>
               
            </div>
            
            <div class="buttonBox ">
               <button class="btn" id ="emailChkBtn" type="button" onclick="emailSend()">
                  <span class="btnTxt ">인증번호 발송</span>
               </button>
            </div>
         </div>
         
         <!-- 이메일 인증번호 확인 종현추가  -->
         <div class="inputBoxWrapper">
            <div class="inputTitle ">
               <label class="inputTitleFont ">
                  이메일 확인<span class="starSign ">*</span>
               </label>
            </div>
            <div class="inputBox_1 ">
               <div class="inputBox_2 ">
                  <div class="inputBox_3 ">
                     
                     <input id="chk_codeNum" name="chk_codeNum" placeholder="숫자 6자리" class="inputTypeBox" type="text" value="">
                     <input type="hidden" id="codeNum" name="codeNum"> <!-- 숨겨서 비번 맞추기 -->
                  </div>
               </div>
               
               <div class="warningMsgBox">
                  <p class="warningMsg" id="email_check"></p>
               </div>
            </div>
            
            <div class="buttonBox ">
               <button class="btn" id = "emailNumChkBtn" type="button">
                  <span class="btnTxt ">인증번호 확인</span>
               </button>
            </div>
         </div>
         
         <!-- 이메일 인증번호 확인 종현추가  끝-->
             
         <!-- 주소입력 -->
         <div class="inputBoxWrapper">
            <div class="inputTitle">
               <label class="inputTitleFont">
                  주소<span class="starSign">*</span>
               </label>
            </div>
            
            <div class="inputBox_1 ">
               <div class="inputBox_2 ">
                  <div class="inputBox_3 e1uzxhvi3">
                     <input id="numberAddress" name="address" placeholder="주소를 검색해 주세요" type="text" readonly="" class="inputTypeBox" value="">
                  </div>
               </div>
               <span class="addrWaringTxt">
                  배송지에 따라 픽업매장 정보가 달라질 수 있습니다.
               </span>
            </div>
            
            
            <div class="buttonBox">
               <button class="btn" type="button" id="findAddress">
                  <span class="btnTxt">주소 검색</span>
               </button>
            </div>
         </div>
         
         <div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
                  <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
         </div>
         
      </div>
      
      <!-- 줄 나누기 -->
      <div class="Line"></div>
      
      <!-- 이용약관동의 wrapper -->
      <div class="agreeWrapper"> 
         <div class="agreeBox">
         
            <!-- 제목 -->
            <div class="agreeTitle">
               <label class="inputTitleFont">
                  이용약관동의
                  <span class="starSign">*</span>
               </label>
            </div>
            
            <!-- 이용약관동의서Wrapper -->
            <div class="inputBox_1">
               <div class="agreeItemBox">
                  <label class="allAgreeMsg" for="TermsAgreeAll">
                     <input id="TermsAgreeAll" type="checkbox" class="agreeChkBox">
                           전체 동의합니다.
                  </label>
                  <p class="agreeWarningTxt">선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</p>
               </div>
               
               <div class="agreeItemBox ">
                  <div class="agreeItem_1 ">
                     <label class="agreeItemTxt " for="RequiredTermsCondition">
                        <input id="RequiredTermsCondition" type="checkbox" class="chk ">
                              이용약관 동의
                     </label>
                     <span class="agreeType ">(필수)</span>
                  </div>
                  <a class="agreeDetail ">약관보기</a>
               </div>
               
               <div class="agreeItemBox ">
                  <div class="agreeItem_1 ">
                     <label class="agreeItemTxt " for="RequiredTermsOfPrivacy">
                        <input id="RequiredTermsOfPrivacy" type="checkbox" class="chk ">
                              개인정보 수집∙이용 동의
                     </label>
                     <span class="agreeType ">(필수)</span>
                  </div>
                  <a class="agreeDetail ">약관보기</a>
               </div>
               
               <div class="agreeItemBox ">
                  <div class="agreeItem_1 ">
                     <label class="agreeItemTxt " for="OptionalTermsOfPrivacy">
                        <input id="OptionalTermsOfPrivacy" type="checkbox" class="chk ">
                              개인정보 수집∙이용 동의
                     </label>
                     <span class="agreeType ">(선택)</span>
                  </div>
                  <a class="agreeDetail ">약관보기</a>
               </div>
               
               <div class="css-ob6kg2 ">
                  <div class="agreeItem_1 ">
                     <label class="agreeItemTxt " for="SignupEventAll">
                        <input id="SignupEventAll" type="checkbox" class="chk ">
                              할인쿠폰 등 혜택/정보 수신 동의
                     </label>
                     <span class="agreeType ">(선택)</span>
                  </div>
                  
                  <div class="marketing ">
                     <label class="marketingWay " for="OptionalTermsOfSms">
                        <input id="OptionalTermsOfSms" type="checkbox" class="chk ">
                              email
                     </label>
                  </div>
                  
                  <div class="marketing ">
                     <p class="marketingRes ">
                        동의 시 구매 금액의 [5%적립]
                     </p>
                  </div>
               </div>
               
               <!-- 나이동의 -->
               <div class="agreeItemBox ">
                  <div class="agreeItem_1 ">
                     <label class="agreeItemTxt " for="RequiredSignupAge">
                        <input id="RequiredSignupAge" type="checkbox">
                              본인은 만 19세 이상입니다.
                     </label>
                     <span class="agreeType ">
                        (필수)
                     </span>
                  </div>
               </div> <!-- 나이동의 -->
               
            </div>
            
         </div>
         
      </div> <!-- 이용약관 wrapper -->
      
      <!--가입버튼-->
      <div class="btnWrapper">
         <button class="submitBtn" id="joinBtn" type="button" width="240" height="56" radius="3">
            <span class="btnTxt ">
               가입하기
            </span>
         </button>
      </div>
      
   </div>
   
</div>   
</form>
<script type="text/javascript">

///////////////////////////////////////////////////////////////////////////
//id 유효성검사
var idCheck= /^[a-zA-Z0-9]{6,16}$/;
$("#memberId").keyup(function () {
   if(idCheck.test($('#memberId').val())){
      document.getElementById('idChkMsg').innerHTML='';
   }
   else{
      $("#idChkMsg").html("6자 이상 16자 이하의 영문 혹은 영문과 숫자를 조합");
       $("#idChkMsg").css("color","red");
   }
});
var idchk = false;
//아이디 중복검사
$("#idChkBtn").click(function() {
   $.ajax({
      url:'<c:url value="/ajax/IdChk"/>',
      type:"GET",
      data:{memberId:$("#memberId").val()},
      datatype:"text",
      async:false,     //ajax 이후 다른 작업이 진행됨
      success:function(res){
         if($("#memberId").val()!="" && idCheck.test($('#memberId').val())){
         
            if(res=="exist"){ //중복된 ID
               $("#idChkMsg").html("중복된 아이디입니다.");
               $("#idChkMsg").css('color','red');
               idchk = false;
            }
            else{ //사용가능한 ID
               $("#idChkMsg").html("사용가능한 아이디입니다.");
               $("#idChkMsg").css('color','green');
               idchk = true;
            }
         }else if(!idCheck.test($('#memberId').val())) {
            alert("아이디를 형식에 맞게 입력 해주세요.")
            idchk=false;
         }
         
         else{
            alert("아이디를 입력해 주세요!")
            idchk=false;
         }   
      },
      error:function(res){
      }
   })
});

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
      $("#warningMsg").html("영문/숫자/특수문자(공백제외)의 조합으로 10자 이상");
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

//사용자 이름 유효성 검사
var nameCheck= /^[가-힣]+$/;
$("#name").keyup(function () {
   if(nameCheck.test($("#name").val())){
         document.getElementById('nameMatchMsg').innerHTML='';
      }else if($("#name").val()==""){
         $("#nameMatchMsg").html("이름을 입력 해주세요.");
         $("#nameMatchMsg").css("color","red");
      }else{
         $("#nameMatchMsg").html("한글 이름만 입력 해주세요.");
         $("#nameMatchMsg").css("color","red");
      }
});

//사용자 이메일 유효성검사
var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
$("#m_email").keyup(function () {
   if(emailCheck.test($("#m_email").val())){
      document.getElementById('emailMatchMsg').innerHTML='';
   }else if($("#m_email").val()==""){
      $("#emailMatchMsg").html("이메일을 입력해 주세요.");
      $("#emailMatchMsg").css("color","red");
   }else{
       $("#emailMatchMsg").html("이메일 형식으로 입력 해주세요.");
       $("#emailMatchMsg").css("color","red");
   }
});
//////////////////////////////////////////////////////////////////////////
/////////////////////////////////////// 이메일 인증에 관련된 항목입니다.
var sendEmailControl = false;
var sendEmailClear = false;

function emailSend() {
   if($("#m_email").val()==""){
      alert("이메일을 입력해 주세요.")
   }else if(!emailCheck.test($("#m_email").val())){
      alert("이메일을 형식에 맞게 입력해 주세요.");
   }
   else{
      $.ajax({
         
         url:'<c:url value="/ajax/EmailChk"/>',
         type:"GET",
         data:{m_email:$("#m_email").val(), hidden_email:$("#hidden_email").val()},
         datatype:"text",
         async:false,     //ajax 이후 다른 작업이 진행됨
         success:function(email_res){
                     
            if(email_res=="emailExist"){ //중복된 ID
                  alert("중복된 이메일입니다.");
            } else{ //사용가능한 ID
               alert("인증번호를 발송하였습니다.");
               sendEmailControl = true
               
               if (sendEmailControl) {
                  /* ajax로 이메일과 이름을 받아서 보냄 */
                  $.ajax({
                     url: "../ajax/SendEmail",
                     type: "post",
                     data: {m_email: $("#m_email").val(), p_name: $("#p_name").val()},
                     dataType: "text",
                     success:function(res){
                        
                        /* ee -> emailConfirmNum (인증번호) */
                        console.log(res);
                        $("#codeNum").val(res);
                        
                        if(res=="emailExist"){ //중복된 Email
                           alert("중복된 이메일입니다.");
                        } 
                     },
                     error:function(res){
                        alert("메일발송실패");
                     }
                  });
                  sendEmailControl = false;   
               }
            }         
         },
         error:function(res){
         }
      })
   }
    
}
   
$("#emailNumChkBtn").click(function () {
   if($("#chk_codeNum").val() == $("#codeNum").val()){
         alert("인증번호가 맞습니다.");
         document.getElementById('email_check').innerHTML='인증완료';
         document.getElementById('email_check').style.color='blue';
         sendEmailClear = true;
         
   }else{
      alert("인증번호가 틀립니다. 다시 입력해주세요.");
      document.getElementById('email_check').innerHTML='인증번호 불일치';
      document.getElementById('email_check').style.color='red';
      sendEmailClear = false;
      
   }
});  
///////////////////////////////////////////////////////////////////////////
//전체동의 누르면 모든 약관 한번에 동의
$('.agreeChkBox').click(function(){
   $('.chk').prop('checked', this.checked);
});



//주소 찾기 버튼 클릭
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
   // iframe을 넣은 element를 안보이게 한다.
   element_wrap.style.display = 'none';
}

$("#findAddress").click(function(){
   // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
       oncomplete: function(data) {
          // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수
          
          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
             addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
             addr = data.jibunAddress;
          }
          
          document.getElementById("numberAddress").value = addr;
          
          // iframe을 넣은 element를 안보이게 한다.
          // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
          element_wrap.style.display = 'none';
          
          // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
          document.body.scrollTop = currentScroll;
       },
       // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
       /* onresize : function(size) {
          element_wrap.style.height = size.height+'px';
       }, */
       width : '100%',
       height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
});

//가입하기 버튼 누를시 빈칸검사 + 가입신청

$("#joinBtn").click(function () {
   //아이디관련 경고문(빈칸, 형식오류, 중복확인)
   console.log(idchk);
   if($("#memberId").val()==""){
      alert("아이디를 입력해 주세요.");
      $("#memberId").focus();
   }
   else if(!idchk){
      alert("아이디 중복검사를 해 주세요.");
      $("#memberId").focus();
   }
   else if(!idCheck.test($('#memberId').val())){
      alert("아이디를 형식에 맞게 입력해 주세요.")
      $("#memberId").focus();
   }
   
   //1차 비번관련 경고문(빈칸, 형식오류)
   else if($("#password").val()==""){
      alert("비밀번호를 입력해 주세요.");
      $("#password").focus();
   }
   else if(!pwCheck.test($("#password").val())){
      alert("비밀번호 형식에 맞게 입력해 주세요.");
      $("#password").focus();
   }
   
   //2차 비번관련 경고문(빈칸, 1차 2차 불일치)
   else if($("#passwordConfirm").val()==""){
      alert("비밀번호 확인을 입력해 주세요.");
      $("#passwordConfirm").focus();
   }
   else if($("#password").val()!=$("#passwordConfirm").val()){
      alert("비밀번호 확인이 불일치 합니다");
      $("#passwordConfirm").focus();
   }
   
   //이름관련 경고문(빈칸, 형식오류)
   else if($("#name").val()==""){
      alert("이름을 입력해 주세요.");
      $("#name").focus();
   }
   else if(!nameCheck.test($("#name").val())){
      alert("이름를 형식에 맞게 입력해 주세요.");
      $("#name").focus(); 
   }
   
   //이메일관련 경고문(빈칸, 형식오류)
   else if($("#m_email").val()==""){
      alert("이메일을 입력해 주세요.");
      $("#m_email").focus();
   }
   else if(!emailCheck.test($("#m_email").val())){
      alert("이메일을 형식에 맞게 입력해 주세요.");
      $("#m_email").focus();
   }
   
   //이메일 인증관련 경고문(빈칸 인증오류)
   else if($("#chk_codeNum").val()==""){
      alert("인증번호를 입력해 주세요.")
      $("#chk_codeNum").focus();
   }
  else if(!sendEmailClear){
      alert("인증번호를 확인을 다시 해주세요.")
      $("#chk_codeNum").focus();
   }
   
   //주소관련 경고문(빈칸)
   else if($("#numberAddress").val()==""){
      alert("주소를 입력해 주세요.");
      $("#numberAddress").focus();
   }
   
   //이용약관 경고문(필수 사항 미선택시)
   else if($("#RequiredTermsCondition").is(":checked")==false){
      alert("이용약관에 동의해 주세요.");
   }
   else if($("#RequiredTermsOfPrivacy").is(":checked")==false){
      alert("개인정보 수집 및 이용동의에 동의해주세요.");
   }
   else if($("#RequiredSignupAge").is(":checked")==false){
      alert("나이확인에 체크해주세요.");
   }
   else{
      $("#joinForm").submit();
   }
});

</script>