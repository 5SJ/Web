<%@page import="java.util.concurrent.ThreadLocalRandom"%>
<%@page import="ajaxService.SendEmail"%>
<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>
<style>

.allWrapper{
	
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
	flex : 1 1 0%;
}
.inputBox_2{
	padding-bottom: 0px;
}
.inputBox_3{
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

.btnWrapper{
	display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    border-top: 1px solid rgb(247, 247, 247);
    padding: 40px 0px;
}

.warningMsgBox{
     padding: 10px 0px;
}
  
.warningMsg{
    font-size: 13px;
    color: rgb(240, 63, 64);
    margin-top: -4px;
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
}
@media screen and (max-width: 570px){
	.inputAllWrapper {
    	width: 400px;
    	margin: 0 auto;
	}
	.inputBoxWrapper {
    	display: inline-flex;
    	width: 400px;
    	padding: 10px 0px;
	}
	.inputTitle {
    	width: 95px;
    	padding-top: 12px;
	}
	.inputTitleFont {
    	font-size: 13px;
    	color: rgb(51, 51, 51);
    	line-height: 20px;
	}
	.inputTypeBox {
    	font-size: 12px;
	}
	.buttonBox {
    	width: 90px;
	}
	.buttonBox > button > span {
    	font-size: 12px;
	}
}	
</style>   

<form action="UserInfoChangeModifyReg" method="post" name="frm" id="userInfoChangeModify">
<input type="hidden" name="m_id" value="${mdto.m_id }"/>
<input type="hidden" name="m_point" value="${mdto.m_point }"/>
<input type="hidden" name="m_state" value="${mdto.m_state }"/>
<!-- 회원가입 전체 wrapper -->
<div class="allWrapper">
	<!-- 제목 -->
	<div class="titleName">
		개인 정보 수정
	</div>
	
	<!-- 입력사항,약관동의 버튼 wrapper -->
	<div class="inputAllWrapper">
		
		<!-- 입력사항 wrapper -->
		<div class="inputWrapper">
		
			<!-- id입력 -->
			<div class="inputBoxWrapper">
				<div class="inputTitle">
					<label class="inputTitleFont">
						아이디
					</label>
				</div>
				
				<div class="inputBox_1">
					<div class="inputBox_2">
						<div class="inputBox_3">
							<input id="memberId" name="m_id" type="text" class="inputTypeBox" value="${mdto.m_id }" readonly="readonly">
						</div>
					</div>
				</div>
				
				<div class="buttonBox">
					
				</div>
			</div>
			
			<!-- 비밀번호입력 -->
			<div class="inputBoxWrapper">
				<div class="inputTitle">
					<label class="inputTitleFont">
						새 비밀번호
					</label>
				</div>
				
				<div class="inputBox_1 ">
					<div class="inputBox_2 ">
						<div class="inputBox_3 ">
							<input id="m_pw" name="m_pw" placeholder="새 비밀번호를 입력해주세요" type="password" class="inputTypeBox" value="">
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
						새 비밀번호확인
					</label>
				</div>
				
				<div class="inputBox_1 ">
					<div class="inputBox_2 ">
						<div class="inputBox_3 ">
							<input id="m_pw2" name="m_pw2" placeholder="새 비밀번호를 한번 더 입력해주세요" class="inputTypeBox" type="password" value="">
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
						이름
					</label>
				</div>
				
				<div class="inputBox_1 ">
					<div class="inputBox_2 ">
						<div class="inputBox_3 ">
							<input id="m_name" name="m_name" placeholder="이름을 입력해 주세요" class="inputTypeBox" type="text" value="${mdto.m_name }">
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
			<div class="inputBoxWrapper">
				<div class="inputTitle ">
					<label class="inputTitleFont ">
						이메일
					</label>
				</div>
				<div class="inputBox_1 ">
					<div class="inputBox_2 ">
						<div class="inputBox_3 ">
							<!-- hidden_email과 m_email의 비교를 통해 동일한 값인 경우에는 인증번호를 보낼 수 있도록 만들기 위함. -->
							<input type="hidden" id="hidden_email" name ="hidden_email" value="${mdto.m_email }" />   
													
							<input id="m_email" name="m_email" placeholder="예: onedayoneshot@oneshot.com" class="inputTypeBox" type="text" value="${mdto.m_email }">
						</div>
					</div>
					
					<div class="warningMsgBox">
                  		<p class="warningMsg" id="emailMatchMsg"></p>
               		</div>
					
				</div>
				
				<div class="buttonBox ">
					<button class="btn " type="button" id = "emailChkBtn" onclick="emailSend()">
						<span class="btnTxt ">인증번호 발송</span>
					</button>
				</div>
			</div>
			
			<!-- 인증번호 확인란 -->
			<div class="inputBoxWrapper">
				<div class="inputTitle ">
					<label class="inputTitleFont ">
						인증번호 확인
					</label>
				</div>
				<div class="inputBox_1 ">
					<div class="inputBox_2 ">
						<div class="inputBox_3 ">
							<input id="chk_codeNum" name="chk_codeNum" placeholder="인증번호 입력" class="inputTypeBox" type="text" value="">
							<input type="hidden" name="codeNum" id="codeNum" />
						</div>
					</div>
					
					<div class="warningMsgBox">
                  		<p class="warningMsg" id="email_check"></p>
               		</div>
               		
				</div>
				
				<div class="buttonBox ">
					<button class="btn " type="button" id="emailNumChkBtn">
						<span class="btnTxt ">인증번호 확인</span>
					</button>
				</div>
			</div>
			
			<!-- 주소입력 -->
			<div class="inputBoxWrapper">
				<div class="inputTitle">
					<label class="inputTitleFont">
						주소
					</label>
				</div>
				
				<div class="inputBox_1 ">
					<div class="inputBox_2 ">
						<div class="inputBox_3 ">
							<input id="address" name="m_addr" placeholder="주소 검색을 해주세요" class="inputTypeBox" type="text" value="${mdto.m_addr }">
						</div>
					</div>
					
					<div class="warningMsgBox">
                  		<p class="warningMsg" id="email_check"></p>
               		</div>
					
				</div>
				
				<div class="buttonBox ">
					<button class="btn " type="button" id="findAddress">
						<span class="btnTxt ">주소검색</span>
					</button>
				</div>
			</div>
			
			<div id="wrap" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative">
           		<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
         	</div>
			
		</div>
		
		<!-- 줄 나누기 -->
		<div class="Line"></div>

		<!--가입버튼-->
		<div class="btnWrapper">
			<button class="submitBtn" id="memInfoChangeBtn" type="button" width="240" height="56" radius="3">
				<span class="btnTxt ">
					회원정보 수정
				</span>
			</button>
		</div>
		
	</div>
	
</div>
</form>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=268d5239ddac89134a5d4994a41ca76d&libraries=services"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

//1차 비밀번호 유효성검사
var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{10,16}$/; //A~Z a~z 0~9로 시작하는 4~12자리 비밀번호
var pwSpaceCheck = /[\s]/g;
$("#m_pw").keyup(function(){
	if(pwCheck.test($("#m_pw").val())){
	   document.getElementById('warningMsg').innerHTML='';
   }else if(pwSpaceCheck.test($("#m_pw").val())==true){
	   $("#warningMsg").html("공백이 포함되있습니다.");
	   $("#warningMsg").css("color","red");
	}else{
		$("#warningMsg").html("영문/숫자/특수문자(공백제외)만 허용, 2개이상 조합");
		$("#warningMsg").css("color","red");
   }
});

//2차 비밀번호 와 1차 비밀번호 확인
$("#m_pw2").keyup(function(){
   if($("#m_pw").val()==$("#m_pw2").val()){
      $("#pwMatchMsg").html("비밀번호가 일치합니다.");
      $("#pwMatchMsg").css("color","blue");
   }else if($("#m_pw2").val()==""){
	  $("#pwMatchMsg").html("비밀번호를 한번 더 입력해 주세요.");
	  $("#pwMatchMsg").css("color","red");
   }else{
      $("#pwMatchMsg").html("비밀번호가 일치하지 않습니다.");
      $("#pwMatchMsg").css("color","red");
   }
   
});

//사용자 이름 유효성 검사
var nameCheck= /^[가-힣]+$/;
$("#m_name").keyup(function () {
	if(nameCheck.test($("#m_name").val())){
		   document.getElementById('nameMatchMsg').innerHTML='';
	   }else if($("#m_name").val()==""){
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

///////////////////////////////////////////////////////////////////////////////
	

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
          
          document.getElementById("address").value = addr;
          
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

//이메일 인증쏴주는 곳
function emailSend() {
	if($("m_email").val()==""){
		alert("이메일을 입력해 주세요.");
	}
	else{
		$.ajax({
		      url:"../ajax/EmailChk",
		      type:"GET",
		      data:{m_email:$("#m_email").val(),hidden_email:$("#hidden_email").val()},
		      datatype:"text",
		      async:false,     //ajax 이후 다른 작업이 진행됨
		      success:function(email_res){
		                  
		         if(email_res=="emailExist"){ //중복된 ID
		               alert("중복된 이메일입니다.");
		         } else{ //사용가능한 ID
		        	 console.log(email_res)
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


/* function emailCheck() {
   if($("#chk_codeNum").val() == $("#codeNum").val()){
	  
      alert("인증번호가 맞습니다.")
      document.getElementById('email_check').innerHTML='인증완료'
      document.getElementById('email_check').style.color='blue';
      sendEmailClear = true;
      
   }else{
	   console.log($("#chk_codeNum").val() +",,,,," + $("#codeNum").val())
      alert("인증번호가 틀립니다. 다시 입력해주세요.")
      
   }
} */

///////////////////////가입하기 버튼 누를시 빈칸검사 + 가입신청////////////////////////////////////////

$("#memInfoChangeBtn").click(function () {
   //1차 비번관련 경고문(빈칸, 형식오류)
   if($("#m_pw").val()==""){
      alert("비밀번호를 입력해 주세요.");
      $("#m_pw").focus();
   }
   else if(!pwCheck.test($("#m_pw").val())){
	   alert("비밀번호 형식에 맞게 입력해 주세요.");
	   $("#m_pw").focus();
   }
   
   //2차 비번관련 경고문(빈칸, 1차 2차 불일치)
   else if($("#m_pw2").val()==""){
      alert("비밀번호 확인을 입력해 주세요.");
      $("#m_pw2").focus();
   }
   else if($("#m_pw").val()!=$("#m_pw2").val()){
	   alert("비밀번호 확인이 불일치 합니다");
	   $("#m_pw2").focus();
   }
   
   //이름관련 경고문(빈칸, 형식오류)
   else if($("#m_name").val()==""){
      alert("이름을 입력해 주세요.");
      $("#m_name").focus();
   }
   else if(!nameCheck.test($("#m_name").val())){
	   alert("이름를 형식에 맞게 입력해 주세요.");
	   $("#m_name").focus(); 
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
   else if($("#address").val()==""){
      alert("주소를 입력해 주세요.");
      $("#address").focus();
   }
   
   else{
      $("#userInfoChangeModify").submit();
   }
});
</script>