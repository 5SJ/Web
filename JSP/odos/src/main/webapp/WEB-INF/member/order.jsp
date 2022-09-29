<%@page import="dto.FranchiseeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dto.CartDTO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
LinkedHashMap clist = (LinkedHashMap)request.getAttribute("clist");
ArrayList<FranchiseeDTO> list = (ArrayList<FranchiseeDTO>)request.getAttribute("flist");
int total = 0;
String prodName = "";

for(Object key : clist.keySet()) {
   CartDTO cart = (CartDTO)key;
   ProductDTO product = (ProductDTO)clist.get(key);
   if(total == 0) {
      prodName = product.s_name;
      prodName += (clist.size()>1 ? " 외 "+(clist.size()-1)+"개 상품" : "");
   }
   total += cart.getCl_cnt() * product.getS_price();
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<style>
.mainWrapper{
	border-radius:8px;
	border: 2px;
}

.liq_title{	
	margin-top: 30px;
	justify-content: center;
}

.wrapperOfMapSearch {
   margin: auto;
   display: flex;
   justify-content: center;
   
}


/* pick */
.pickInner{
	margin:0;
	padding:0;
	border:0;
	font:inherit;
	vertical-align:baseline;
	widows:1;
	justify-content: center;
	-webkit-box-flex: 1;
    flex: 1;
}

.titleStoreName, .titleStoreAddr, .titleStoreNum, .titleStoreDay, .titleStoreTime, .titleStoreInfo{
	flex-basis: 160px;
	color:#757575;
}

/* pick 끝*/

table{
   margin: 0px auto;
   width: 1000px;
   
	padding:0;
	border:0;
	font:inherit;
	vertical-align:baseline;
	widows:1;
	justify-content: center;
	-webkit-box-flex: 1;
    flex: 1;  
}

td{
	padding:0;
	border:0;
	font:inherit;
	vertical-align:baseline;
	widows:1;
	justify-content: center;
	-webkit-box-flex: 1;
    flex: 1;  
}	

.wrapper{
   margin: 50px auto;
   width: 1000px;
   display: flex;
   justify-content: center;
}
.wrapperPoint{
   margin: 50px auto;
   width: 1000px;
   justify-content: center;
   border: 10px; 
}

.wrapperPointInner1{
	width: 700px;
   	border: 1px solid #000;
   	height: 50px;
	display: flex;
	z-index: 0;
}

.wrapperPointInner1 > div{
	margin: 0px 20px;
}

.wrapperPointInner2{
	width: 700px;
   	border: 1px solid #000;
   	height: 50px;
	display: flex;
	z-index: 0;
}

.wrapperPointInner2 > div{
	margin: 0px 20px;
}
.wrapper > div {
   width: 398px;
   border: 1px solid #000;
   height: 400px;
   z-index: 0;
}
.order{
   margin: 50px;
   display: flex;
}

/* 중간중간 라인 넣어주는거 */
.line{
	width:1000px;
	padding-bottom: 10px;
	border-bottom: 2px solid rgb(51, 51, 51);
	line-height: 17px;
	margin: auto;
   justify-content: center;
	
}


/* 지도 오른쪽에 가맹점 상세내용 */

#pick{		
	background-color: #44242433;
	border-radius:8px;
}

#mapSearch{
margin-top: -3px;
border: 1px solid ;
background-color: #88001b;
color: #ece6cc;
border-top-left-radius: 5px;
border-top-right-radius: 5px;
border-bottom-left-radius: 5px;
border-bottom-right-radius: 5px;  
}

#mapSearch:hover{
   color: white;
}

#order{
   width:150px;
   height:50px;   
   border: 1px solid ;
   background-color: #88001b;
   color: #ece6cc;
   border-top-left-radius: 5px;
   border-top-right-radius: 5px;
   border-bottom-left-radius: 5px;
   border-bottom-right-radius: 5px;  
}

#order:hover{
   color: white;
}

div{
	font: inherit;
	vertical-align: baseline;
	widows: 1;
}

li{
	
	margin-top: 5px;
	justify-content:center;
	padding: 0;
	border: 0;
	font: inherit;
	vertical-align: baseline;
	widows: 1;
	display: flex;
	align-items: flex-start;
	font-size: 14px;
	line-height: 2;
}

