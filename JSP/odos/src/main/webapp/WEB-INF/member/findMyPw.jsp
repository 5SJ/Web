<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script type="text/javascript" src="../jq/jquery-3.6.0.js"></script>
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
    color: #88001b ;
    background-color: rgb(255, 255, 255);
    border: 1px solid #88001b ;
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

.findPwBtn{
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
   	.inputAllWrapper{
      width: 400px;
      margin: 0 auto;
   }
   	.Line {
    	padding-bottom: 10px;
    	border-bottom: 2px solid rgb(51, 51, 51);
    	font-size: 14px;
    	color: rgb(102, 102, 102);
    	line-height: 17px;
    	text-align: right;
	}
	.inputBoxWrapper{
	    display: inline-flex;
	    width: 400px;
	    padding: 10px 0px;
   	}
   
   	.inputTitle{
      	width: 100px;
      	padding-top: 12px;
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
   	.inputTypeBox{
      width: 170px;
      height: 46px;
      padding: 0px 11px 1px 15px;
      border-radius: 4px;
      border: 1px solid rgb(221, 221, 221);
      font-weight: 400;
      font-size: 11px;
      line-height: 1.5;
      color: rgb(51, 51, 51);
      outline: none;
      box-sizing: border-box;
   }
   .buttonBox{
      width: 112px;
      margin-left: 8px;
   }
   .btn {
    	display: block;
    	padding: 0px 10px;
    	text-align: center;
    	overflow: hidden;
    	width: 84px;
    	height: 52px;
    	border-radius: 6px;
    	color: #88001b;
    	background-color: rgb(255, 255, 255);
    	border: 1px solid #88001b;
	}	
}
   
</style>

<!-- ?????? form?????? ?????? ???????????? ????????? ???????????? ??? ???  -->
<form action="NewMakePw" method="post" id="findMyPwForm">
<div class="allWrapper">
   <!-- ?????? -->
   <div class="findTitle">
      ???????????? ??????
   </div>
   
   <!-- ????????????,???????????? ?????? wrapper -->
   <div class="inputAllWrapper">
   
      <!-- ????????? -->
      <div class="Line">
         <span class="starSign">*</span> ??????????????????
      </div>
      
      <!-- ???????????? wrapper -->
      <div class="inputWrapper">       
         <div class="inputBoxWrapper">
            <div class="inputTitle">
               <label class="inputTitleFont">
                  ?????????<span class="starSign">*</span>
               </label>
            </div>
            
            <div class="inputBox_1">
               <div class="inputBox_2">
                  <div class="inputBox_3">
                     <input id="memberId" name="memberId" placeholder="???????????? ??????????????????" type="text" class="inputTypeBox" value="" >
                  </div>
               </div>
            </div>
            <div class="buttonBox ">
               
            </div>
                   
         </div>
        
        
         <!-- ????????? ?????? -->
         <div class="inputBoxWrapper">
            <div class="inputTitle ">
               <label class="inputTitleFont ">
                  ?????????<span class="starSign ">*</span>
               </label>
            </div>
            <div class="inputBox_1 ">
               <div class="inputBox_2 ">
                  <div class="inputBox_3 ">
                     <input id="m_email" name="m_email" placeholder="???: odos@odos.com" class="inputTypeBox" type="text" value="">
                  </div>
               </div>
            </div>
            
            <div class="buttonBox ">
               <button class="btn" id ="emailChkBtn" type="button">
                  <span class="btnTxt ">???????????? ??????</span>
               </button>
            </div>
         </div>
         
         <!-- ????????? ???????????? ?????? ????????????  -->
         <div class="inputBoxWrapper">
            <div class="inputTitle ">
               <label class="inputTitleFont ">
                  ???????????? ??????<span class="starSign ">*</span>
               </label>
            </div>
            <div class="inputBox_1 ">
               <div class="inputBox_2 ">
                  <div class="inputBox_3 ">
                     <input id="chk_codeNum" name="chk_codeNum" placeholder="?????? 6??????" class="inputTypeBox" type="text" value="">
                     <input type="hidden" id="codeNum" name="codeNum"> <!-- ????????? ?????? ????????? -->
                  </div>
               </div>
                <div class="warningMsgBox">
                  <p class="warningMsg" id="email_check"></p>
               </div>
            </div>
            
            <div class="buttonBox ">
               <button class="btn " type="button" onclick="emailCheck()">
                  <span class="btnTxt ">???????????? ??????</span>
               </button>
            </div>
         </div>
         
         <!-- ????????? ???????????? ?????? ????????????  ???-->
         <!-- ??? ????????? -->
      		<div class="Line"></div>	
      	
	      	 <div class="btnWrapper">
		         <button class="findPwBtn" id="findPwBtn" type="button" width="240" height="56" radius="3" onclick="findPwGo()">
		            <span class="btnTxt ">
		               ???????????? ??????
		            </span>
		         </button>
	      	</div>
        </div>      
   </div>
</div>   
</form>
<script type="text/javascript">
/////////////////////////////////////// ????????? ????????? ????????? ???????????????.
var sendEmailControl = false;
var sendEmailClear = false;
   
$("#emailChkBtn").click(function () {
	
	if($("#m_email").val()!="" && $("#memberId").val()!=""){
		$.ajax({
			url:"../ajax/IdEmailChk",
			type:"post",
			data: {m_email: $("#m_email").val()},
			dataType:"text",
			success:function(res){
				
				if($("#memberId").val()!=res){
					alert("???????????? ???????????? ???????????? ????????????.");
				}
				
				else{
					alert("??????????????? ?????????????????????.");
					
					$.ajax({
			          url: "../ajax/SendEmail",
			          type: "post",
			          data: {m_email: $("#m_email").val()},
			          dataType: "text",
			          success:function(res){ /* res??? ???????????? ?????? */
			             
			             /* ee -> emailConfirmNum (????????????) */
			             console.log(res);
			             $("#codeNum").val(res);
			            
			            /*  console.log($("#m_email").val() +"??? ????????? ???????????? ~ ")
			             if ($("#m_email").val() == null) {
			            	 alert("???????????? ??????????????????")					
						} */
			             
			             if(res=="emailExist"){ //????????? Email
			                alert("????????? ??????????????????.");
			             } 
			          },
			          error:function(res){
			             alert("??????????????????");
			          }
			       });
				}
			},
			error:function(res){
	            alert("??????????????????");
	        }
		});
	} else {
		alert("???????????? ???????????? ??????????????????.")
	}
	
});
   
	     
   function emailCheck() {
      if($("#chk_codeNum").val() == $("#codeNum").val() && $("#chk_codeNum").val()!=""){
         alert("??????????????? ????????????.")
         document.getElementById('email_check').innerHTML='????????????'
         document.getElementById('email_check').style.color='blue';
         
       $.ajax({
    	   url: "../ajax/FindId",
    	   type: "post",
    	   data:{m_email: $("#m_email").val()},
    	   dataType:"text",
    	   success:function(res){
    		   console.log(res);
    		},
      	 	error:function(res){
      		 
      	 	}
       }); 
      
      }else{
         alert("??????????????? ??????????????????.") 
      }
   }   
   /////////////////////////////////////////////////////////////
   
   
   // ???????????? ???????????? ?????? ?????? ??? ???????????? ????????? ??????????????? ????????? ??????
   
   function findPwGo() {
      
     if ($("#m_email").val()==''||$("#memberId").val()==''||$("#chk_codeNum").val()=='') {
       alert("????????? ?????? ????????? ????????? ????????????.");
      } else{
         
         $.ajax({
                url: "../ajax/FindId",
                type: "post",
                data:{m_email: $("#m_email").val()},
                dataType:"text",
                success:function(res){
                   console.log($("#memberId").val())
                   console.log(res)
                  if( $("#memberId").val() != res  || $("#chk_codeNum").val() != $("#codeNum").val() || $("#chk_codeNum").val()==null){
                     alert("???????????? ???????????? ???????????? ????????? ?????? ??????????????? ?????? ????????????.");              
                  } else {               
                     /* alert("????????????  ????????? ???????????????????????????."); */
                     
                      $("#findMyPwForm").submit();
                  }
                         
                },
                error:function(res){
                   
                }
             });   
      }
      
             
    }
	   
	   
   
   
    /* $("#findPwBtn").click(function () {
	   alert("???????????? ???????????? ????????? ???????????????.")
	   
   }  */
 

</script>