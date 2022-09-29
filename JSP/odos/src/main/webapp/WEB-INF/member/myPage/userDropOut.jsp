<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript" src="../ggg/jquery-3.6.0.js"></script>

<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-size: 14px;
}

.memberDropWrapper {
   	width: 640px;
   	margin: 0px auto;
}
.memberDropTitle {
    padding: 50px 0px 51px;
    border-bottom: 2px solid rgb(51, 51, 51);
    font-weight: 500;
    font-size: 28px;
    letter-spacing: -1px;
    text-align: center;
}
.memberDropExplainWrapper {
    color: rgb(102, 102, 102);
    line-height: 22px;
}
.wrapperPadding {
    display: inline-flex;
    width: 100%;
    padding: 10px 0px 10px 20px;
}

.dropMenuTitleWrapper {
    width: 130px;
    padding-top: 12px;
}

.dropMenuTitle {
    font-weight: 500;
    color: rgb(51, 51, 51);
    line-height: 20px;
}

.dropWaringWrapper {
    flex: 1 1 0%;
}

.warningMsg {
    padding-top: 10px;
    padding-right: 10px;
}

.warningStrongMsg {
    display: block;
    padding: 19px 0px 12px;
    font-weight: normal;
    color: rgb(95, 0, 128);
}

ul{
	list-style-type: none;
}

.pwChkWrapper {
    display: inline-flex;
    width: 100%;
    padding: 10px 20px;
}

.pwInputWrapper {
    width: 332px;
    padding: 0px;
}

.pwInputWrapper_2 {
    position: relative;
    height: 48px;
}

.pwInputWrapper input {
    font-size: 14px;
}