li > div {
	float: left;
}

h2{
	margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    vertical-align: baseline;
    widows: 1;
	display: block;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    
    font-size: 30px;   
}

span{
	position: relative;
	margin: 0;
	padding: 0;
	border: 0;
	font: inherit;
	widows: 1;
	box-sizing: border-box;
}

/* -------------------------------------------------------------------------- */
/*==반응형 웹 디자인 쪽==*/
@media screen and (max-width: 570px){

	.wrapper {
    margin: 50px auto;
    width: 400px;
    display: flex;
    justify-content: center;
	}
	
	.wrapper_map{
	margin: 50px auto;
    width: 350px;    
    display: flex;
    justify-content: center;
		
	}
	
	#map{
		height: 200px;
	} 
	
	.mainWrapper{
		border-radius:8px;
		border: 2px;
	}
	
	.liq_title{	
		margin-top: 30px;
		justify-content: center;
	}
	
	.wrapperOfMapSearch {
	   margin: auto;
	   display: flex;
	   justify-content: center;
	   
	}
	
	
	/* pick */
	.pickInner{
		margin:0;
		padding:0;
		border:0;
		font:inherit;
		vertical-align:baseline;
		widows:1;
		justify-content: center;
		-webkit-box-flex: 1;
	    flex: 1;
	}
	
	.titleStoreName, .titleStoreAddr, .titleStoreNum, .titleStoreDay, .titleStoreTime, .titleStoreInfo{
		flex-basis: 160px;
		color:#757575;
	}
	
	/* pick 끝*/
	
	table{
	   margin: 0px auto;
	   width: 1000px;
	   
		padding:0;
		border:0;
		font:inherit;
		vertical-align:baseline;
		widows:1;
		justify-content: center;
		-webkit-box-flex: 1;
	    flex: 1;  
	}
	
	td{
		padding:0;
		border:0;
		font:inherit;
		font-size:12px;
		vertical-align:baseline;
		widows:1;
		justify-content: center;
		-webkit-box-flex: 1;
	    flex: 1;  
	}	

	.wrapperPoint{
	   margin: 50px auto;
	   width: 400px;
	   justify-content: center;
	   border: 10px; 
	}
	
	.wrapperPointInner1{
		width: 400px;
	   	border: 1px solid #000;
	   	height: 50px;
		display: flex;
		z-index: 0;
	}
	
	.wrapperPointInner1 > div{
		margin: 0px 20px;
	}
	
	.wrapperPointInner2{
		width: 400px;
	   	border: 1px solid #000;
	   	height: 50px;
		display: flex;
		z-index: 0;
	}
	
	.wrapperPointInner2 > div{
		margin: 0px 20px;
	}
	.wrapper > div {
	   width: 398px;
	   border: 1px solid #000;
	   height: 400px;
	   z-index: 0;
	}
	.order{
	   margin: 50px;
	   display: flex;
	}
	
	
	/* 중간중간 라인 넣어주는거 */
	.line{
		width:400px;
		padding-bottom: 10px;
		border-bottom: 2px solid rgb(51, 51, 51);
		line-height: 17px;
		margin: auto;
	   justify-content: center;
		
	}
	
	
	/* 지도 오른쪽에 가맹점 상세내용 */
	
	#pick{		
		background-color: #44242433;
		border-radius:8px;
	}
	
	#mapSearch{
	margin-top: -3px;
	border: 1px solid ;
	background-color: #88001b;
	color: #ece6cc;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;  
	}

	#order{
	   width:150px;
	   height:50px;   
	   border: 1px solid ;
	   background-color: #88001b;
	   color: #ece6cc;
	   border-top-left-radius: 5px;
	   border-top-right-radius: 5px;
	   border-bottom-left-radius: 5px;
	   border-bottom-right-radius: 5px;  
	}

	
	/* 주문내역 td들 사이 떨어트릴라고 */
	#orderSheet{
		text-align: right;
	}
	
	#finishOrderSheet{
		border-top: 3px;
	}
	
	div{
		font: inherit;
		vertical-align: baseline;
		widows: 1;
	}
	
	ul{
		margin-left: -10px;
	}
	
	li{
		
		margin-top: 7px;
		margin-left: -3px;
		justify-content:center;
		padding: 0;
		border: 0;
		font: inherit;
		vertical-align: baseline;
		widows: 1;
		display: flex;
		align-items: flex-start;
		font-size: 11px;
		line-height: 2;
	}
	
	li > div {
		float: left;
	}
	
	
	h2{
		margin: 0;
	    padding: 0;
	    border: 0;
	    font: inherit;
	    vertical-align: baseline;
	    widows: 1;
		display: block;
	    margin-block-start: 0.83em;
	    margin-block-end: 0.83em;
	    margin-inline-start: 0px;
	    margin-inline-end: 0px;
	    
	    font-size: 30px;   
	}
	
	span{
		position: relative;
		margin: 0;
		padding: 0;
		border: 0;
		font: inherit;
		widows: 1;
		box-sizing: border-box;
	}
}
</style>

