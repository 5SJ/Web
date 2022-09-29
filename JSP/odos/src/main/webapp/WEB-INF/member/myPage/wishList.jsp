<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.wishList {
   width: 820px;
   height: 100%;
   display: flex;
}
.titleWrapper {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    padding: 10px 0px 37px;
}
.titleName {
    font-weight: 500;
    font-size: 24px;
    color: rgb(51, 51, 51);
    letter-spacing: -0.5px;
}
.zzz {
   width: 820px;
   display: flex;
   text-align: left;
}

.zzz>div {
   display: flex;
   line-height: 75px;
   text-align: center;
}

.zzz>div>a {
   text-decoration: none;
   color: #000;
}

.iimg>img {
   width: 60px;
   height: 75px;
}

.wishTitle{
   width: 600px;
   margin-left: 15px;
   margin-right: 25px;
}

.wishPrice{
   width: 127px;
}


.c {
   border: 1px solid;
   margin: 10px 0px;
}

.b {
   width: 820px;
   height: 80px;
   display: flex;
   padding: 10px 0px 10px 0px;
   border-bottom: 1px solid rgba(245, 245, 245);
}

@media screen and (max-width: 570px){
.b {
   width: 400px;
   height: 80px;
   display: flex;
   padding: 10px 0px 10px 0px;
   border-bottom: 1px solid rgba(245, 245, 245);
}	
.wishList {
   width: 400px;
   height: 100%;
   display: flex;
}
.c {
    border: 1px solid;
    width: 400px;
    margin: 10px 0px;
}
.wishTitle {
    width: 228px;
    margin-left: 15px;
    margin-right: 25px;
}
.wishPrice {
    width: 70px;
}
}
</style>


<!-- <h3>찜한상품</h3> -->
<div class="titleWrapper ">
	<h3 class="titleName ">
		찜한 상품
	</h3>
</div>
<div class="c"></div>
<div class="wishList">
   <div>
   <c:forEach items="${dto.wl_item }" var="prod" varStatus="no">
      <div class="b">   
         <div class="zzz">
            <div class="iimg"><img src="../image/img_Product/${prod.value.s_image }"></div>
            <div class="wishTitle"><a href="../main/ProdDetail?index=${prod.key }">${prod.value.s_name }</a></div>
            <div class="wishPrice"><fmt:formatNumber value="${prod.value.s_price }" pattern="#,###원"/></div>
         </div>
      </div>
   </c:forEach>   
   
   </div>
</div>