.pwInput {
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

.resChkList {
    display: flex;
    flex-wrap: wrap;
    -webkit-box-align: center;
    align-items: center;
    margin-top: -3px;
}

.resChkListWrapper {
    position: relative;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    vertical-align: top;
    line-height: normal;
    color: rgb(51, 51, 51);
    width: 50%;
    padding: 13px 0px;
    font-size: 14px;
}

.adviceTextWrapper {
    position: relative;
    display: flex;
    flex-direction: column;
    height: 175px;
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(221, 221, 221);
    border-radius: 4px;
}

.adviceWrapper textarea {
    font-size: 14px;
}

.adviceTextArea {
    display: block;
    width: 100%;
    height: 100%;
    padding: 15px 16px;
    font-size: 16px;
    line-height: 21px;
    word-break: break-all;
    z-index: 1;
    background: none;
    border-radius: 4px;
    color: rgb(51, 51, 51);
    outline: none;
    resize: none;
    border: none;
}

.css-1ofzfyp {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 100%;
    padding: 15px 15px 32px;
}

.css-zgkz6w {
    padding: 0px 16px 13px;
    font-size: 12px;
    text-align: right;
}

.btnWrapper {
    display: flex;
    -webkit-box-pack: center;
    justify-content: center;
    padding: 40px 0px 60px;
}

.cancelBtn {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    height: 44px;
    color: rgb(95, 0, 128);
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(95, 0, 128);
    width: 120px;
    margin: 0px 4px;
    border-radius: 3px;
}

.cancelBtn > span {
    font-size: 14px;
}
.btnTxt {
    display: inline-block;
    font-size: 16px;
    font-weight: 500;
}

.submitBtn {
    display: block;
    padding: 0px 10px;
    text-align: center;
    overflow: hidden;
    height: 44px;
    color: rgb(255, 255, 255);
    background-color: #88001b;
    border: 0px none;
    width: 120px;
    margin: 0px 4px;
    border-radius: 3px;
}
.submitBtn > span {
    font-size: 14px;
}


/* 반응형 디자인 */
@media screen and (max-width: 570px) {
	.memberDropWrapper {
    	width: 400px;
    	margin: 0px auto;
	}
	.wrapperPadding {
    	display: inline-flex;
    	width: 400px;
    	padding: 0px;
	}	
	
	.pwChkWrapper {
	    display: inline-flex;
	    width: 100%;
	    padding: 10px 0px;
	}
	.dropMenuTitleWrapper {
    	width: 100px;
    	font-size:10px;
    	padding-top: 12px;
	}
	.waringRules{
		padding-inline-start: 0px;
	}
	
	.resChkListWrapper{
		width: 68%;
	}
	.adviceTextWrapper{
		width: 255px;	
	}
}
</style>

<div class="memberDropWrapper">
	<div class="memberDropTitle">회원탈퇴안내</div>
		<div class="memberDropExplainWrapper">
			<div class="wrapperPadding">
				<div class="dropMenuTitleWrapper ">
					<label class="dropMenuTitle ">회원탈퇴안내</label>
				</div>
				
				<div class="dropWaringWrapper ">
					<div class="warningMsg ">
						고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다. 
						불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.
						<strong class="warningStrongMsg ">
							아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.
						</strong>
						
						<ul class="waringRules" >
							<li >
								1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라 관리 됩니다.
							</li>
							<li >
								2. 탈퇴 시 고객님께서 보유하셨던 적립금은 모두 삭제 됩니다.
							</li>
							<li >
								3. 회원 탈퇴 후 30일간 재가입이 불가능합니다.
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<form action="MemberDropReg" id="memberDropForm">
			<div class="pwChkWrapper ">
			
				<div class="dropMenuTitleWrapper ">
					<label for="password" class="dropMenuTitle ">비밀번호 입력</label>
				</div>
				
				<div class="dropWaringWrapper ">
					<div class="pwInputWrapper ">
						<div class="pwInputWrapper_2 ">
							<input id="pwInput" name="pwInput" placeholder="현재 비밀번호를 입력해주세요" type="password" class="pwInput " value="">
						</div>
					</div>
				</div>
			</div>
			
			<!-- <div class="wrapperPadding ">
				<div class="dropMenuTitleWrapper ">
					<label class="dropMenuTitle ">
						무엇이 불편하였나요?
					</label>
				</div>
				
				<div class="dropWaringWrapper ">
					<div class="resChkWrapper ">
						<div class="resChkList ">
							<label class="resChkListWrapper ">
								<input name="reasonCodes" type="checkbox" class="resChkListItems ">
									고객서비스(상담,포장 등) 불만
							</label>
							<label class="resChkListWrapper ">
								<input name="reasonCodes" type="checkbox" class="resChkListItems ">
									배송불만
							</label>
							<label class="resChkListWrapper ">
								<input name="reasonCodes" type="checkbox" class="resChkListItems ">
									교환/환불/반품 불만
							</label>
							<label class="resChkListWrapper ">
								<input name="reasonCodes" type="checkbox" class="resChkListItems ">
									방문 빈도가 낮음
							</label>
							<label class="resChkListWrapper ">
								<input name="reasonCodes" type="checkbox" class="resChkListItems ">
									상품가격 불만
							</label>
							<label class="resChkListWrapper ">
								<input name="reasonCodes" type="checkbox" class="resChkListItems ">
									개인 정보유출 우려
							</label>
							<label class="resChkListWrapper ">
								<input name="reasonCodes" type="checkbox" class="resChkListItems ">
									쇼핑몰의 신뢰도 불만
							</label>
							<label class="resChkListWrapper ">
								<input name="reasonCodes" type="checkbox" class="resChkListItems ">
										쇼핑 기능 불만
							</label>
						</div>
					</div>
					
					<div class="adviceWrapper ">
						<div class="adviceTextWrapper ">
							<textarea id="reasonComment" placeholder="고객님의 진심어린 충고 부탁드립니다." inputmode="text" aria-label="textarea-message" name="reasonComment" class="adviceTextArea">
							</textarea>

						</div>
					</div>
				</div>
			</div> -->
			
			<div class="btnWrapper ">
				<button class="submitBtn"  id ="DropOutBtn" type="button" height="44">
					<span class="btnTxt ">
						탈퇴
					</span>
				</button>
			</div>
		</form>
</div>

<script type="text/javascript">
	$("#DropOutBtn").click(function () {
		if($("#pwInput").val()==""){
			alert("비밀번호를 입력하세요.");
		}
		else{
			$("#memberDropForm").submit();
		}
	});
</script>