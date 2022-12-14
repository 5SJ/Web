<%@page import="dto.OrderDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%
   OrderDTO odto = (OrderDTO) request.getAttribute("odto");
%>

<style>
table{
   margin: 0px auto;
   width: 800px;
}
.wrapper{
   margin: 50px auto;
   width: 800px;
   display: flex;
   justify-content: center;
   flex-direction: column;   
}
#map {
   width: 800px;
   height: 400px;
   z-index: 0;
}
.orderDetail{
   width: 800px;
   z-index: 0;
}

#od{
   border-bottom: 2px solid #000; 
}

.orderDetail h2{
   padding-bottom: 10px;
}

.orderDetailList .orderTitle{
   display: flex;
   align-items: center;
} 


.orderTitle{
   width: 800px;
   height: 80px;
   border-bottom: 2px solid rgba(234, 234, 234);
}

.orderTitle div{
   padding: 20px 0px; 
   float: left;
   display: flex;
   align-items: center;
}

#ordcancel{
   width: 100px;
   height: 24px;
   background-color: #fff;
   border: 1px solid #88001b;
   border-radius: 3px;
   color: #88001b;
   margin-left: 10px;
}

#orderTD{
   width: 150px;
}

.modl{
   width: 800px;
   heigh: 130px;
   display: flex;
   align-items: center;
   border-bottom: 1px solid rgba(245, 245, 245);
   padding: 10px 0px;
}

#orderlist_img{
   width: 70px;
   height: 80px;
}

#orderProname{
   font-weight: 700;
}

.odl{
   width: 700px;
   padding-left: 15px;
}

.pickmap{
   margin: 50px auto;
   width: 400px;
   justify-content: center;   
}
.pickmap > #map {
   width: 398px;
   height: 400px;
   z-index: 0;
}
.mapde{
   width: 398px;
   height: 150px;
   z-index: 0;
   border: 1px solid rgba(245,245,245);
}

#pick{
    width:800px;
    height:100%;
    user-select: auto;
   background-color: #44242433;
   border-radius:8px;
}

.titleStoreName, .titleStoreAddr, .titleStoreNum, .titleStoreDay, .titleStoreTime, .titleStoreInfo{
   flex-basis: 160px;
   color:#757575;
   border: 2px;
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

@media screen and (max-width: 570px) {

   .wrapper {
    margin: 50px auto;
    width: 400px;
    display: flex;
    justify-content: center;
   }
   
   .wrapper_map{
   margin: 0px auto;
    width: 350px;    
    display: flex;
    justify-content: center;
   flex-direction: column;
   }
   
   .orderDetailList div{
   width: 350px;
   }
   
   #map{
   margin: 0px auto;
   width: 350px;
   border: 1px solid #000;
   }
    
   #map > div{
   margin: 0px auto;
   width: 348px;
   }
   
   .wrapper>div{
   margin: 0px auto;
    width: 350px; 
   }
   
   .orderTitle{
   margin: 0;
   height: 50px;
   }
   
   #pick{
   margin: 0px auto;
    width: 350px;
   }
   
   #pick ul {
      padding-left: 10px;
   }
   
   .titleStoreName, .titleStoreAddr, .titleStoreNum, .titleStoreDay, .titleStoreTime, .titleStoreInfo{
      flex-basis: 110px;
   }
   
}

</style>


