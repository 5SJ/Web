<%@page import="dto.ProductDTO"%>
<%@page import="dto.CartDTO"%>
<%@page import="java.util.LinkedHashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<script src="../jq/jquery-3.6.0.js"></script>
<script src="../jq/jquery-ui-1.13.2.custom/jquery-ui.min.js"></script>
<script type="text/javascript" src="../bootstrap/js/bootstrap.bundle.min.js" ></script>
<%
// 남의아이디 못보게
%>
<style>
table{
    margin-top: 30px;
    width: 100%;
    height:100px;
    text-align: center;
}
tbody{
   border-style: hidden;
}

tr{
   border-bottom: solid 1px #e3e3e3;
}
.wrapper{
   margin: 50px auto;
   width: 800px;
   display: flex;
   justify-content: center;   
}

.wrapper td {
   padding: 10px;
}

.wrapper > div {
   width: 398px;
   border: 1px solid #000;
   height: 400px;
   z-index: 0;
}

.wrapper a{
   text-decoration: none;
   color: #88001b;
}

/* 종현 추가한 스타일 */
/*1. 주문 상세정보  */
.topTd{
   background-color: #fff;
   color: #000;   
}

/* 2. 픽업매장 */
#pick{      
   background-color: #44242433;
   border-radius:8px;
}

.titleStoreName, .titleStoreAddr, .titleStoreNum, .titleStoreDay, .titleStoreTime, .titleStoreInfo{
   flex-basis: 160px;
   color:#757575;
}

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

#pick_li{
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

.liq_title{   
   margin-top: 30px;
   justify-content: center;
}

@media screen and (max-width: 570px) {
   table {
      width: 100%;
      margin-top: 10px;
   }
   
   .wrapper {
      width: 100%;
   }
   
   .wrapper a{
      text-align: center;
   }
   
   .orederDay {
      width: 150px;
   }
}


</style>


<h1 class="liq_title" align="center">주문이 완료되었습니다.</h1>

<h2 align="center">${dto.oi_mid }님 주문내역</h2>

<div class="wrapper">
   <table border="1" id="orderDetail" style="user-select: auto;">
      <tr>
         <td class="orderNumber topTd">주문번호</td>
         <td>${dto.oi_num }</td>
      </tr>
      <tr>
         <td class="orederDay topTd">주문일시</td>
         <td>${dto.oi_dateStr }</td>
      </tr>
      
      <tr>
         <td class="orderProduct topTd">주문내역</td>
         <td>${dto.oi_listStr }</td>
      </tr>
      <tr>
         <td class="orderPrice topTd">주문금액</td>
         <td><fmt:formatNumber value="${dto.oi_total }" pattern="#,###원"/></td>
      </tr>
      <c:if test="${dto.oi_point > 0 }">
         <tr>
            <td class="usePoint topTd">사용 포인트</td>
            <td><fmt:formatNumber value="${dto.oi_point }" pattern="#,###원"/></td>
         </tr>
      </c:if>
      <tr>
         <td class="totalPrice topTd">결제금액</td>
         <td><fmt:formatNumber value="${dto.oi_total - dto.oi_point }" pattern="#,###원"/></td>
      </tr>
      <tr>
         <td class="addPoint topTd" >포인트적립<br>(픽업완료시 적립됩니다.)</td>
         <td><fmt:formatNumber value="${(dto.oi_total - dto.oi_point)/20 }" pattern="#,###원"/></td>
      </tr>
   </table>
</div>

<h2 align="center">픽업매장</h2>

<div class="wrapper wrapper_map">
   <!-- 지도 map -->
   <div id="map" style="width:800px;height:500px;"></div>
</div>

<div class="wrapper">
   <div id="pick" style="width:800px; height:100%; user-select: auto;">    <!-- 지도에서 가맹점을 선택하면 들어갈 가맹점의 상세내용란 입니다. -->
       <ul>
          <li id="pick_li">
             <div class="titleStoreName">매장이름</div>
             <div class="pickStoreName pickInner">${fdto.f_name }</div>
          </li>
         <li id="pick_li">
            <div class="titleStoreAddr">매장주소</div>
            <div class="pickStoreAddr pickInner">${fdto.f_addr }</div>
         </li>
         <li id="pick_li">
            <div class="titleStoreNum">매장번호</div>
            <div class="pickStorePhone pickInner">${fdto.f_phone }</div>
         </li>
         <li id="pick_li">
            <div class="titleStoreDay">영업일</div>
            <div class="pickStoreDay pickInner">${fdto.f_dayBr }</div>
         </li>
         <li id="pick_li">
            <div class="titleStoreInfo">매장정보</div>
            <div class="pickStoreInfo pickInner">${fdto.f_infoBr }</div>
         </li>
      </ul>
   </div>
</div>



<div class="wrapper"><a href="MainPage">메인페이지로</a></div>




<!-- 지도 넣는 style 부분  (종현추가)-->
<style>
.customoverlay {position:relative;bottom:45px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;background:#fff;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay .title {display:block;width:auto;text-align:center;background:#fff;margin:0px 6px;font-size:12px;font-weight:500;}
.customoverlay:after {content:'';position:absolute;}
</style>  

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b65c630b20a88d8456994b96ae1b5c7f&libraries=services"></script>
<script>

var geocoder = new kakao.maps.services.Geocoder();
mapPicker('${fdto.f_id }', '${fdto.f_name}', '${fdto.f_addr}')

function mapPicker(id, name, addr){
   geocoder.addressSearch(addr, function(result, status) {
      if (status === kakao.maps.services.Status.OK) {

         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
         mapOption = {
            center: new kakao.maps.LatLng(result[0].y, result[0].x), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
            };  

         var map = new kakao.maps.Map(mapContainer, mapOption); 
         
         var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';           // 마커이미지 주소
         imageSize = new kakao.maps.Size(26, 30);                // 마커이미지의 크기
         imageOption = {offset: new kakao.maps.Point(13, 30)};   // 마커의 좌표와 일치시킬 이미지 안에서의 좌표설정

         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

         var mapTypeControl = new kakao.maps.MapTypeControl();
         map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);    

         var zoomControl = new kakao.maps.ZoomControl();
         map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

         var markerTmp;      // 마커
         var customOverlay;  // 오버레이
         var contentStr;

         markerTmp = new daum.maps.Marker({
             position: new daum.maps.LatLng(result[0].y, result[0].x),
             title: name,
             image: markerImage,
             map:map
         });

         contentStr = "<div class='customoverlay'><span class='title'>"+ name +"</span></a></div>";
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


</script>