<meta charset="utf-8"/>

<!-- 픽업 매장 검색하는 곳  -->

<div class="mainWrapper">

<h2 class="liq_title" align="center">주문/결제</h2>


<div class="wrapperOfMapSearch">   
   <div>
         <input type="text" name="inputValue" id="inputValue" onchange="inputValueChange()" />
         <input type="submit" value="검색" id="mapSearch" />
   </div>
</div>
<div class="wrapper wrapper_map">
	<!-- 지도 map -->
	<div id="map" style="width:800px;height:500px;"></div>
	

</div>

<div class="wrapper">
	<div id="pick" style="width:800px; height:100%; user-select: auto;"> 	<!-- 지도에서 가맹점을 선택하면 들어갈 가맹점의 상세내용란 입니다. -->
	 <ul>
	 	<li>
		 	<div class="titleStoreName">매장이름</div>
		 	<div class="pickStoreName pickInner"></div>
	 	</li>
		<li>
			<div class="titleStoreAddr">매장주소</div>
			<div class="pickStoreAddr pickInner"></div>
		</li>
		<li>
			<div class="titleStoreNum">매장번호</div>
			<div class="pickStorePhone pickInner"></div>
		</li>
		<li>
			<div class="titleStoreDay">영업일</div>
			<div class="pickStoreDay pickInner"></div>
		</li>
		<li>
			<div class="titleStoreInfo">매장정보</div>
			<div class="pickStoreInfo pickInner"></div>
		</li>
	</ul>
	
	</div>
</div>
<!-- 라인 넣어주기 -->
<div class="line"></div>

<h2 align="center" style="margin-top:20px;">주문정보</h2>

