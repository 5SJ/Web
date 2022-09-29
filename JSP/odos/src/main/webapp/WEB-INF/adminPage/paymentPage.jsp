<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
	#cancelDiv{
		position: absolute;
		display: none;
		width: 100%;
		height: 100%;
		background-color: black;
		opacity: 0.3;
		z-index: 5;
	}
	
	#cancelForm{
		position: absolute;
		display: none;
		left: 35%;
		top: 20%;
		z-index: 10;
		background-color: white;
	}
	
	#cancelForm table{
		text-align: center;
	}
.payManageTitle{
	font-weight: 500;
	font-size: 30px;
}
table{
	border-collapse: collapse;
	width: 1200px;
	font-size: 12px;
	
}
td{
	padding:5px;
	text-align: center;
}
.allCancellForm{
	width: 300px;
}
</style>
<div id="cancelDiv">
</div>

<div id="cancelForm">
	<table class="allCancellForm">
		<tbody>
			<tr>
				<td>
					전액 취소
				</td>
			</tr>
			<tr>
				<td>
					<textarea placeholder="환불 사유를 입력해주세요." style="width:200px; height:100px; resize: none;"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" id="divSend" value="완료">
					<input type="button" id="divClose" value="취소">
				</td>
			</tr>
		</tbody>
	</table>
</div>

<p class="payManageTitle">결제 관리</p>
<table border="" style="text-align: center;">
	<tbody>
		<tr>
			<td>
				전체 : ${total}건
			</td>
			<td colspan="6">
				<input type="text" id="datepicker_start" readonly="readonly">
				<input type="text" id="datepicker_end" readonly="readonly">
				<input type="button" onclick="dateSearch('${status}')" value="검색">
			</td>
			<td>
				<select id="status">
					<option>------------</option>
					<option value="all">전체</option>
					<option value="ready">미결제</option>
					<option value="paid">결제완료</option>
					<option value="cancelled">결제취소</option>
					<option value="failed">결제실패</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>가맹점 고유번호<br>주문번호</td>
			<td>구분</td>
			<td>결제금액<br>(취소금액)</td>
			<td>결제대행사 승인번호<br>(카드사 승인번호)</td>
			<!-- <td>PG승인번호<br>(카드사 승인번호)</td> -->
			<td>결제 상세</td>
			<td>주문명<br>구매자(이름/이메일/휴대폰/주소)</td>
			<td>결제시각</td>
			<td>결제상태</td>
		</tr>
		<c:if test="${list.size() == 0 || list == null}">
		<tr>
			<td colspan="8">결제 정보가 없습니다.</td>
		</tr>
		</c:if>
		<c:if test="${list.size() > 0 && list != null}">
		<c:forEach items="${list}" var="pay">
		<tr>
			<td>
				${pay.getImpUid()}<br>${pay.getMerchantUid()}
			</td>
			<td>
				<!-- ${pay.getChannel()} -->
				<c:choose>
					<c:when test="${pay.getPayMethod() == 'card'}">카드결제</c:when>
					<c:when test="${pay.getPayMethod() == 'point' && pay.getEmbPgProvider() == 'kakaopay'}">카카오페이</c:when>
					<c:when test="${pay.getPayMethod() == 'samsung'}">삼성페이</c:when>
					<c:when test="${pay.getPayMethod() == 'trans'}">실시간계좌이체</c:when>
					<c:when test="${pay.getPayMethod() == 'vbank'}">가상계좌</c:when>
					<c:when test="${pay.getPayMethod() == 'phone'}">휴대폰소액결제</c:when>
				</c:choose>
			</td>
			<td>
				<fmt:formatNumber value="${pay.getAmount()}" pattern="#,#00원"/>
				<c:if test="${pay.getStatus() == 'cancelled'}">
				<br>(<fmt:formatNumber value="${pay.getCancelAmount()}" pattern="#,#00원"/>)
				</c:if>
			</td>
			<!-- <td>${pay.getPgProvider()}</td> -->
			<td>
				${pay.getPgTid()}
				<c:if test="${pay.getApplyNum() != null && pay.getApplyNum() != ''}">
				<br>(${pay.getApplyNum()})
				</c:if>
			</td>
			<td>
				<c:if test="${pay.getCardName() != null}">
				${pay.getCardName()}<br>
				</c:if>
				<c:choose>
					<c:when test="${pay.getCardQuota() == 0}">일시불</c:when>
					<c:otherwise>${pay.getCardQuota()}개월 할부</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pay.getCardName() != null && pay.getCardType() == 0}"><br>신용카드</c:when>
					<c:when test="${pay.getCardName() != null && pay.getCardType() == 1}"><br>체크카드</c:when>
				</c:choose>
			</td>
			<td>
				주문명 : ${pay.getName()}<br>
				${pay.getBuyerName()}/${pay.getBuyerEmail()}/${pay.getBuyerTel()}<br>
				<!-- [${pay.getBuyerPostcode()}]<br> -->
				<!-- ${pay.getBuyerAddr()} -->
			</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${pay.getStartedAtDate()}"/></td>
			<td>
				<c:choose>
					<c:when test="${pay.getStatus() == 'ready'}">
					 	미결제
					</c:when>
					<c:when test="${pay.getStatus() == 'paid'}">
						결제완료
					</c:when>
					<c:when test="${pay.getStatus() == 'cancelled'}">
						결제취소<br>
						${pay.getCancelReason()}
					</c:when>
					<c:when test="${pay.getStatus() == 'failed'}">
						결제실패
					</c:when>
				</c:choose>
				<br>
				<c:if test="${pay.getStatus() == 'paid'}">
				<input type="button" onclick="cancelAll('${pay.getImpUid()}','${pay.getAmount()}')" value="결제취소">
				<input type="button" onclick="cancel('${pay.getImpUid()}', '${pay.getAmount()*0.9}')" value="부분결제취소">
				</c:if>
			</td>
		</tr>
		</c:forEach>
		</c:if>
		<tr>
			<td colspan="9" style="text-align: center;">
				<c:forEach begin="1" end="${totalPage}" step="1" var="num">
					<c:choose>
						<c:when test="${num == nowPage}">[${num}]</c:when>
						<c:when test="${num != nowPage && status == null}"><a href="PayManagement?nowPage=${num}&from=${startDay}&to=${endDay}">${num}</a></c:when>
						<c:when test="${num != nowPage && status != null}"><a href="PayManagement?nowPage=${num}&status=${status}&from=${startDay}&to=${endDay}">${num}</a></c:when>
					</c:choose>
				</c:forEach>
			</td>
		</tr>
	</tbody>