<div class="wrapper">
   <div class="orderDetail">
      <h2>?????? ????????????</h2>
      <div class="orderDetailList">
         <div class="orderTitle">
            <div id="orderTD">????????????</div>
            <div>${odto.oi_num }</div>
         </div>
         <div class="orderTitle">
            <div id="orderTD">????????????</div>
            <div>${odto.oi_dateStr }</div>
         </div>
         <div class="myorder">
            <%for(int s_index : odto.getOi_list().keySet()) {%>
            <div class="modl">
               <img id="orderlist_img" src="../image/img_Product/<%=new ProductDAO().detail(s_index).s_image %>"/>
               <div class="odl">
                  <div id="orderProname"><%=new ProductDAO().detail(s_index).s_name %></div>
                  <div id="orderProcnt">?????? ?????? : <%=odto.getOi_list().get(s_index) %>???</div>
                  <div id="orderProprice"><%=new ProductDAO().detail(s_index).s_price*odto.getOi_list().get(s_index) %>???</div>
               </div>
            </div>
            <%} %>
         </div>
         <div class="orderTitle">
            <div id="orderTD">??? ????????????</div>
            <div><fmt:formatNumber value="${odto.oi_total }" pattern="#,###???"/></div>
         </div>
         <c:if test="${odto.oi_point > 0 }">
            <div class="orderTitle">
               <div id="orderTD">????????? ??????</div>
               <div><fmt:formatNumber value="${odto.oi_point }" pattern="#,###???"/></div>
            </div>
         </c:if>
         <div class="orderTitle">
            <div id="orderTD">????????????</div>
            <div>${odto.oi_sortStr }<c:if test="${odto.oi_sort == 1 }"><button id="ordcancel" onclick="orderCancel()">?????? ??????</button></c:if></div>
         </div>
         <c:if test="${pay!=null }">
            <div class="orderTitle">
               <div id="orderTD">????????????</div>
               <div>
                  <c:choose>
                     <c:when test="${pay.getPayMethod() == 'card'}">????????????</c:when>
                     <c:when test="${pay.getPayMethod() == 'point' && pay.getEmbPgProvider() == 'kakaopay'}">???????????????</c:when>
                     <c:when test="${pay.getPayMethod() == 'samsung'}">????????????</c:when>
                     <c:when test="${pay.getPayMethod() == 'trans'}">?????????????????????</c:when>
                     <c:when test="${pay.getPayMethod() == 'vbank'}">????????????</c:when>
                     <c:when test="${pay.getPayMethod() == 'phone'}">?????????????????????</c:when>
                  </c:choose>
               </div>
            </div>
            <div class="orderTitle">
               <div id="orderTD">????????????</div>
               <div>
                  <fmt:formatNumber value="${pay.getAmount()}" pattern="#,###???"/>
                  <c:if test="${pay.getStatus() == 'cancelled'}">
                  (?????? : <fmt:formatNumber value="${pay.getCancelAmount()}" pattern="#,###???"/>)
                  </c:if>
               </div>
            </div>
            <c:if test="${pay.getApplyNum() != null && pay.getApplyNum() != ''}">
               <div class="orderTitle">
                  <div id="orderTD">????????????</div>
                  <div>${pay.getCardName()}(${pay.getApplyNum()})</div>
               </div>
            </c:if>
         </c:if>
      </div>
   </div>
</div>



<div class="wrapper wrapper_map">
<div><h2>????????????</h2></div>
   <!-- ?????? map -->
   <div id="map"></div>
</div>

<div class="wrapper">
   <div id="pick">    <!-- ???????????? ???????????? ???????????? ????????? ???????????? ??????????????? ?????????. -->
       <ul>
          <li id="pick_li">
             <div class="titleStoreName">????????????</div>
             <div class="pickStoreName pickInner">${fdto.f_name }</div>
          </li>
         <li id="pick_li">
            <div class="titleStoreAddr">????????????</div>
            <div class="pickStoreAddr pickInner">${fdto.f_addr }</div>
         </li>
         <li id="pick_li">
            <div class="titleStoreNum">????????????</div>
            <div class="pickStorePhone pickInner">${fdto.f_phone }</div>
         </li>
         <li id="pick_li">
            <div class="titleStoreDay">?????????</div>
            <div class="pickStoreDay pickInner">${fdto.f_dayBr }</div>
         </li>
         <li id="pick_li">
            <div class="titleStoreInfo">????????????</div>
            <div class="pickStoreInfo pickInner">${fdto.f_infoBr }</div>
         </li>
      </ul>
   </div>
</div>

<style>
.customoverlay {position:relative;bottom:45px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;background:#fff;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay .title {display:block;width:auto;text-align:center;background:#fff;margin:0px 6px;font-size:11px;font-weight:500;}
.customoverlay:after {content:'';position:absolute;}
</style>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b65c630b20a88d8456994b96ae1b5c7f&libraries=services"></script>
<script>

var geocoder = new kakao.maps.services.Geocoder();
mapPicker('${fdto.f_id }', '${fdto.f_name}', '${fdto.f_addr}')

function mapPicker(id, name, addr){
   geocoder.addressSearch(addr, function(result, status) {
      if (status === kakao.maps.services.Status.OK) {

         var mapContainer = document.getElementById('map'), // ????????? ????????? div 
         mapOption = {
            center: new kakao.maps.LatLng(result[0].y, result[0].x), // ????????? ????????????
            level: 5 // ????????? ?????? ??????
            };  

         var map = new kakao.maps.Map(mapContainer, mapOption); 
         
         var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';           // ??????????????? ??????
         imageSize = new kakao.maps.Size(26, 30);                // ?????????????????? ??????
         imageOption = {offset: new kakao.maps.Point(13, 30)};   // ????????? ????????? ???????????? ????????? ???????????? ????????????

         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

         var mapTypeControl = new kakao.maps.MapTypeControl();
         map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);    

         var zoomControl = new kakao.maps.ZoomControl();
         map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

         var markerTmp;      // ??????
         var customOverlay;  // ????????????
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

function orderCancel() {
   if(confirm("????????? ?????????????????????????")){
      location.href="OrderCancelReg?page=${param.page }&oi_num=${odto.oi_num }"   // ??????????????? ???????????? ???????????????
   }
}

</script>