<div class="wrapper">
	<table id="table" border="">
		<tr><td colspan="6" style="border:4px;"><font size="3px" color="#b21848"><b>주문내역</b></font></td></tr>
		<tr >
			<td id="orderSheet">No</td>
		    <td id="orderSheet">사진</td>
		    <td id="orderSheet">상품</td>
		    <td id="orderSheet">가격</td>
		    <td id="orderSheet" style="margin-left: 2px;">주문수량</td>
		    <td id="orderSheet">상품금액</td>
	   </tr>
	   <c:forEach items="${clist }" var="dto" varStatus="no">
	      <tr>
	         <td id="orderSheet">${no.index + 1 }</td>
	         <td id="orderSheet"><img alt="No_Image" src="../image/img_Product/${dto.value.s_image }" style="width:120px; height:120px;"></td>
	         <td id="orderSheet">${dto.value.s_name }</td>
	         <td id="orderSheet"><fmt:formatNumber value="${dto.value.s_price }" pattern="#,#00원"/></td>
	         <td id="orderSheet">${dto.key.cl_cnt }</td>
	         <td id="orderSheet"><fmt:formatNumber value="${dto.value.s_price * dto.key.cl_cnt }" pattern="#,#00원"/></td>
	      </tr>
	   </c:forEach>
	   <tr>
	      <td id="finishOrderSheet" colspan="5">주문합계</td>
	      <td id="orderSheet finishOrderSheet"><fmt:formatNumber value="<%=total  %>" pattern="#,#00원"/></td>
	   </tr>
	   
	   <tr>
	   		<td colspan="6"><hr/></td>
	   </tr>
	   
	   <tr><td colspan="6"><font size="3px" color="#b21848"><b>포인트 사용</b></font></td></tr>
	   <tr>
	   <td class colspan="5">나의 포인트</td>
	   <td><input type="number" id ="inputNm" name = "inputNm" value="${dto.m_point }" readonly/>원</td>
	   </tr>
	   <tr>
	   <td colspan="5"><span color="red">사용할 포인트</span></td>
	   <td><input type="number" id="inputPoint" name="inputPoint" value="0" onchange="takePoint()" onkeyup="takePoint()" />원</td>
	   </tr>
	   <tr><td colspan="6"><hr/></td></tr>
	   <tr><td colspan="6"><font size="3px" color="#b21848"><b>결제 상세</b></font></td></tr>
	   <tr>
	   <td colspan="5">주문금액</td>
	   <td><input type="number" id="AmountOfPayment" name="AmountOfPayment" value="<%=total %>"  readonly="readonly"/>원</td>
	   </tr>
	   <tr>
	   <td colspan="5">포인트 사용</td>
	   <td><input type="number" id ="usePoint" name="inputPoint" value="0" readonly/>원</td>
	   </tr>
	   <tr>
	   <td colspan="5">결제금액</td>
	   <td><input type="number" id="totalPrice" name="totalPrice" value="<%=total %>" readonly="readonly"/>원</td>
	   </tr>
	   <tr><td colspan="6"><hr/></td></tr>
	   <tr><td colspan="6"><font size="3px" color="#b21848"><b>포인트 적립</b></font></td></tr>
	   <tr>
	   <td colspan="5">구매시 적립되는 포인트</td>
	   <td><input type="number" id="addPoint" name="addPoint" value="<%=(int)(total/20) %>" readonly="readonly"/>원</td>
	   </tr>
	</table>
</div>

	<div class="wrapper">
		<button type="button" id="order">결제하기</button>
	</div>
</div>

<script>
var f_name
var mapClick = false;

$("#order").click(function () {
	if (!mapClick) {
		alert("픽업할 매장을 선택해주세요");
	} else if($("#totalPrice").val()==0) {
		location.href="OrderCompReg?name="+f_name+"&info=00000000&point="+$('#usePoint').val();
	} else{
		//location.href="OrderCompReg?name="+f_name+"&info=12345678&point="+$('#usePoint').val();   /* 결제없이 바로 주문완료 */
		   
		   var IMP = window.IMP;
		   IMP.init("imp53142356");
		   IMP.request_pay({
		      pg: 'html5_inicis',
		      pay_method: $("input[name=payMethod]:checked").val(),
		      /*
		      'samsung':삼성페이,
		      'card':신용카드,
		      'trans':실시간계좌이체,
		      'vbank':가상계좌,
		      'phone':휴대폰소액결제
		      */
		      merchant_uid: 'merchant_' + new Date().getTime(),
		      name: '<%=prodName %>',
		      amount: $("#totalPrice").val(),
		      buyer_email: '${dto.m_email }',
		      buyer_name: '${dto.m_name }',
		      buyer_tel: '010-1234-5678',
		      buyer_addr: '${dto.m_addr }',
		      buyer_postcode: '123-456',
		      m_redirect_url: "http://odos.o-r.kr/main/OrderCompReg?name="+f_name+"&point="+$('#usePoint').val()
		      /*
		      모바일 결제시, - 연동
		      결제가 끝나고 랜딩되는 URL을 지정
		      (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
		      */
		      }, function (rsp) {
		         console.log(rsp);
		         if (rsp.success) {
		            var msg = '결제가 완료되었습니다.';
		            msg += '고유ID : ' + rsp.imp_uid;
		            msg += '상점 거래ID : ' + rsp.merchant_uid;
		            msg += '결제 금액 : ' + rsp.paid_amount;
		            msg += '카드 승인번호 : ' + rsp.apply_num;
		            location.href="OrderCompReg?name="+f_name+"&imp_uid="+rsp.imp_uid+"&point="+$('#usePoint').val();
		         } else {
		            var msg = '결제에 실패하였습니다.';
		            alert(msg);
		         }
		      });
		}
   });
</script>