</table>
<script>
	$("#status").on('change', function () {
		console.log($(this).val());
		if($(this).val() != $("#status")[0][0].value) {
			location.href="PayManagement?status="+$(this).val()+"&from=${startDay}&to=${endDay}";
		}
	});
	
	var id;
	
	function cancelAll(imp_uid) {
		$("#cancelForm table tbody textarea").val("");
		$("#cancelDiv").css("display", "block");
		$("#cancelForm").css("display", "block");
		
		console.log("전액취소 : "+imp_uid);
		
		id = imp_uid;
	}
	function cancel(imp_uid, amount) {
		console.log("부분취소 : "+imp_uid+", "+Math.floor(amount)+"원");
		location.href="PayCancelReg?imp_uid="+imp_uid+"&amount="+Math.floor(amount);
	}
	
	$("#divClose").on("click", function () {
		$("#cancelDiv").css("display", "none");
		$("#cancelForm").css("display", "none");
	});
	
	$("#divSend").on("click", function () {
		if($("#cancelForm table tbody textarea").val() == ""){
			alert("환불 사유를 입력해주세요.");
		}else{
			location.href="PayCancelReg?imp_uid="+id+"&msg="+($("#cancelForm table tbody textarea").val());
		}
	});
	
	
$(function() {
	fn_default_datepicker();
	console.log("${status}")
	for(var i=1;i<$("#status")[0].length;i++){
		if($("#status")[0][i].value == "${status}".trim()){
			$("#status")[0][i].selected = true;
		}
	}
});
        
function fn_default_datepicker()
{
    var start = $( "#datepicker_start" ).datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        //,minDate: "-6M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "0M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
    });
        
    var end = $( "#datepicker_end" ).datepicker({
        dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        //,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
        //,minDate: "-6M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "0M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
        //,defaultDate: "+1w"
      });
    
    //초기값을 오늘 날짜로 설정
    if('${startDay}' != "" && '${endDay}' != "") {
    	$('#datepicker_start').val('${startDay}');
    	$('#datepicker_end').val('${endDay}');
    } else {
		$('#datepicker_start').datepicker('setDate', '-3M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
		$('#datepicker_end').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)	
	}
}

$("#datepicker_start").on("change",function(e){
    $("#datepicker_end").datepicker( "option", "minDate", getDate( e.target ) );
    $("#datepicker_end").datepicker( "option", "maxDate", new Date(new Date(getDate(e.target)).setDate(getDate(e.target).getDate()+89)));
});

$("#datepicker_end").on("change",function(e){
    $("#datepicker_start").datepicker( "option", "maxDate", getDate( e.target ) );
    $("#datepicker_start").datepicker( "option", "minDate", new Date(new Date(getDate(e.target)).setDate(getDate(e.target).getDate()-89)));
});

function getDate( element ) {
    var date;
    var dateFormat = "yy-mm-dd";
    try {
      date = $.datepicker.parseDate( dateFormat, element.value );
    } catch( error ) {
      date = null;
    }
    return date;
}
	
	function dateSearch(status) {
		console.log("start : "+$('#datepicker_start').val()+", end : "+$('#datepicker_end').val());
		location.href="PayManagement?status="+status+"&from="+$('#datepicker_start').val()+"&to="+$('#datepicker_end').val();
	}
</script>