<!-- 지도 넣는 style 부분  (종현추가)-->
<style>
.customoverlay {position:relative;bottom:45px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;background:#fff;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay .title {display:block;width:auto;text-align:center;background:#fff;margin:0px 6px;font-size:11px;font-weight:500;}
.customoverlay:after {content:'';position:absolute;}
</style>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b65c630b20a88d8456994b96ae1b5c7f&libraries=services"></script>
<script>

// 1. 지도 생성
var geocoder = new kakao.maps.services.Geocoder();

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center: new kakao.maps.LatLng(37.5000942396267,127.02979915233708), // 지도의 중심좌표
	level: 5 // 지도의 확대 레벨
	};  

var map = new kakao.maps.Map(mapContainer, mapOption); 

var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';       // 마커이미지 주소
imageSize = new kakao.maps.Size(26, 30);                // 마커이미지의 크기
imageOption = {offset: new kakao.maps.Point(13, 30)};   // 마커의 좌표와 일치시킬 이미지 안에서의 좌표설정

var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);    

var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


// 2. 지도 중심을 내 주소로
geocoder.addressSearch('${dto.m_addr }', function(result, status) {
	if (status === kakao.maps.services.Status.OK) {
		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		map.setCenter(coords);

	} 
});    


//3. 지도에 가맹점 표시
<%for(FranchiseeDTO dto : list) {%>
	mapPicker('<%=dto.getF_id()%>', '<%=dto.getF_name()%>', '<%=dto.getF_addr() %>')
<%}%>

// 함수
function mapPicker(id, name, addr){
	geocoder.addressSearch(addr, function(result, status) {
		if (status === kakao.maps.services.Status.OK) {

			var markerTmp;      // 마커
			var customOverlay;  // 오버레이
			var contentStr;

			markerTmp = new daum.maps.Marker({
			    position: new daum.maps.LatLng(result[0].y, result[0].x),
			    title: name,
			    image: markerImage,
			    map:map
			});

			contentStr = "<span class='customoverlay' onclick=\"f_clickFunc('"+ id +"')\"><span class='title'>"+ name +"</span></span>";
			customOverlay = new kakao.maps.CustomOverlay({
			    map: map,
			    position: new daum.maps.LatLng(result[0].y, result[0].x),
			    content: contentStr,
			    xAnchor: 0.53,
			    yAnchor: 0.5
			});
		} 
	});
}

//4. 지도 검색
function inputValueChange(){
    var inputValue = document.getElementById('inputValue').value;
    console.log(inputValue)
   
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(inputValue, function(result, status) {

       // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

           var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new kakao.maps.Marker({
               map: map,
               position: coords
           });

           // 인포윈도우로 장소에 대한 설명을 표시합니다
           var infowindow = new kakao.maps.InfoWindow({
               content: '<div style="width:150px;text-align:center;padding:6px 0;">검색위치</div>'
               //content: '<div style="width:150px;text-align:center;padding:6px 0;">검색위치</div>'
           });
           infowindow.open(map, marker);

           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
       } 
   });       
    
}



function f_clickFunc(id){
	mapClick = true;
	console.log(mapClick)
	var pick = document.getElementById("pick")
	$.ajax({
		url: "../ajax/GetStore",
		type: "post",
		data: {f_id: id},
		dataType: "text",
		success:function(ee){
			pick.innerHTML = decodeURIComponent(ee.replaceAll("+"," "))
			f_name = id
		},
		error:function(ee){
			alert("매장정보 호출실패");
		}
	});
}

function takePoint() {
	if (Number($("#inputPoint").val()) > Number($("#inputNm").val()) || Number($("#inputPoint").val()) > Number($("#AmountOfPayment").val())) {
		if( Number($("#inputNm").val()) > Number($("#AmountOfPayment").val()) ) {
			$("#inputPoint").val($("#AmountOfPayment").val())
		} else {
			$("#inputPoint").val($("#inputNm").val())
		}
	}
	$('#inputPoint').val(Number($('#inputPoint').val()))
	$('#usePoint').val($('#inputPoint').val());
	$('#totalPrice').val($('#AmountOfPayment').val() - $('#inputPoint').val());
	$("#addPoint").val(Math.floor($('#totalPrice').val()*0.05));
} 

</script>
